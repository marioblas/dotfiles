# Generating SSH Keys

> Source: [https://help.github.com/articles/connecting-to-github-with-ssh/](https://help.github.com/articles/connecting-to-github-with-ssh/)

## 1. Checking for existing SSH keys

List the files in your .ssh directory, if they exist.
```bash
ls -al ~/.ssh
```

## 2. Generating a new SSH key and adding it to the ssh-agent

Create a new ssh key, using the provided email as a label.
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Start the ssh-agent in the background.
```bash
eval "$(ssh-agent -s)"
```

If you're using macOS Sierra 10.12.2 or later, you will need to modify your ~/.ssh/config file to automatically load keys into the ssh-agent and store passphrases in your keychain.
```bash
vim ~/.ssh/config
```

```text
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
```

Add your SSH private key to the ssh-agent and store your passphrase in the keychain. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_ed25519 in the command with the name of your private key file.
```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

## 3. Adding a new SSH key to your service

Copy the SSH key to your clipboard.
```bash
pbcopy < ~/.ssh/id_ed25519.pub
```

Add SSH key to your service account.

> Eg: Add SSH key to your Github account
> Go to **Settings** → Click **SSH and GPG keys** → Click **Add SSH key** → Add a descriptive label → Paste your key  into the "key" field → Click **Add SSH key**

## 4. Testing your SSH connection

> Eg: Attempt to ssh to GitHub

```bash
ssh -T git@github.com
```
