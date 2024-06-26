if [[ $OSTYPE == *linux* ]]; then
    source ~/antigen.zsh
else
    source ~/antigen.zsh
fi

[[ -r /etc/cloudide_profile ]] && . /etc/cloudide_profile || true
 
[[ -r ~/.cloudiderc ]] && . ~/.cloudiderc || true
 
#if [[ -r /workspace/mlx/../vscode/prep_env.sh]]; then
#  source /workspace/mlx/../vscode/prep_env.sh
#fi
#if [[ -r /opt/tiger/mlx_deploy/mlxrc]]; then
#  source /opt/tiger/mlx_deploy/mlxrc
#fi
export PYTHONPATH=""
# if [ -f /opt/tiger/mlx_deploy/pythonpath_rc ]; then
#     source /opt/tiger/mlx_deploy/pythonpath_rc
# fi
# if [ -f /opt/tiger/rh2_bashrc ]; then
#     source /opt/tiger/rh2_bashrc
# fi
# source /opt/tiger/mlx_deploy/userrc

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle history-substring-search
antigen bundle vi-mode

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
    export CUDA_HOME="/usr/local/cuda"
    export PATH="$CUDA_HOME/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64"
    export PATH="$PATH:/opt/bin"
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
else
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$PATH"
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
if [ -f "$GCLOUD_PATH/path.zsh.inc" ]; then source "$GCLOUD_PATH/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$GCLOUD_PATH/completion.zsh.inc" ]; then source "$GCLOUD_PATH/completion.zsh.inc"; fi

alias startcpu="gcloud compute instances start zzp-cpu --project=sc-lens-delivery --zone=us-west1-b"
alias stopcpu="gcloud compute instances stop zzp-cpu --project=sc-lens-delivery --zone=us-west1-b"
alias startgpu="gcloud compute instances start zzp-dev --project=sc-lens-delivery --zone=us-west1-b"
alias stopgpu="gcloud compute instances stop zzp-dev --project=sc-lens-delivery --zone=us-west1-b"
alias starttpu="gcloud alpha compute tpus tpu-vm start zzp-dev-tpu --project=devsnapchat --zone=us-central1-a"
alias stoptpu="gcloud alpha compute tpus tpu-vm stop zzp-dev-tpu --project=devsnapchat --zone=us-central1-a"
alias sshtpu="gcloud compute firewall-rules create allow-ssh --direction=INGRESS --network=tpu --action=ALLOW --rules=tcp:22 --project=devsnapchat && gcloud alpha compute tpus tpu-vm ssh zzp-dev-tpu --project=devsnapchat --zone=us-central1-a --ssh-flag='-4 -L 9001:localhost:9001'"
alias startz="open -a /Applications/Zscaler/Zscaler.app --hide; sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl load {} \;"
alias killz="find /Library/LaunchAgents -name '*zscaler*' -exec launchctl unload {} \;;sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl unload {} \;"


export PATH="$HOME/.jenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GRADLE_HOME=/opt/gradle/gradle-7.4.2
export PATH=${PATH}:${GRADLE_HOME}/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=/Users/odin/.local/bin:$PATH

export JVIEWER_JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8-x64.jdk
