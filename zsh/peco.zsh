function peco-ghq () {
  local selected_dir=$(ghq list | peco --query "$LBUFFER")
  BUFFER="cd $(ghq root)/${selected_dir}"
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-ghq
bindkey '^g' peco-ghq

function peco-history-selection() {
    BUFFER=$(history -n 1 | tac  | awk '!a[$0]++' | peco)
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^h' peco-history-selection
