export PATH=$HOME/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR=nvim
# EDITOR変数がvim系だとtmuxがvi-mode用にbindkeyが上書きされるので
# 行頭と行末の移動だけEmacs風のCtrl+A/Eでできるように戻す
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

eval "$(direnv hook zsh)"
export PATH=$HOME/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=${LANG}

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOBIN=$GOPATH/bin

export OP_BIOMETRIC_UNLOCK_ENABLED=true

