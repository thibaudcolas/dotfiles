#!/usr/bin/env bash

# Make Ghostty's TERM work on Omarchy.
#
# Ghostty sets TERM=xterm-ghostty, and its shell integration propagates that
# into SSH sessions (shell-integration-features = ssh-env). Arch's ncurses only
# ships the entry as `ghostty`, so on the remote host every program that reads
# terminfo fails — less, tput, setterm, tset — including anything that pages:
#
#   ~ ❯ bat ~/.bashrc
#   'xterm-ghostty': unknown terminal type.
#
# (that message comes from `less`, which bat uses as its pager).
#
# Copy the installed `ghostty` entry under the name Ghostty expects, into the
# user-level terminfo directory ncurses searches before /usr/share/terminfo.
# No sudo, idempotent, and a no-op once xterm-ghostty resolves — for example
# after adding `ssh-terminfo` to Ghostty's shell integration options, or once
# Ghostty/terminfo ships the entry.

entry="$HOME/.terminfo/x/xterm-ghostty"

if infocmp xterm-ghostty > /dev/null 2>&1; then
    exit 0
fi

if [ ! -e /usr/share/terminfo/g/ghostty ]; then
    echo "no ghostty terminfo entry to derive xterm-ghostty from" >&2
    exit 1
fi

mkdir -p "$(dirname "$entry")"
cp /usr/share/terminfo/g/ghostty "$entry"
echo "installed $entry from /usr/share/terminfo/g/ghostty"
