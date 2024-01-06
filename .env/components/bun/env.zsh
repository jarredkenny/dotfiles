export BUN_INSTALL=$HOME/.tools/bun
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
export PATH="$PATH:$BUN_INSTALL/bin"
