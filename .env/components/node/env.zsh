export N_PREFIX="$HOME/.tools/n";
export PATH="$N_PREFIX/bin:$PATH"
export PATH="$HOME/.tools/yarn/bin:$PATH"

export PNPM_HOME="/Users/jarred/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
