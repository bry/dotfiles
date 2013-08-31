#### VIM
First, backup/remove existing vim configuration (~/.vimrc and ~/.vim) then run:

```bash
git clone https://github.com/vadimr/vundle.git ~/.vim/bundle/vundle &&
curl https://raw.github.com/vadimr/dotfiles/master/.vimrc > ~/.vimrc &&
vim -c "BundleInstall"
```
