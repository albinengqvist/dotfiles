# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# ENVIRONMENT VARIABLES & PATHS
# ==============================================================================
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
export HELIX_RUNTIME="$HOME/.helix-src/runtime"

# Consolidate all PATH additions here
export PATH="$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# ==============================================================================
# OH MY ZSH CONFIGURATION
# ==============================================================================
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git docker kubectl)

# 🧯 Fix fpath BEFORE Oh My Zsh loads (and remove broken Ubuntu completions)
fpath=(${fpath:#/usr/share/zsh/vendor-completions})
fpath=("$HOME/.zsh/completions" $fpath)

# Ladda Oh My Zsh (This automatically runs compinit for you!)
source $ZSH/oh-my-zsh.sh

# ==============================================================================
# HISTORY & SHELL OPTIONS
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE # Ignores commands starting with a space
setopt SHARE_HISTORY
setopt prompt_subst

# ==============================================================================
# ALIASES
# ==============================================================================
alias ..="cd .."
alias ...="cd ../.."
alias gs="git status"
alias gd="git diff"
alias dc="docker compose"
alias k="kubectl"

# eza
alias ls="eza --icons --group-directories-first"
alias ld="eza -D --icons=always --color=always"
alias lf="eza -f --icons=always --color=always --git-ignore"
alias ll="eza --icons --group-directories-first -l -b --total-size -g -h"
alias la='eza -a --color=always --group-directories-first'
alias lt='eza -aT -L 2 --color=always --group-directories-first'
alias l.='eza -a | grep -E "^\."'

# ==============================================================================
# EXTERNAL PLUGINS & SCRIPTS
# ==============================================================================
# Autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Load NVM (Node Version Manager)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
