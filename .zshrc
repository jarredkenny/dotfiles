export ZSH=$HOME/.tools/oh-my-zsh
export ZSH_THEME="agnoster"
export DEFAULT_USER=$USER

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env/source

export LIBVIRT_DEFAULT_URI="qemu:///system"
export LAUNCH4J_HOME="/home/jarred/Apps/launch4j/"
export JAVA_HOME=/usr/lib/jvm/java

export PATH="/usr/lib/jvm/java/bin:$PATH"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
