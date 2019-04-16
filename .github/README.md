Bootstrap
```bash
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'; \
git clone --bare git@github.com:jarredkenny/dotfiles.git .dotfiles; \
config checkout; \
.env/bootstrap;
```
