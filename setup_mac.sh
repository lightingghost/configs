
COMPUTER_NAME="Toaster	



yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install wget -q
brew install neovim -q
brew install node -q
brew install tmux -q

# Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
chmod a+x Miniconda3-latest-MacOSX-x86_64.sh
./Miniconda3-latest-MacOSX-x86_64.sh -b
rm ./Miniconda3-latest-MacOSX-x86_64.sh 

# neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/configs/vimrc ~/.vimrc
ln -s ~/configs/init.vim ~/.config/nvim/init.vim
conda install -c conda-forge neovim -y
vim -c PlugInstall -c q -c q

# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/configs/tmux.conf.local ~/.tmux.conf.local

# zsh
ln -s ~/configs/zshrc ~/.zshrc
curl -L git.io/antigen > ~/antigen.zsh

chsh -s /bin/zsh

sudo scutil --set LocalHostName $COMPUTER_NAME
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME




