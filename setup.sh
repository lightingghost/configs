
COMPUTER_NAME="Toaster"

if [[ "$OSTYPE" == "darwin"* ]]; then
# Mac OSX

    # Install
    yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install wget -q
    brew install neovim -q
    brew install node -q
    brew install tmux -q

    # Miniconda
    CONDA_FILE_NAME="Miniconda3-latest-Linux-x86_64.sh"

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

    # Install
    sudo apt update
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt install -y neovim nodejs tmux zsh make 

    # Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt install docker-ce
    sudo usermod -a -G docker $USER
    sudo chmod 666 /var/run/docker.sock

    # Miniconda
    CONDA_FILE_NAME="Miniconda3-latest-Linux-x86_64.sh"
fi

# Miniconda
wget https://repo.anaconda.com/miniconda/$CONDA_FILE_NAME
chmod a+x $CONDA_FILE_NAME
./$CONDA_FILE_NAME -b
rm ./$CONDA_FILE_NAME

# neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/nvim
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


# git
git config --global user.email "zhenp3ngzhou@gmail.com"
git config --global user.name "Zhenpeng Zhou"
git config --global alias.amend 'commit --amend'

chsh -s /bin/zsh

#sudo scutil --set LocalHostName $COMPUTER_NAME
#sudo scutil --set ComputerName $COMPUTER_NAME
#sudo scutil --set HostName $COMPUTER_NAME

