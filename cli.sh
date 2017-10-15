#!/usr/bin/env bash

# include my library helpers for colorized echo and require_brew, etc
source ./lib.sh

###############################################################################
#Install CLI tools using Homebrew                                             #
###############################################################################

bot "installing command-line tools"


read -r -p "install the UNIX tools? (shells, wget, etc) [y|N] " unixresponse
if [[ $unixresponse =~ ^(y|yes|Y) ]];then
    ok "will install UNIX tools."
else
    ok "will skip UNIX tools.";
fi

read -r -p "install runtimes? (node, python, etc) [y|N] " runtimesresponse
if [[ $runtimesresponse =~ ^(y|yes|Y) ]];then
    ok "will install runtimes."
else
    ok "will skip runtimes.";
fi

read -r -p "install npm, gem, pip packages? [y|N] " packagesresponse
if [[ $packagesresponse =~ ^(y|yes|Y) ]];then
    ok "will install packages."
else
    ok "will skip packages.";
fi

if [[ $unixresponse =~ ^(y|yes|Y) ]];then
    action "install brew packages..."

    require_brew coreutils
    require_brew moreutils
    require_brew findutils

    require_brew bash
    require_brew bash-completion
    require_brew zsh
    require_brew zsh-completions

    require_brew git
    require_brew git-extras
    require_brew git-lfs
    require_brew svn

    require_brew wget --enable-iri
    require_brew curl
    require_brew vim --override-system-vi

    require_brew nano
    require_brew tree
    require_brew whois
    require_brew openssh
    require_brew unzip
    require_brew rsync
    require_brew cloc
    require_brew diff-so-fancy
    require_brew dos2unix
    require_brew lynx
    require_brew rename
    require_brew zopfli
    require_brew knock
    require_brew shellcheck
    require_brew mackup
    require_brew hub
    require_brew heroku/brew/heroku

    brew tap bramstein/webfonttools
    require_brew sfnt2woff
    require_brew sfnt2woff-zopfli
    require_brew woff2

    require_brew ffmpeg
    require_brew imagemagick --with-webp

    ok "packages installed..."
else
    ok "skipped command-line tools.";
fi

if [[ $runtimesresponse =~ ^(y|yes|Y) ]];then
    action "install brew packages..."

    require_brew node
    require_brew ruby
    require_brew python
    require_brew python3

    require_brew pyenv
    require_brew rbenv

    require_brew mysql

    ok "packages installed..."
else
    ok "skipped runtimes.";
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
    require_npm babel-core
    require_npm babel-eslint
    require_npm browser-sync
    require_npm nodemon
    require_npm sass-lint
    require_npm stylelint
    require_npm gulp
    require_npm eslint
    require_npm eslint-plugin-springload
    require_npm hyperlink
    require_npm csscomb
    require_npm flow-bin

    require_gem bundler
    require_gem rake
    require_gem sass
    require_gem scss_lint
    require_gem travis

    require_pip pip
    require_pip virtualenv
    require_pip wrangler
    require_pip flake8
    require_pip pyflakes

    # Ideally should check if command is already available
    # require_curl [COMMAND] [URL]
    function require_curl() {
        running "curl $1"
        curl --output /dev/null --silent --head --fail "$2"
        if [[ $? -eq 0 ]]; then
            action "curl $2 | bash"
            curl -o- "$2" | sh
            ok "Close and reopen your terminal to start using nvm"
        else
            error "Could not install $1"
        fi
    }

    require_curl nvm https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh

    require_curl oh-my-zsh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

    ok "packages installed..."
else
    ok "skipped packages.";
fi

bot "Woot! All done."
