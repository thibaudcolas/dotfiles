# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install Zsh + Oh my Zsh
install zsh
install zsh-completions
curl -L http://install.ohmyz.sh | sh

# Install wget with IRI support
install wget --enable-iri

# Install RingoJS and Narwhal
# Note that the order in which these are installed is important; see http://git.io/brew-narwhal-ringo.
install ringojs
install narwhal

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/dupes/screen
install homebrew/php/php55 --with-gmp

# Install other useful binaries
install ack
install bfg
#install exiv2
install foremost
install git
install hashpump
install imagemagick --with-webp
install lynx
install nmap
install node # This installs `npm` too using the recommended installation method
install p7zip
install pigz
install pv
install rename
install rhino
install sqlmap
install tree
install ucspi-tcp # `tcpserver` et al.
install webkit2png
install xpdf
install zopfli
install whois
install unzip
install unrar
install tmux
install subversion
install ruby
install rsync
install python
install python3
install phantomjs
install pandoc
install ngrok
install nano
install mysql
install mozjpeg
install mongodb
install make
install less
install hub
install htop-osx
install nginx
install heroku-toolbelt
install gzip
install google-app-engine
install go
install gist
install fish
install exif
install drush
install dart
install curl
install clisp
install casperjs
install awk
install ant
install sbcl
install sbt
install scala
install hg
install lua

# Remove outdated versions from the cellar
cleanup
