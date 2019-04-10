export ZSH=/home/jarred/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER=$USER

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


export PATH=/home/jarred/.npm-global/bin:/opt/gradle/gradle-3.4.1/bin:$PATH
source $HOME/.cargo/env


export PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/home/jarred/.nimble/bin:/home/jarred/.bin:$PATH

export LIBVIRT_DEFAULT_URI="qemu:///system"

export LAUNCH4J_HOME="/home/jarred/Apps/launch4j/"

alias lsd="ls -ltrh"
alias fuck='sudo !!'
alias fucking='sudo'
alias gitlog='git log --pretty=format:'\''%Cred%h %Cblue%ci%Creset %G? %an %Cgreen%s%Creset'\'''
alias how="curl cht.sh/"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# N (node version manager)
export N_PREFIX=/home/jarred/.n
export PATH="/home/jarred/bin:/home/jarred/.n/bin:$PATH"
