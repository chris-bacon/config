$NVIM_TUI_ENABLE_TRUE_COLOR="true"
ZSH_THEME="af-magic"
COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    tmux
    zsh-syntax-highlighting
)

export EDITOR='nvim'
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.nvm/versions/node/v4.8.4/bin:$PATH
export PATH=.local/bin/stack:$PATH
export ZSH=$HOME/.oh-my-zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export NVM_DIR="$HOME/.nvm"
export TERM="xterm-256color"
[[ $TMUX != "" ]] && export TERM="screen-256color" # If running tmux, then set TERM to screen

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/_aliases.sh
source ~/_functions.sh
source $HOME/.oh-my-zsh/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
