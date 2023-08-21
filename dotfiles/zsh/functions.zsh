su() {
    # su: Do sudo to a command, or do sudo to the last typed command if no argument given
    if [[ $# == 0 ]]; then
        sudo "$(history -p '!!')"
    else
        sudo "$@"
    fi
}

brewup() {
    # brewup: update brew and upgrade all brew packages

    # Light blue looks good with my current colorscheme
    TEXTCOLOR='\033[1;34m'
    # Update homebrew, and local base of available packages and versions
    printf "${TEXTCOLOR}Updating homebrew and local base of available packages and
    versions...\n"
    brew update
    # Install new versions of outdated packages
    printf "${TEXTCOLOR}Upgrading outdated homebrew packages...\n"
    brew upgrade
    # Cache cleanup of unfinished downloads
    printf "${TEXTCOLOR}Cleaning cache of unfinished downloads...\n"
    brew cleanup
    # Show problems if any
    printf "${TEXTCOLOR}Checking for issues...\n"
    brew doctor
}