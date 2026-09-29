# Linux (Arch / Omarchy)

Configuration for running the [dotfiles](../dotfiles) on Arch Linux with
[Omarchy](https://omarchy.org/). This is a symlink deployment, unlike the macOS
`dotfiles.sh` which copies `dotfiles/` with `rsync`.

```bash
cd ~/dev/dotfiles && ./linux/install.sh
```

`./linux/install.sh --dry-run` reports what would change. Existing files are
moved to `~/.dotfiles-backup/<timestamp>/` before being replaced, never deleted.

## What gets linked

| In the repo                        | In `$HOME`                     | Notes                                                                    |
| ---------------------------------- | ------------------------------ | ------------------------------------------------------------------------ |
| `linux/zsh/zshenv`                 | `~/.zshenv`                    | Sources Omarchy's `env-bootstrap` for shells that read no other rc file. |
| `linux/zsh/zshrc`                  | `~/.zshrc`                     | oh-my-zsh, starship, zoxide, fzf, mise.                                  |
| `dotfiles/.path`                   | `~/.path`                      | Shared with macOS, branched on `uname -s`.                               |
| `dotfiles/.exports`                | `~/.exports`                   | Shared with macOS.                                                       |
| `dotfiles/.aliases`                | `~/.aliases`                   | Shared with macOS.                                                       |
| `dotfiles/.functions`              | `~/.functions`                 | Shared with macOS.                                                       |
| `dotfiles/.editorconfig`           | `~/.editorconfig`              | EditorConfig defaults for editors without repo-local config.             |
| `linux/omarchy/hypr/input.lua`     | `~/.config/hypr/input.lua`     | Keyboard repeat, tap to click, no natural scrolling, no DPMS on input.   |
| `linux/omarchy/hypr/looknfeel.lua` | `~/.config/hypr/looknfeel.lua` | Gaps, borders, scrolling layout width.                                   |

## Zsh on Omarchy

Omarchy ships bash (`/etc/skel/.bashrc` sources
`/usr/share/omarchy/default/bash/rc`). Zsh is not preinstalled and nothing in
Omarchy reads `/etc/profile` for it, hence `zshenv`. Two steps need `sudo`:

```bash
sudo pacman -S --needed zsh && chsh -s /usr/bin/zsh
```

Everything else needs no elevation: `~/.oh-my-zsh` is cloned by
`linux/install.sh` and all configuration is linked into `$HOME`.

## Omarchy-specific notes

- Ghostty sets `TERM=xterm-ghostty` and propagates it over SSH
  (`shell-integration-features = ssh-env`), but Arch's ncurses only ships the
  entry as `ghostty`. Anything that reads terminfo then fails — `less` (so `bat`,
  `git`, `man` when they page) prints
  `'xterm-ghostty': unknown terminal type.`. `linux/omarchy/ghostty-terminfo.sh`
  copies the `ghostty` entry to `~/.terminfo/x/xterm-ghostty` (run by
  `linux/install.sh`, no `sudo`). The alternative is adding `ssh-terminfo` to
  Ghostty's `shell-integration-features` on the client, which uploads the entry
  to each remote host — that is the fix to prefer for machines you don't manage.
- `~/.config/hypr/*.lua` are user files. Omarchy's defaults live in
  `/usr/share/omarchy/default/hypr/` and are loaded by `~/.config/hypr/hyprland.lua`
  _before_ these overrides, so package updates improve the defaults without
  touching this repo. `omarchy refresh hyprland` is the exception: it overwrites
  every user Lua file with the Omarchy defaults, replacing the symlinks — re-run
  `linux/install.sh` afterwards.
- Theme switching (`omarchy theme set`) rewrites Omarchy-managed files such as
  `~/.config/tmux/tmux.conf`, `~/.config/btop/btop.conf`, the VS Code theme
  extension and terminal colours. It does not touch `~/.config/starship.toml`,
  which is why the prompt can be customised here.
- Don't deploy the macOS `dotfiles/.tmux.conf`: a `~/.tmux.conf` takes
  precedence over Omarchy's `~/.config/tmux/tmux.conf` and the repo's version
  uses options removed in tmux 3.x. Append what you want to the Omarchy file
  instead.
- macOS-only automation (`install.sh`, `apps.sh`, `cli.sh`, `macos.sh`,
  `config/iterm`, `config/RectangleConfig.json`) is not ported. Package
  installation maps to `omarchy pkg add`, `omarchy pkg aur add` and the
  `omarchy install …` helpers; `macos.sh` preferences map to the Hyprland Lua
  files above and to `omarchy` commands (`theme`, `font`, `default editor`,
  `default browser`, `default terminal`).
