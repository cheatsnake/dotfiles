# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme

setopt interactivecomments
source ~/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/.zsh_history

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_space
bindkey '^[k' history-search-backward
bindkey '^[j' history-serach-forward

alias ls="ls --color -a"
alias gc="git commit -m"

custom_paths=(
	"/home/yurace/.local/share/fnm"
	"/usr/local/go/bin"
	"/usr/local/bin"
	"/usr/local/cuda-13.0/bin"
)

for p in "${custom_paths[@]}"; do
    if [ -d "$p" ]; then
        export PATH="$p:$PATH"
    fi
done

eval "$(fnm env --use-on-cd --shell zsh)"

lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

