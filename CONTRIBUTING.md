# Contributing

## dotfiles sync

To copy the dotfiles from this repo into your home directory, run:

```sh
./dotfiles.sh
```

To copy the dotfiles from your home directory back into this repo, run:

```sh
./sync.sh
```

## Shell scripts

If you want to tinker with the bash scripts, please install [ShellCheck](https://github.com/koalaman/shellcheck) and use it to check your changes.

```bash
# Debian distribs
apt-get install shellcheck
# OSX
brew install shellcheck

shellcheck *.sh

# Its output should be empty:
# $ shellcheck *.sh | wc -l
#        0
```
