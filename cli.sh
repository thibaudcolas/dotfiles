#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
#Install CLI tools using Homebrew                                             #
###############################################################################

bot "installing command-line tools"


read -r -p "install brew packages? [y|N] " unixresponse
if [[ $unixresponse =~ ^(y|yes|Y) ]];then
    ok "will install brew packages."
else
    ok "will skip brew packages.";
fi

read -r -p "install npm, gem, pip packages? [y|N] " packagesresponse
if [[ $packagesresponse =~ ^(y|yes|Y) ]];then
    ok "will install packages."
else
    ok "will skip packages.";
fi

if [[ $unixresponse =~ ^(y|yes|Y) ]];then
    action "install brew packages..."

    # For WOFF2 encoding.
    brew tap bramstein/webfonttools

    require_brew aspell
    require_brew autoconf
    require_brew autojump
    require_brew avifenc
    require_brew bash
    require_brew bash-completion
    require_brew coreutils
    require_brew curl
    require_brew deno
    require_brew diff-so-fancy
    require_brew docker
    require_brew docker-compose
    require_brew dos2unix
    require_brew exiftool
    require_brew fizz
    require_brew flac
    require_brew fmt
    require_brew fnm
    require_brew gcc
    require_brew git
    require_brew git-extras
    require_brew git-lfs
    require_brew gron
    require_brew guile
    require_brew heroku
    require_brew heroku-node
    require_brew htop
    require_brew hub
    require_brew hugo
    require_brew hunspell
    require_brew hyperfine
    require_brew imagemagick --with-webp
    require_brew jpeg-xl
    require_brew jq
    require_brew lua
    require_brew lynx
    require_brew mackup
    require_brew moreutils
    require_brew mozjpeg
    require_brew mysql
    require_brew nano
    require_brew ncurses
    require_brew node
    require_brew ocaml
    require_brew pandoc
    require_brew perl
    require_brew postgresql
    require_brew pyenv
    require_brew qhull
    require_brew r
    require_brew rbenv
    require_brew redis
    require_brew rename
    require_brew ripgrep
    require_brew rsync
    require_brew ruby
    require_brew rust
    require_brew sfnt2woff
    require_brew sfnt2woff-zopfli
    require_brew shellcheck
    require_brew sqlite
    require_brew starship
    require_brew the_silver_searcher
    require_brew tree
    require_brew unzip
    require_brew vim --override-system-vi
    require_brew vnu
    require_brew watchman
    require_brew webp
    require_brew wget --enable-iri
    require_brew whois
    require_brew woff2
    require_brew x264
    require_brew x265
    require_brew yarn --without-node
    require_brew youtube-dl
    require_brew zopfli
    require_brew zsh
    require_brew zsh-completions

    ok "packages installed..."
else
    ok "skipped command-line tools.";
fi

if [[ $packagesresponse =~ ^(y|yes|Y) ]];then
    action "install npm / gem / pip packages..."

    function require_gem() {
        running "gem $1"
        if [[ $(gem list --local | grep "$1" | head -1 | cut -d' ' -f1) != "$1" ]];
            then
                action "gem install $1"
                gem install "$1"
        fi
        ok
    }

    function require_pip() {
        running "pip $1"
        if [[ $(pip list --local | grep "$1" | head -1 | cut -d' ' -f1) != "$1" ]];
            then
                action "pip install $1"
                pip install "$1"
        fi
        ok
    }

    npmlist=$(npm list -g)
    function require_npm() {
        running "npm $1"
        echo "$npmlist" | grep "$1@" > /dev/null
        if [[ $? != 0 ]]; then
            action "npm install -g $1"
            npm install -g "$1"
        fi
        ok
    }

    require_npm npm
    require_npm browser-sync
    require_npm nodemon
    require_npm stylelint
    require_npm eslint
    require_npm trello-backup
    require_npm serve
    require_npm prettier

    require_gem bundler
    require_gem rake

    require_pip pip
    require_pip virtualenv
    require_pip flake8
    require_pip isort
    require_pip black

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ok "packages installed..."
else
    ok "skipped packages.";
fi

bot "Woot! All done."
