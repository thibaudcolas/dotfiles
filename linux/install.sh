#!/usr/bin/env bash

# Symlink the Linux / Omarchy configuration from this repo into $HOME.
#
# Mirrors dotfiles.sh (which rsyncs dotfiles/ onto macOS): files the repo
# fully owns are symlinked, so repo edits apply immediately. Files that
# Omarchy manages in ~/.config/hypr are symlinked too, but Omarchy's defaults
# stay in place behind them — see linux/README.md.
#
# Usage: ./linux/install.sh [--dry-run]

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Include Adam Eivy's library helpers for colorized echo.
# shellcheck source=../lib.sh
source "$REPO_DIR/lib.sh"

DRY_RUN=false
if [ "$1" = "--dry-run" ]; then
    DRY_RUN=true
fi

BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d%H%M%S)"

# link <repo path> <path in $HOME>
link() {
    local source_path="$REPO_DIR/$1"
    local target_path="$HOME/$2"

    if [ ! -e "$source_path" ]; then
        error "missing source: $1"
        return 1
    fi

    if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
        ok "$2 already linked"
        return 0
    fi

    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        running "$2 exists, backing up to ${BACKUP_DIR#$HOME/}/$(basename "$target_path")"
        if ! $DRY_RUN; then
            mkdir -p "$BACKUP_DIR/$(dirname "$2")"
            mv "$target_path" "$BACKUP_DIR/$2"
        fi
    fi

    running "link $2 -> $1"
    if ! $DRY_RUN; then
        mkdir -p "$(dirname "$target_path")"
        ln -s "$source_path" "$target_path"
    fi
    ok
}

bot "Linking Linux / Omarchy configuration into $HOME"

# Shell (shared with macOS: these files are OS-aware).
link dotfiles/.path .path
link dotfiles/.exports .exports
link dotfiles/.aliases .aliases
link dotfiles/.functions .functions
link dotfiles/.editorconfig .editorconfig

# Zsh.
link linux/zsh/zshenv .zshenv
link linux/zsh/zshrc .zshrc

# Hyprland user overrides (loaded after Omarchy's defaults).
link linux/omarchy/hypr/input.lua .config/hypr/input.lua
link linux/omarchy/hypr/looknfeel.lua .config/hypr/looknfeel.lua

# Zsh itself, and oh-my-zsh which ~/.zshrc expects.
if command -v zsh > /dev/null 2>&1; then
    ok "zsh is installed"
else
    warn "zsh is not installed. Install it and make it your login shell with:"
    warn "  sudo pacman -S --needed zsh && chsh -s /usr/bin/zsh"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    ok "oh-my-zsh is installed"
else
    running "cloning oh-my-zsh"
    if ! $DRY_RUN; then
        git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" > /dev/null
    fi
    ok
fi

if command -v hyprctl > /dev/null 2>&1 && [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
    running "reloading Hyprland"
    if ! $DRY_RUN; then
        hyprctl reload > /dev/null
    fi
    ok
fi

# Ghostty's TERM has no entry in Arch's terminfo database, which breaks less —
# and so anything that pages, such as bat — in Ghostty sessions and over SSH.
running "checking xterm-ghostty terminfo"
if ! $DRY_RUN; then
    "$REPO_DIR/linux/omarchy/ghostty-terminfo.sh" ||
        warn "could not install the xterm-ghostty terminfo entry"
fi
ok

bot "All done. Restart your terminal, then check: hyprctl getoption input:repeat_rate"
