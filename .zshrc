export ZSH=$HOME/.tools/oh-my-zsh
export DEFAULT_USER=$USER
export ZSH_THEME="agnoster"
export ZSH_DISABLE_COMPFIX=true

plugins=(
  git
  ssh-agent
  zsh-syntax-highlighting
  zsh-autosuggestions
)

function addPath() {
  export PATH="$PATH:$1"
}

source $ZSH/oh-my-zsh.sh

if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi

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

eval $(thefuck --alias)

# Fix option-left / option-right in shell
bindkey -e
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
export PATH="/opt/homebrew/opt/mysql-client@5.7/bin:$PATH"

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"

source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# bun
export BUN_INSTALL="$HOME/.tools/bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Tmux auto-start/attach
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -z "$VSCODE_INJECTION" ] && [ -z "$CURSOR_TERM" ]; then
#   # If a session named "default" exists, attach to it, otherwise create it
#   if tmux has-session -t default 2>/dev/null; then
#     exec tmux attach-session -t default
#   else
#     exec tmux new-session -s default
#   fi
# fi
