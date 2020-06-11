/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
ln -s /Users/odin/local/configs/vimrc /Users/odin/.vimrc
ln -s /Users/odin/lcoal/configs/zshrc /Users/odin/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -L git.io/antigen > ~/antigen.zsh
ln -s /Applications/MacVim.app/Contents/bin/* /usr/local/bin
