export ZSH=$HOME/.tools/oh-my-zsh
export DEFAULT_USER=$USER
export ZSH_THEME="agnoster"
export ZSH_DISABLE_COMPFIX=true

plugins=(
  git
  ssh-agent
)

function addPath() {
  export PATH="$PATH:$1"
}

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export LIBVIRT_DEFAULT_URI="qemu:///session"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11/"
export ANDROID_HOME="/Users/jarred/Library/Android/sdk"
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

addPath $ANDROID_HOME/emulator
addPath $ANDROID_HOME/cmdline-tools/latest/bin
addPath $ANDROID_HOME/platform-tools
addPath /usr/lib/jvm/java/bin
addPath /usr/local/bin
addPath /opt/homebrew/bin
addPath ~/Library/Python/3.8/bin

export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"
export LD_LIBRARY_PATH="/opt/homebrew/lib"
export DYLD_LIBRARY_PATH="/opt/homebrew/CEllaR"

source $HOME/.env/source

export PATH="/opt/homebrew/opt/php@5.6/bin:$PATH"
export PATH="/opt/homebrew/opt/php@5.6/sbin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/jarred/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/jarred/.tools/bun/_bun" ] && source "/Users/jarred/.tools/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.tools/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:$HOME/.maestro/bin

# nim
export PATH=/Users/jarred/.nimble/bin:$PATH

export BW_SESSION="tp/qozsJ2snL2v+pTsNqarZ3DZCDs0mS8NKP2Gr5DmKWK+Y4BFliBYLRdtq0pB83QVxzmxD5SE13pk/SPuZigw=="

eval $(thefuck --alias)

# Fix option-left / option-right in shell
bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
export PATH="/opt/homebrew/opt/mysql-client@5.7/bin:$PATH"

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
