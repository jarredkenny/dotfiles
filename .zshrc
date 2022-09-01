# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH="/usr/local/bin:$HOME/.jenv/bin:/opt/homebrew/bin/:$PATH"
export ZSH=$HOME/.tools/oh-my-zsh
export DEFAULT_USER=$USER
export ZSH_THEME="agnoster"
export ZSH_DISABLE_COMPFIX=true
export ZSH_TMUX_AUTOSTART=true

plugins=(
  git
  tmux
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env/source

export LIBVIRT_DEFAULT_URI="qemu:///session"

export LAUNCH4J_HOME="/home/jarred/Apps/launch4j/"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11/"
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export PATH="/usr/lib/jvm/java/bin:/Users/jarred/Library/Android/sdk/platform-tools:/Users/jarred/Library/Python/3.8/bin:/opt/homebrew/bin:/usr/local/homebrew/bin:/$PATH"


# bun completions
[ -s "/Users/jarred/.bun/_bun" ] && source "/Users/jarred/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/jarred/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export LD_LIBRARY_PATH="/opt/homebrew/lib"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar"


# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
