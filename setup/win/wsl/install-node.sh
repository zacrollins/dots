# install curl
sudo apt-get install curl

# use curl to download and install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# verify install succeeded
command -v nvm
# No error is good

# install node with NVM
# latest
nvm install node
# LTS
nvm install --lts
# 14.17.0
nvm install 14.17.0

# list install node versions
nvm ls

# check Node and NPM version
node --version
npm --version

# to use specific node version
# latest
nvm use node
# LTS
nvm use --lts
# 14.17.0
nvm use 14.17.0