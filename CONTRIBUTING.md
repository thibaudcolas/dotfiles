# Contributing

## dotfiles sync

```sh
rsync -avh --no-perms --existing ~/ ./dotfiles/
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
