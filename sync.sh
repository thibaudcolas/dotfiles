#!/usr/bin/env bash

# Syncs the dotfiles from this computer's home directory back into the repo,
# mirroring dotfiles.sh which does the reverse (repo -> home).
# Only files that already exist in the repo are updated (--existing).

DEST_FOLDER="./dotfiles/"

function doIt() {
	while IFS= read -r -d '' entry; do
		rsync --exclude ".DS_Store" -avh --no-perms --existing "$HOME/$(basename "$entry")" "$DEST_FOLDER";
	done < <(find "$DEST_FOLDER" -mindepth 1 -maxdepth 1 -print0)
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt;
else
	read -p "This may overwrite files in the dotfiles repo with the ones from your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
