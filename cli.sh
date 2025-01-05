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

    # See current: brew --list | pbcopy
    tools=(
      aspell
      autoconf
      autojump
      avifenc
      awscli
      bash
      bash-completion
      bat
      cloc
      coreutils
      curl
      deno
      diff-so-fancy
      docker
      docker-completion
      docker-compose
      docutils
      dos2unix
      duckdb
      exiftool
      eza
      ffmpeg
      fizz
      flac
      flyctl
      fmt
      fnm
      fzf
      gallery-dl
      gcc
      gettext
      gh
      git
      git-extras
      git-filter-repo
      git-lfs
      git-redate
      gource
      gron
      guile
      heroku
      heroku-node
      htop
      hub
      hugo
      hunspell
      hyperfine
      imagemagick
      imagemagick --with-webp
      jpeg-turbo
      jpeg-xl
      jq
      just
      litestream
      lua
      lynx
      mackup
      moreutils
      mozjpeg
      mysql
      nano
      ncurses
      neovim
      node
      ocaml
      opam
      pandoc
      perl
      php
      pipx
      pngquant
      pnpm
      postgresql
      pyenv
      qhull
      r
      rbenv
      readline
      redis
      rename
      ripgrep
      rsync
      ruby
      ruff
      rust
      rustup
      semgrep
      sfnt2woff
      sfnt2woff-zopfli
      shellcheck
      sqlite
      starship
      the_silver_searcher
      tree
      unzip
      uv
      vale
      vim
      vim --override-system-vi
      virtualenv
      vnu
      watchman
      webp
      wget
      wget --enable-iri
      wget2
      whois
      woff2
      x264
      x265
      yarn
      yarn --without-node
      yt-dlp
      zeromq
      zopfli
      zoxide
      zsh
      zsh-completions
    )

    for tool in "${tools[@]}"; do
      require_brew "$tool"
    done

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

    packages=(
      @githubnext/github-copilot-cli
      @lhci/cli
      @openacr/openacr
      all-contributors-cli
      browser-sync
      eslint
      nodemon
      prettier
      serve
      stylelint
      trello-backup
      webpack-bundle-analyzer
    )

    for package in "${packages[@]}"; do
      require_npm "$package"
    done

    require_gem bundler
    require_gem rake
    require_gem github-backup

    packages=(
      black
      coverage
      curlylint
      djhtml
      doc8
      flake8
      ipython
      pre_commit
      virtualenv
    )

    for package in "${packages[@]}"; do
      require_pip "$package"
    done

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ok "packages installed..."
else
    ok "skipped packages.";
fi

bot "Woot! All done."
