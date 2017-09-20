# =========================================================
# ZSH specifics
# =========================================================
plugins=(cargo themes rust rustup pip python web-search fzf diab taskwarrior)
# Favorites: "arrow"
ZSH_THEME="agnoster"
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.oh-my-zsh-custom-config"
source $ZSH/oh-my-zsh.sh

# =========================================================
# Update PATH
# =========================================================
export PATH="/usr/local/bin:$PATH"
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Add rustup to PATH
export PATH="$HOME/.cargo/bin:$PATH" # Add rustup to path


[ -f /Users/NiCoretti/.travis/travis.sh ] && source /Users/NiCoretti/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# =========================================================
# Configuration/Dofile management
# =========================================================
GIT_CMD=`command -v git`
alias cfg='${GIT_CMD} --git-dir=$HOME/.cfg/ --work-tree=$HOME'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
