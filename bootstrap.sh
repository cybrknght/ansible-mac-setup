#!/bin/bash

#Install XCode Comand Line Tools
xcode-select -p 1>/dev/null;check_xcode=$?
if [ "$check_xcode" -eq 2 ]; then
  echo "Installing xcode. Follow the wizard"
  xcode-select --install
else
  echo "Xcode installed skipping"
fi

#Install homebrew
if which brew 1>/dev/null; then
  echo "Brew Installed, skipping"
else
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/brandon-tharp/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#Install python3
if brew ls --versions python3 > /dev/null; then
  echo "Python3 installed, skipping"
else
  echo "Installing python3"
  brew install python3
fi

#Update Pip3 and install ansible
check_pip=$(pip3 list -o | grep -c pip)
if [ $check_pip -eq 0 ]; then
  echo "Pip Up to date, skipping"
else
  echo "Update Pip3"
  pip3 install --upgrade pip
fi

if brew ls --versions ansible > /dev/null; then
  echo "Ansible installed, skipping"
else
  echo "Installing Ansible"
  brew install ansible
fi

# Pull latest community module (temporary homebrew cask fixes)
echo "Ansible Collections Install"
ansible-galaxy collection install -r requirements.yml

echo "Ansible Role Install"
ansible-galaxy role install -r requirements.yml

# Run ansible playbook
echo "Playbook Run"
ansible-playbook homedir.yml --connection=local --ask-become-pass

# Old
#echo "Please install Xcode before continuing. Press any key when ready to proceed"
#read  -n 1

# Install homebrew
#echo "Installing homebrew"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install python3
#echo "Installing python3"
#brew install python3

# Install ansible
#brew install ansible@2.9
#brew link --overwrite ansible@2.9

# Run ansible playbook
#ansible-playbook homedir.yml --connection=local

# Pull latest community module (temporary homebrew cask fixes)
#ansible-galaxy collection  install community.general --force
#ansible-galaxy install gantsign.visual-studio-code-extensions
