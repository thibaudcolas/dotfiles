[ -n "$PS1" ] && source ~/.bash_profile;

eval "$(starship init bash)"
eval "$(fnm completions --shell bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(zoxide init bash)"
eval "$(pyenv init - bash)"
