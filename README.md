#### VIM
Copy [@bry](https://github.com/bry)'s local VIM dev env config

1. Backup or remove your existing vim configuration (~/.vimrc and ~/.vim)

2. Run
```bash
git clone https://github.com/bry/vundle.git ~/.vim/bundle/vundle &&
curl https://raw.github.com/bry/dotfiles/master/.vimrc > ~/.vimrc &&
vim -c "BundleInstall"
```
