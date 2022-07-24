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
    require_cask 1password
    require_cask airflow
    require_cask alfred
    require_cask appcleaner
    require_cask beekeeper-studio
    require_cask bettertouchtool
    require_cask betterzip
    require_cask bitwarden
    require_cask blue-sherpa
    require_cask browserstacklocal
    require_cask caffeine
    require_cask controllermate
    require_cask cyberduck
    require_cask dbeaver-community
    require_cask discord
    require_cask docker
    require_cask dropbox
    require_cask firefox
    require_cask font-archivo-narrow
    require_cask font-dejavu
    require_cask font-fira-code
    require_cask font-gentium-book-basic
    require_cask font-inconsolata
    require_cask font-inconsolata-g-for-powerline
    require_cask font-inconsolata-go-nerd-font
    require_cask font-metropolis
    require_cask font-open-sans
    require_cask font-pt-sans
    require_cask font-roboto
    require_cask font-source-code-pro
    require_cask font-source-sans-pro
    require_cask font-ubuntu
    require_cask forticlient
    require_cask gather
    require_cask google-backup-and-sync
    require_cask google-chrome
    require_cask google-chrome-canary
    require_cask handbrake
    require_cask harvest
    require_cask imageoptim
    require_cask iterm2
    require_cask keycastr
    require_cask licecap
    require_cask logitech-g-hub
    require_cask loopback
    require_cask microsoft-auto-update
    require_cask miro
    require_cask monodraw
    require_cask ngrok
    require_cask nordvpn
    require_cask nvalt
    require_cask obs
    require_cask pdf-squeezer
    require_cask postgres
    require_cask postman
    require_cask psequel
    require_cask qlcolorcode
    require_cask qlmarkdown
    require_cask quicklook-json
    require_cask screaming-frog-seo-spider
    require_cask sequel-pro
    require_cask sequential
    require_cask simple-comic
    require_cask sizeup
    require_cask sketch
    require_cask slack
    require_cask steam
    require_cask the-unarchiver
    require_cask transmission
    require_cask ukelele
    require_cask vagrant
    require_cask virtualbox
    require_cask visual-studio-code
    require_cask vlc
    require_cask webpquicklook
    require_cask zoom

    ok "casks installed..."
else
    ok "skipped apps.";
fi

