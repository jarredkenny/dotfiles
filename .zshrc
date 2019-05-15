export ZSH=$HOME/.tools/oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
export DEFAULT_USER=$USER

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env/source

export LIBVIRT_DEFAULT_URI="qemu:///system"
export LAUNCH4J_HOME="/home/jarred/Apps/launch4j/"
