# Ansible Mac Setup

Repo for bootstrapping and maintaining a reasonably complete state of my preferred macOS workstation config.

## Prerequisites
1. Setup your SSH key

```bash
mkdir .ssh
chmod 0700 .ssh
cp ~/Google\ Drive/My\ Drive/Linux/SSH/id_rsa* ~/.ssh/
cp ~/Google\ Drive/My\ Drive/Linux/SSH/config ~/.ssh/
```
2. Prepare the github repo location mkdir playbooks

```bash
mkdir ~/playbooks
git clone git@github.com:cybrknght/ansible-mac-setup.git
```
3. Be sure to have logged into the App Store on the Mac
4. Might have to open VS Code once installed to set the settings and install extensions

NOTE: Might need to configure github username and email

## How to Run
To run the entire repo:
```bash
cd ~/playbook/ansible-mac-setup
./bootstrap.sh
```
The script will install the pre-requisites to run ansible.  After the prerequisites in the script have been run you can run ansible with individual tags to update/run individual plays:

* zsh
* vscode
* iterm2
* aws #future
* config # runs zsh, vscode, iterm2 and aws (future)

To run individual tags using ansible:
```bash
ansible-playbook homedir.yml --connection-local --tags <tag>
```

## Settings
* Oh-my-zsh/Powerlevel10k
    - I had to customize my .zshrc file by hand first to install the plugins (from homebrew)
    - I also installed powerline10k and ran `p10k config` to configure it and then copied the config file to ansible
* To save your iterm2 settings -> Preferences -> General -> Preferences -> check 'Load preferences from a custom folder or URL:' -> save it to ''~/.config/iterm2/'
    - This will save the settings to 'com.googlecode.iterm2.plist'
    - You can set it to save upon quit, automatically or manually -> I chose manually
    - Copy the file to your ansible playbook to save it.
