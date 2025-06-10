# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

# Tema – snyggt och rent
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git docker kubectl)

# Ladda Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Historik
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Prompt
setopt prompt_subst

# PATH
export PATH="$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$PATH"

# Färg på ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Aliaser
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gd="git diff"
alias dc="docker compose"
alias k="kubectl"

## eza
alias ls="eza --icons --group-directories-first"
alias ld="eza -D --icons=always --color=always"
alias lf="eza -f --icons=always --color=always --git-ignore"
alias ll="eza --icons --group-directories-first -l -b --total-size -g -h"
alias la='eza -a --color=always --group-directories-first'
alias lt='eza -aT -L 2 --color=always --group-directories-first'
alias l.='eza -a | grep -E "^\."'

# Autosuggestions (om installerat)
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting (om installerat)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# 🧯 Ta bort trasiga completions innan compinit
if [ -d /usr/share/zsh/vendor-completions ]; then
  for f in /usr/share/zsh/vendor-completions/_*; do
    [ -e "$f" ] || fpath=("${fpath[@]/$f}")
  done
fi

# Ladda completions
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.local/bin/env"
