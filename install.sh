#!/usr/bin/env bash

echo -en "Preparing world domination...\n"

# Include Adam Eivy's library helpers.
source ./lib.sh

# Prevent sleep while install is running
caffeinate &

#####
# Introduction
#####

awesome_header

fullname=$(osascript -e "long user name of (system info)")

bot "Hi $fullname. I'm going to make your macOS system better. We're going to:"
action "install Xcode's command line tools"
action "install Homebrew and brew cask"
action "install all the apps that are commonly used"
action "if you feel like it, we will also install more things"

bot "One more thing: I'll need your password from time to time."

read -r -p "Let's go? [y|N] " response
if [[ $response =~ ^(y|yes|Y) ]];then
    ok
else
    exit -1;
fi

#####
# install Xcode command line tools
#####

running "checking Xcode CLI install"
xcode_select="xcode-select --print-path"
xcode_install=$($xcode_select) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    bot "You are missing the Xcode CLI tools. I'll launch the install for you, but then you'll have to restart the process again."
    running "After that you'll need to paste the command and press Enter again."

    read -r -p "Let's go? [y|N] " response
    if [[ $response =~ ^(y|yes|Y) ]];then
        xcode-select --install
    fi

    exit -1
fi
ok

bot "OK, let's roll..."

#####
# install homebrew
#####

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    action "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
        error "unable to install homebrew, script $0 abort!"
        exit -1
    fi
fi
ok

# Make sure we’re using the latest Homebrew
running "updating homebrew"
brew update
ok

./apps.sh

bot "Woot! All done. If you want to go further, here are some options:"

read -r -p "install extra development command-line tools? (node, curl, etc) [y|N] " cli_response
if [[ $cli_response =~ ^(y|yes|Y) ]];then
    ok "will install command-line tools."
else
    ok "will skip command-line tools.";
fi

read -r -p "create reusable folder structure? [y|N] " folder_response
if [[ $folder_response =~ ^(y|yes|Y) ]];then
    ok "will create the folder structure."
else
    ok "will skip folder structure.";
fi

read -r -p "install dotfiles? [y|N] " dotfiles_response
if [[ $dotfiles_response =~ ^(y|yes|Y) ]];then
    ok "will install dotfiles."
else
    ok "will skip dotfiles.";
fi

if [[ $cli_response =~ ^(y|yes|Y) ]];then
    ./cli.sh
else
    ok "skipped command-line tools.";
fi

if [[ $folder_response =~ ^(y|yes|Y) ]];then
    mkdir -p ~/Dev
    mkdir -p ~/Dev/playground
    mkdir -p ~/Dev/forks
    mkdir -p ~/Dev/thibaudcolas
    mkdir -p ~/Dev/springload
    mkdir -p ~/Dev/django
    mkdir -p ~/Dev/djangocon
    mkdir -p ~/Dev/wagtail

    ok "Created common folders"
else
    ok "skipped common folders.";
fi

if [[ $dotfiles_response =~ ^(y|yes|Y) ]];then
    ./dotfiles.sh --force
else
    ok "skipped dotfiles.";
fi

bot "That's it for the automated process. If you want to do more, have a look at the README!"
