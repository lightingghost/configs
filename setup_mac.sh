ln -s /Users/odin/configs/vimrc /Users/odin/.vimrc
ln -s /Users/odin/configs/zshrc /Users/odin/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -L git.io/antigen > ~/antigen.zsh
chsh -s /bin/zsh
ln -s /Applications/MacVim.app/Contents/bin/* /usr/local/bin
