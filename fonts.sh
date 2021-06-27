#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
#Install fonts using Homebrew                                                 #
###############################################################################

bot "installing fonts"

brew tap homebrew/cask-fonts

require_cask font-inconsolata
require_cask font-inconsolata-g-for-powerline
require_cask font-inconsolata-go-nerd-font
require_cask font-open-sans
require_cask font-pt-sans
require_cask font-source-code-pro
require_cask font-source-sans-pro
require_cask font-ubuntu
require_cask font-dejavu
require_cask font-fira-code

bot "Woot! All done."
