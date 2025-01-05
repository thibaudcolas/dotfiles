export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="spaceship"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Automatically upgrade itself without prompting.
DISABLE_UPDATE_PROMPT=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-extras
  gh
  docker
  docker-compose
  last-working-dir
  fnm
)

source $ZSH/oh-my-zsh.sh

# Dotfiles configuration

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# zsh-specific config
# ====================

# Appends every command to the history file once it is executed
setopt inc_append_history
# Share history between
setopt share_history

# Will make it ask you before executing rm with a star rm folder/*.
unsetopt RM_STAR_SILENT

eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
eval "$(pyenv init - zsh)"

# if [ -z "$SCRIPT_SESSION" ]; then
#     export SCRIPT_SESSION=$HOME/.script-sessions/$(date +%Y%m%d_%H%M%S)_session.log
#     exec script -q -t 10 -a $SCRIPT_SESSION
# fi


# export PATH="$HOME/.config/herd-lite/bin:$PATH"
# export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
