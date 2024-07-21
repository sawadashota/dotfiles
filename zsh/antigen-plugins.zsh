source $ZDOTDIR/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle direnv
antigen bundle aws
# antigen bundle docker
antigen bundle tig
antigen bundle golang
antigen bundle pip
antigen bundle python

antigen bundle mollifier/anyframe
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle greymd/docker-zsh-completion

# Theme
antigen theme frontcube

# apply
antigen apply
