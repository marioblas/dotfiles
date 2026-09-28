#!/bin/bash

input=$(cat)

dir=$(echo "$input" | jq -r '.workspace.current_dir')
model=$(echo "$input" | jq -r '.model.display_name')
model_id=$(echo "$input" | jq -r '.model.id')
output_style=$(echo "$input" | jq -r '.output_style.name')

dim="\033[2m"
reset="\033[0m"
bold="\033[1m"
cyan="\033[36m"
yellow="\033[33m"
green="\033[32m"
red="\033[31m"
magenta="\033[35m"
blue="\033[34m"

# Color helper: green <50, yellow 50-79, red >=80
color_for_pct() {
    local p=$1
    if [ "$p" -ge 80 ]; then echo "$red"
    elif [ "$p" -ge 50 ]; then echo "$yellow"
    else echo "$green"; fi
}

# Format a duration in seconds → "2h13m" / "47m" / "3d4h"
fmt_duration() {
    local s=$1
    [ "$s" -lt 0 ] && s=0
    local d=$((s / 86400))
    local h=$(((s % 86400) / 3600))
    local m=$(((s % 3600) / 60))
    if [ "$d" -gt 0 ]; then
        printf "%dd%dh" "$d" "$h"
    elif [ "$h" -gt 0 ]; then
        printf "%dh%dm" "$h" "$m"
    else
        printf "%dm" "$m"
    fi
}

# --- Line 1: orientation ---

dir_name=$(basename "$dir")

git_info=""
if git -C "$dir" rev-parse --git-dir &>/dev/null; then
    branch=$(git -C "$dir" -c core.useBuiltinFSMonitor=false rev-parse --abbrev-ref HEAD 2>/dev/null || echo '')
    if [ -n "$branch" ]; then
        if git -C "$dir" -c core.useBuiltinFSMonitor=false diff-index --quiet HEAD -- 2>/dev/null; then
            git_info="$branch"
        else
            git_info="${branch}*"
        fi
    fi
fi

model_str="${cyan}${model}${reset}"

ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
ctx_color=$(color_for_pct "$ctx_pct")

now=$(date +%s)
fh_pct_raw=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
sd_pct_raw=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

effort=$(echo "$input" | jq -r '.effort.level // empty')
case "$effort" in
    max)    effort_str="${red}max${reset}" ;;
    xhigh)  effort_str="${red}xhigh${reset}" ;;
    high)   effort_str="${yellow}high${reset}" ;;
    medium) effort_str="${blue}medium${reset}" ;;
    low)    effort_str="${green}low${reset}" ;;
    "")     effort_str="" ;;
    *)      effort_str="${dim}${effort}${reset}" ;;
esac

sep="${dim} · ${reset}"
line="${dir_name}${reset}"
[ -n "$git_info" ] && line+="${sep}${magenta}${git_info}${reset}"
line+="${sep}${model_str}"
[ -n "$effort_str" ] && line+="${sep}${dim}effort${reset} ${effort_str}"
line+="${sep}${dim}ctx${reset} ${ctx_color}${ctx_pct}%${reset}"

if [ -n "$fh_pct_raw" ]; then
    fh_pct=$(printf "%.0f" "$fh_pct_raw")
    fh_color=$(color_for_pct "$fh_pct")
    fh_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
    fh_suffix=""
    [ -n "$fh_reset" ] && fh_suffix=" ${dim}↻$(fmt_duration $((fh_reset - now)))${reset}"
    line+="${sep}${dim}current${reset} ${fh_color}${fh_pct}%${reset}${fh_suffix}"
fi

if [ -n "$sd_pct_raw" ]; then
    sd_pct=$(printf "%.0f" "$sd_pct_raw")
    sd_color=$(color_for_pct "$sd_pct")
    sd_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')
    sd_suffix=""
    [ -n "$sd_reset" ] && sd_suffix=" ${dim}↻$(fmt_duration $((sd_reset - now)))${reset}"
    line+="${sep}${dim}weekly${reset} ${sd_color}${sd_pct}%${reset}${sd_suffix}"
fi

if [ "$output_style" != "null" ] && [ "$output_style" != "default" ]; then
    line+="${sep}${dim}${output_style}${reset}"
fi

printf "%b" "$line"
