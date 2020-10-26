# =========================================================
# ZSH specifics
# =========================================================
plugins=(cargo themes rust rustup pip python web-search fzf diab xxd-rs nc-aliases)
# Favorites: "arrow"
ZSH_THEME="agnoster"
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.oh-my-zsh-custom-config"
source $ZSH/oh-my-zsh.sh
export EDITOR=nvim

# =========================================================
# Update PATH
# =========================================================
export PATH="/usr/local/bin:$PATH"
# Add RVM to PATH for scripting
# Add rustup to PATH
export PATH="$HOME/.cargo/bin:$PATH" # Add rustup to path
export PATH="$PATH:/usr/local/anaconda3/bin" # Add anaconda to the path
export PATH="$HOME/.t32/bin:$PATH" # Add t32 to the path

[ -f /Users/NiCoretti/.travis/travis.sh ] && source /Users/NiCoretti/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =========================================================
# Configuration/Dofile management
# =========================================================
GIT_CMD=`command -v git`
alias config='${GIT_CMD} --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias local-config='${GIT_CMD} --git-dir=$HOME/.cfg-local/ --work-tree=$HOME'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
