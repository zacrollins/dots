#!/bin/bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# mssql driver and tools need these env variables defined to install
HOMEBREW_NO_ENV_FILTERING=1
ACCEPT_EULA=Y

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Tap into additional Homebrew channels
declare -a taps=(
  'buo/cask-upgrade'
  'caskroom/cask'
  'caskroom/versions'
  'homebrew/bundle'
  'homebrew/core'
  'homebrew/cask-fonts'
  'cjbassi/gotop'
  'microsoft/mssql-release'
)
for tap in "${taps[@]}"; do
  brew tap "$tap"
done

# install brew apps
declare -a brews=(
  'azure-cli'
  'azure-functions-core-tools'
  'coreutils'
  'curl'
  'freerdp'
  'git'
  'gotop'
  'htop-osx'
  'lastpass-cli'
  'mas'
  'msodbcsql17'
  'mssql-tools'
  'node'
  'openssh'
  'openssl'
  'packer'
  'pyenv'
  'tree'
  'tmux'
  'wget'
  'zsh'
  'zsh-completions'
  'zsh-autosuggestions'
  'zsh-syntax-highlighting'
)

# install mas apps (mac app store cli)
mas install 1295203466 # Microsoft Remote Desktop 10

# install casks
declare -a cask_apps=(
    'authy'
    'azure-data-studio'
    'dotnet-sdk'
    'font-fira-code'
    'google-chrome'
    'iterm2'
    'lastpass'
    'microsoft-azure-storage-explorer'
    'microsoft-teams'
    'onedrive'
    'parallels'
    'parallels-virtualization-sdk'
    'postman'
    'powershell'
    'slack'
    'vagrant'
    'vagrant-manager'
    'visual-studio-code'
    'visual-studio'
    'xquartz'
)

for app in "${cask_apps[@]}"; do
    brew cask install "$app"
done

# pip installs
# mssql-cli
# tod0