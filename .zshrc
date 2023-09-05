ZSH_THEME="agnoster" # set by `omz`

export PATH="$PATH:/usr/local/bin:/opt/homebrew/bin"
export ZSH=$HOME/.tools/oh-my-zsh
export DEFAULT_USER=$USER
export ZSH_THEME="agnoster"
export ZSH_DISABLE_COMPFIX=true

plugins=(
  git
  ssh-agent
)
 
function addPath () {
  export PATH="$PATH:$1"
}

source $ZSH/oh-my-zsh.sh

export LIBVIRT_DEFAULT_URI="qemu:///session"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11/"


export ANDROID_HOME="/Users/jarred/Library/Android/sdk"
addPath $ANDROID_HOME/emulator
addPath $ANDROID_HOME/cmdline-tools/latest/bin
addPath $ANDROID_HOME/platform-tools
addPath /usr/lib/jvm/java/bin

addPath /opt/homebrew/bi
addPath ~/Library/Python/3.8/bin


export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


# bun completions
[ -s "/Users/jarred/.bun/_bun" ] && source "/Users/jarred/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/jarred/.bun"
addPath $BUN_INSTALL/bin

# Deno
export DENO_INSTALL="/Users/jarred/.deno"
addPath $DENO_INSTALL/bin

export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export LD_LIBRARY_PATH="/opt/homebrew/lib"
export DYLD_LIBRARY_PATH="/opt/homebrew/CEllaR"

source $HOME/.env/source

export EDITOR="nvim"

export PATH="/opt/homebrew/opt/php@5.6/bin:$PATH"
export PATH="/opt/homebrew/opt/php@5.6/sbin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH=$PATH:$HOME/.maestro/bin

# pnpm
export PNPM_HOME="/Users/jarred/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
