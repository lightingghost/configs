#! /bin/bash

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'
sudo apt-get update
sudo apt-get install --yes --no-install-recommends cuda-11-2 libcudnn8=8.1.0.77-1+cuda11.2 libcudnn8-dev=8.1.0.77-1+cuda11.2 cuda-toolkit-11-2
