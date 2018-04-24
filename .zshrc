# =========================================================
# ZSH specifics
# =========================================================
plugins=(cargo themes rust rustup pip python web-search fzf diab taskwarrior)
# Favorites: "arrow"
ZSH_THEME="agnoster"
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.oh-my-zsh-custom-config"
source $ZSH/oh-my-zsh.sh
export EDITOR=nivm

# =========================================================
# Update PATH
# =========================================================
export PATH="/usr/local/bin:$PATH"
# Add RVM to PATH for scripting
# Add rustup to PATH
export PATH="$HOME/.cargo/bin:$PATH" # Add rustup to path
export PATH=/usr/local/anaconda3/bin:"$PATH" # Add anaconda to the path

[ -f /Users/NiCoretti/.travis/travis.sh ] && source /Users/NiCoretti/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =========================================================
# Configuration/Dofile management
# =========================================================
GIT_CMD=`command -v git`
alias cfg='${GIT_CMD} --git-dir=$HOME/.cfg/ --work-tree=$HOME'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
