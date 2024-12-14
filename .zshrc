# =========================================================
# ZSH specifics
# =========================================================
plugins=(themes rust pip python web-search fzf xxd-rs nc-aliases opt)
# Favorites: "arrow"
# ZSH_THEME="agnoster"
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.oh-my-zsh-custom-config"
source $ZSH/oh-my-zsh.sh
setopt inc_append_history
setopt share_history
export EDITOR=nvim

# =========================================================
# Update PATH
# =========================================================
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

[ -f /Users/NiCoretti/.travis/travis.sh ] && source /Users/NiCoretti/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =========================================================
# Configuration/Dofile management
# =========================================================
GIT_CMD=`command -v git`
alias config='${GIT_CMD} --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias local-config='${GIT_CMD} --git-dir=$HOME/.cfg-local/ --work-tree=$HOME'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "/home/nicoretti/.ghcup/env" ] && source "/home/nicoretti/.ghcup/env" # ghcup-env
eval "$(starship init zsh)"
