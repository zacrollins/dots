#!/bin/bash

# # install all mac updates
# sudo softwareupdate -i -a --restart

# # install apple's cli tools (xcode)
# xcode-select --install

# # Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tap into additional Homebrew channels
declare -a taps=(
  'azure/functions'
  'buo/cask-upgrade'
  'homebrew/bundle'
  'homebrew/cask'
  'homebrew/cask-drivers'
  'homebrew/cask-fonts'
  'homebrew/cask-versions'
  'homebrew/core'
  'homebrew/services'
  'koekeishiya/formulae'
  'microsoft/git'
)
for tap in "${taps[@]}"; do
  brew tap "$tap"
done

# install brew apps
declare -a brews=(
  'autojump'
  'azure-cli'
  'azure/functions/azure-functions-core-tools'
  'broot'
  'cmatrix'
  'curl'
  'figlet'
  'git'
  'htop'
  'iftop'
  'lastpass-cli'
  'lsd'
  'neovim'
  'openssl'
  'pyenv'
  'ranger'
  'reattach-to-user-namespace'
  'tmux'
  'tree'
  'watch'
  'wget'
  'zsh'
  'zsh-autosuggestions'
  'zsh-completions'
  'zsh-history-substring-search'
  'zsh-syntax-highlighting'
  'koekeishiya/formulae/skhd'
  'yabai'
)

for brew in "${brews[@]}"; do
    brew install "$brew"
done

# install casks
declare -a cask_apps=(
  'alacritty'
  'authy'
  'azure-data-studio'
  'docker'
  'dotnet-sdk'
  'easy-move-plus-resize'
  'font-fira-code'
  'font-hack-nerd-font'
  'git-credential-manager-core'
  'google-chrome'
  'iterm2'
  'lastpass'
  'logitech-options'
  'maccy'
  'microsoft-azure-storage-explorer'
  'microsoft-teams'
  'onedrive'
  'parallels'
  'parallels-virtualization-sdk'
  'postman'
  'powershell'
  'homebrew/cask-versions/powershell-preview'
  'qlcolorcode'
  'qlimagesize'
  'qlmarkdown'
  'qlstephen'
  'qlvideo'
  'quicklook-json'
  'quicklookase'
  'rectangle'
  'slack'
  'vagrant'
  'vagrant-manager'
  'visual-studio'
  'visual-studio-code'
  'visual-studio-code-insiders'
  'xquartz'
)

for app in "${cask_apps[@]}"; do
    brew cask install "$app"
done