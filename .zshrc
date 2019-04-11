export ZSH=/home/jarred/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER=$USER

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env/source

export LIBVIRT_DEFAULT_URI="qemu:///system"
export LAUNCH4J_HOME="/home/jarred/Apps/launch4j/"
