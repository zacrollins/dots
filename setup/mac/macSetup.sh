#!/bin/bash

# # install all mac updates
# sudo softwareupdate -i -a --restart

# # install apple's cli tools (xcode)
# xcode-select --install

# # Install Homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update/Upgrade brew
# brew update
# brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Tap into additional Homebrew channels
declare -a taps=(
    'azure/functions'
    #  'buo/cask-upgrade'
    #  'homebrew/bundle'
    'homebrew/cask-fonts'
    'homebrew/cask-versions'
    'homebrew/services'
    'koekeishiya/formulae'
    'microsoft/git'
)
for tap in "${taps[@]}"; do
    brew tap "$tap"
done

# install brew apps
declare -a brews=(
    'azure-cli'
    'azure/functions/azure-functions-core-tools'
    'azure/kubelogin/kubelogin'
    'bat'
    'coreutils'
    'exa'
    'fx'
    'git'
    'helm'
    'jq'
    'kubernetes-cli'
    'neovim'
    'openssl'
    #   'pyenv'
    #  'reattach-to-user-namespace'
    #  'tmux'
    'readline'
    'skhd'
    'starship'
    'tealdeer'
    'tree'
    'watch'
    'wget'
    'yabai'
    'zsh'
    'zsh-autosuggestions'
    'zsh-completions'
    'zsh-history-substring-search'
    'zsh-syntax-highlighting'
)

for brew in "${brews[@]}"; do
    brew install "$brew"
done

# install casks
declare -a cask_apps=(
    '1password'
    '1password-cli'
    'asana'
    'alacritty'
    'authy'
    'azure-data-studio'
    'brave-browser'
    'docker'
    'dotnet-sdk'
    #  'easy-move-plus-resize'
    'font-caskaydia-cove-nerd-font'
    'font-fira-code-nerd-font'
    'font-hack-nerd-font'
    'git-credential-manager'
    'google-chrome'
    'hammerspoon'
    'karabiner-elements'
    'maccy'
    'microsoft-azure-storage-explorer'
    'microsoft-edge'
    'microsoft-outlook'
    'microsoft-teams'
    'onedrive'
    'powershell'
    'powershell-preview'
    'slack'
    'via'
    'visual-studio-code'
    'visual-studio-code-insiders'
)

for app in "${cask_apps[@]}"; do
    brew install --cask "$app"
done
