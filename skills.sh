#!/usr/bin/env bash

# Find skills
pnpx skills add https://github.com/vercel-labs/skills --skill find-skills

# Skills for real engineers
pnpx skills@latest add mattpocock/skills

# Improve: audits any codebase and writes implementation plans for other agents to execute
pnpx skills add https://github.com/shadcn/improve --skill improve
