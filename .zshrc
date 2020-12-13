export ZSH=$HOME/.tools/oh-my-zsh
export DEFAULT_USER=$USER
export ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env/source

export LIBVIRT_DEFAULT_URI="qemu:///session"

export LAUNCH4J_HOME="/home/jarred/Apps/launch4j/"
export JAVA_HOME=/usr/lib/jvm/java

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export PATH="/usr/lib/jvm/java/bin:$PATH"

if [ -z "$TMUX" ]
then
   tmux attach -t TMUX || tmux new -s TMUX
fi

