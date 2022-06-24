if [[ $OSTYPE == *linux* ]]; then
    source ~/antigen.zsh
else
    source ~/antigen.zsh
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
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
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
__conda_setup="`~/miniconda3/bin/conda 'shell.zsh' 'hook' 2> /dev/null`"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then
        . "~/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias vim=nvim
alias svim="sudo nvim"
alias oldvim=vim

export GCLOUD_PATH="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$GCLOUD_PATH/path.zsh.inc" ]; then . "$GCLOUD_PATH/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$GCLOUD_PATH/completion.zsh.inc" ]; then . "$GCLOUD_PATH/completion.zsh.inc"; fi

alias startcpu="gcloud compute instances start zzp-cpu --project=sc-lens-delivery --zone=us-west1-b"
alias stopcpu="gcloud compute instances stop zzp-cpu --project=sc-lens-delivery --zone=us-west1-b"
alias startgpu="gcloud compute instances start zzp-dev --project=sc-lens-delivery --zone=us-west1-b"
alias stopgpu="gcloud compute instances stop zzp-dev --project=sc-lens-delivery --zone=us-west1-b"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
