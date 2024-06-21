
COMPUTER_NAME="Toaster"

if [[ "$OSTYPE" == "darwin"* ]]; then
# Mac OSX
    # Install
    yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew install wget neovim node tmux -q

    sudo scutil --set LocalHostName $COMPUTER_NAME
    sudo scutil --set ComputerName $COMPUTER_NAME
    sudo scutil --set HostName $COMPUTER_NAME

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    . /etc/os-release

    if [ "$ID" == "rhel" ]; then
        # Install
	sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
	sudo yum install -y neovim tmux zsh make 
        sudo dnf module install nodejs:16

    else
        # Install
        sudo apt update
        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt install -y nodejs tmux zsh make 

	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
    fi
    # Miniconda
    CONDA_FILE_NAME="Miniconda3-latest-Linux-x86_64.sh"

fi



# nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim 
rm -rf ~/.config/nvim
ln -s ~/configs/nvim_config ~/.config/nvim
nvim

# tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
ln -s ~/configs/tmux.conf.local ~/.tmux.conf.local

# zsh
ln -s ~/configs/zshrc ~/.zshrc
curl -L git.io/antigen > ~/antigen.zsh
source ~/antigen.zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/white/blue/g' ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/mh.zsh-theme
    sed -i '' 's/white/blue/g' ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/mh.zsh-theme.antigen-compat
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sed -i 's/white/green/g' ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/mh.zsh-theme
    sed -i 's/white/green/g' ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/mh.zsh-theme.antigen-compat
    git config --global credential.helper store
fi


# git
git config --global user.email "zhenp3ngzhou@gmail.com"
git config --global user.name "Zhenpeng Zhou"
git config --global alias.amend 'commit --amend'

chsh -s /bin/zsh


