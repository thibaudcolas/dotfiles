#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
#Install GUI tools using Homebrew                                             #
###############################################################################

bot "installing Springload Tools™"

read -r -p "install the everyday tools? (Browsers, Slack, etc) [y|N] " everydayresponse
if [[ $everydayresponse =~ ^(y|yes|Y) ]];then
    ok "will install everyday tools."
else
    ok "will skip everyday tools.";
fi

read -r -p "install the developer tools? (iTerm, VS Code, etc) [y|N] " developerresponse
if [[ $developerresponse =~ ^(y|yes|Y) ]];then
    ok "will install developer tools."
else
    ok "will skip developer tools.";
fi

read -r -p "install the Quicklook plugins? [y|N] " quicklookresponse
if [[ $quicklookresponse =~ ^(y|yes|Y) ]];then
    ok "will install Quicklook plugins."
else
    ok "will skip Quicklook plugins.";
fi

bot "Let's go! Make sure to check on your computer regularly in case something needs your password."

if [[ $everydayresponse =~ ^(y|yes|Y) ]];then
    action "install brew cask packages..."

    require_cask firefox
    require_cask google-chrome

    require_cask google-drive
    require_cask lastpass
    require_cask alfred
    require_cask skype
    require_cask google-hangouts
    require_cask slack
    require_cask caprine
    require_cask harvest
    require_cask vlc
    require_cask airflow
    require_cask twitch
    require_cask dropbox
    require_cask soundcleod
    require_cask diskwave
    require_cask pgadmin3
    require_cask postman
    require_cask java8
    require_cask licecap
    require_cask 1password
    require_cask steam
    require_cask controllermate
    require_cask sketch
    require_cask nvalt
    require_cask sizeup
    require_cask the-unarchiver
    require_cask cyberduck
    require_cask houdahgeo
    require_cask sequential
    require_cask simple-comic
    require_cask keycastr
    require_cask caffeine
    require_cask betterzip
    require_cask bettertouchtool
    require_cask appcleaner

    ok "casks installed..."
else
    ok "skipped everyday tools.";
fi

if [[ $developerresponse =~ ^(y|yes|Y) ]];then

    action "install brew cask packages..."

    require_cask sublime-text3
    require_cask visual-studio-code

    require_cask google-chrome-canary
    require_cask opera

    require_cask iterm2
    require_cask vagrant
    require_cask virtualbox
    require_cask ngrok

    require_cask imagealpha
    require_cask imageoptim

    require_cask sequel-pro
    require_cask pgadmin3
    require_cask postgres

    ok "casks installed..."
else
    ok "skipped developer tools.";
fi

if [[ $quicklookresponse =~ ^(y|yes|Y) ]];then

    action "install brew cask packages..."

    require_cask qlcolorcode
    require_cask qlmarkdown
    require_cask quicklook-json
    require_cask suspicious-package

    ok "casks installed..."
else
    ok "skipped Quicklook plugins";
fi
