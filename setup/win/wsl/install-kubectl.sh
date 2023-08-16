# Update the apt package index and install packages needed to use the Kubernetes apt repository:
sudo apt-get install -y ca-certificates curl
# Download the Google Cloud public signing key:
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# Add the Kubernetes apt repository:
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# Update apt package index with the new repository and install kubectl:
sudo apt-get update
sudo apt-get install -y kubectl


# install kubectx and kubens
sudo git clone https://github.com/ahmetb/kubectx /usr/local/kubectx
sudo ln -s /usr/local/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /usr/local/kubectx/kubens /usr/local/bin/kubens
sudo ln -s /usr/local/kubectx/completion/_kubectx.zsh /usr/local/share/zsh/site-functions/_kubectx.zsh
sudo ln -s /usr/local/kubectx/completion/_kubens.zsh /usr/local/share/zsh/site-functions/_kubens.zsh