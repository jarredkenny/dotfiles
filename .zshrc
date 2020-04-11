export ZSH=$HOME/.tools/oh-my-zsh
export DEFAULT_USER=$USER
export ZSH_THEME="agnoster"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
