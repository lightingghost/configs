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

setopt HIST_FIND_NO_DUPS

if [[ $OSTYPE == *linux* ]]; then
# export PATH="/home/odin/miniconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize
    export CUDA_HOME="/usr/local/cuda"
    export PATH="$CUDA_HOME/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64"
    export PATH="$PATH:$HOME/.cargo/bin"
else
# export PATH="/Users/odin/miniconda3/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize
    export CUDA_HOME="/usr/local/cuda"
    export PATH="$CUDA_HOME/bin:$PATH"
    export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib"
    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/opt/intel/lib"
    export LD_LIBRARY_PATH="$DYLD_LIBRARY_PATH"
    export PATH="$PATH:$HOME/local/bin"
fi



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/odin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/odin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/odin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/odin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias vim=nvim
alias svim="sudo nvim"
alias oldvim=vim
