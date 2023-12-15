
COMPUTER_NAME="Toaster"

if [[ "$OSTYPE" == "darwin"* ]]; then
# Mac OSX
    # Install
    yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew install wget neovim node tmux -q
    brew tap microsoft/git
    brew install --cask google-cloud-sdk microsoft-git docker -q

    # Miniconda
    if [[ $(uname -m) == 'arm64' ]]; then
        CONDA_FILE_NAME="Miniconda3-latest-MacOSX-arm64.sh" 
    else
        CONDA_FILE_NAME="Miniconda3-latest-MacOSX-x86_64.sh"
    fi

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

        # Docker
	sudo yum install -y yum-utils
 	sudo yum-config-manager \
    		--add-repo \
    		https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        sudo usermod -a -G docker $USER

    else
        # Install
        sudo apt update
        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
        sudo add-apt-repository ppa:neovim-ppa/stable
        sudo apt install -y neovim nodejs tmux zsh make 

        # Docker
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
        sudo apt install docker-ce
        sudo usermod -a -G docker $USER
        sudo chmod 666 /var/run/docker.sock

        # Bazel
        sudo apt install apt-transport-https curl gnupg
        curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
        sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

        sudo apt update && sudo apt install bazel
    fi
    # Miniconda
    CONDA_FILE_NAME="Miniconda3-latest-Linux-x86_64.sh"

fi

# Miniconda
wget https://repo.anaconda.com/miniconda/$CONDA_FILE_NAME
chmod a+x $CONDA_FILE_NAME
./$CONDA_FILE_NAME -b
rm ./$CONDA_FILE_NAME

# neovim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# mkdir ~/.config/nvim
# ln -s ~/configs/vimrc ~/.vimrc
# ln -s ~/configs/init.vim ~/.config/nvim/init.vim
# conda install -c conda-forge neovim -y
# vim -c PlugInstall -c q -c q

# nvchad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
rm -rf ~/.config/nvim/lua/custom
ln -s ~/configs/nvchad_config_nvim_lua_custom ~/.config/nvim/lua/custom
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


