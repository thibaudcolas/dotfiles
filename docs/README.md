# Documentation

## Automated Installation on Windows `(¬_¬)`

Automated Software Installation is not supported. Please have a look at the following ressources:

* [Ninite](https://ninite.com/) – Install and update all your programs at once
* [Chocolatey](https://chocolatey.org/) – Chocolatey is a Machine Package Manager
* [Boxstarter](http://boxstarter.org/) – Repeatable, reboot resilient windows environment installations

## Automated Installation on Linux `(¬.¬)`

Automated Software Installation is not supported – but you can probably get something out of `apt-get`, and enjoy the dotfiles!

## Command-line

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.
