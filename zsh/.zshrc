# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting For zsh
autoload colors && colors

# 他のターミナルとヒストリーを共有
setopt share_history
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# 重複を記録しない
setopt hist_ignore_dups
# 先頭がスペースで始まる場合は履歴に追加しない
setopt hist_ignore_space
# 開始と終了を記録
setopt EXTENDED_HISTORY
# ヒストリーに重複を表示しない
setopt histignorealldups
HISTSIZE=10000
SAVEHIST=10000

# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd
# 自動でpushdを実行
setopt auto_pushd
# pushdから重複を削除
setopt pushd_ignore_dups

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2
# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward
# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdr タブでリストを表示
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
# cdrコマンドで履歴にないディレクトリにも移動可能に
zstyle ":chpwd:*" recent-dirs-default true

# Auto zcompile
if [ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc -o $ZDOTDIR/alias.zsh -nt  $ZDOTDIR/.zshrc.zwc -o $ZDOTDIR/exports.zsh -nt  $ZDOTDIR/.zshrc.zwc ]; then
   zcompile $ZDOTDIR/.zshrc
fi

source $ZDOTDIR/antigen-plugins.zsh
source $ZDOTDIR/alias.zsh
source $ZDOTDIR/exports.zsh
source $ZDOTDIR/peco.zsh

# NixOS Home Manager
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# asdf
# . $(brew --prefix asdf)/libexec/asdf.sh
. "$HOME/.nix-profile/share/asdf-vm/asdf.sh"
. "$HOME/.nix-profile/share/bash-completion/completions/asdf.bash"


