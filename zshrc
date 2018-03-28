if [[ $OSTYPE == *linux* ]]; then
    source /home/odin/antigen.zsh
else
    source /Users/odin/antigen.zsh
fi


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle history-substring-search

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme mh

# Tell Antigen that you're done.
antigen apply

if [[ $OSTYPE == *linux* ]]; then
    export PATH="/home/odin/miniconda3/bin:$PATH"
    export CUDA_HOME="/usr/local/cuda"
    export PATH="$CUDA_HOME/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64"
    export PATH="$PATH:$HOME/.cargo/bin"
else
    export PATH="/Users/odin/miniconda3/bin:$PATH"
    export CUDA_HOME="/usr/local/cuda"
    export PATH="$CUDA_HOME/bin:$PATH"
    export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$DYLD_LIBRARY_PATH"
fi
