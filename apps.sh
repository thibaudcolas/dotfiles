#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
#Install GUI tools using Homebrew                                             #
###############################################################################

bot "installing common tools"

read -r -p "install apps [y|N] " appsresponse
if [[ $appsresponse =~ ^(y|yes|Y) ]];then
    ok "will install everyday tools."
else
    ok "will skip everyday tools.";
fi

bot "Let's go! Make sure to check on your computer regularly in case something needs your password."

if [[ $appsresponse =~ ^(y|yes|Y) ]];then
    action "install brew cask packages..."

    # For Logitech G-Hub
    brew tap homebrew/cask-drivers

    # To update this list,
    # brew list --cask | pbcopy
    casks=(
      1password
      alfred
      appcleaner
      avifquicklook
      beekeeper-studio
      bettertouchtool
      betterzip
      bitwarden
      browserstacklocal
      caffeine
      capcut
      cursor
      cyberduck
      dbeaver-community
      discord
      docker
      dropbox
      element
      firefox
      font-dejavu
      font-fira-code
      font-inconsolata
      font-monaspace
      font-open-sans
      font-roboto
      font-source-code-pro
      google-backup-and-sync
      google-chrome
      google-chrome-canary
      google-chrome@canary
      google-cloud-sdk
      handbrake
      imageoptim
      iterm2
      keycastr
      licecap
      logitech-g-hub
      loom
      loopback
      mattermost
      microsoft-auto-update
      miro
      monodraw
      ngrok
      nordvpn
      nvalt
      obs
      obsidian
      opera
      orbstack
      pdf-squeezer
      poedit
      pop
      postman
      qlcolorcode
      qlimagesize
      qlmarkdown
      qlstephen
      screaming-frog-seo-spider
      screen-studio
      sequential
      shadow
      shortcat
      signal
      sizeup
      slack
      steam
      sublime-text
      suspicious-package
      telegram
      the-unarchiver
      transmission
      ukelele
      vagrant
      virtualbox
      visual-studio-code
      vlc
      warp
      webpquicklook
      zoom
      zulip
    )

    for cask in "${casks[@]}"; do
      require_cask "$cask"
    done

    ok "casks installed..."
else
    ok "skipped apps.";
fi

