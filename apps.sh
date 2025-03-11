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

    # To update this list,
    # brew list --cask | pbcopy
    casks=(
      1password
      alfred
      appcleaner
      avifquicklook
      beekeeper-studio
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
      font-fira-code
      font-inconsolata
      font-monaspace
      font-open-sans
      font-roboto
      font-source-code-pro
      google-chrome
      google-chrome-canary
      google-chrome@canary
      google-drive
      google-cloud-sdk
      handbrake
      whatsapp
      figma
      calibre
      imageoptim
      iterm2
      keycastr
      licecap
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
      postman
      qlcolorcode
      qlimagesize
      qlmarkdown
      qlstephen
      rectangle
      multitouch
      screaming-frog-seo-spider
      screen-studio
      sequential
      shadow
      shortcat
      signal
      slack
      steam
      sublime-text
      suspicious-package
      the-unarchiver
      transmission
      ukelele
      virtualbox
      visual-studio-code
      vlc
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

