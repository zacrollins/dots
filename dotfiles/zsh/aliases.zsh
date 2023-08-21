# ls list dir

# alias ls='ls --color=auto'
# alias l='ls -l'
# alias ll='ls -lahF'
# alias la='ls -A'
alias ls='exa'
alias l='exa -l'
alias ll='exa -lahF'

# copy
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# ping
alias pg='ping 8.8.8.8'

# macos
if [[ ${OSTYPE} == "darwin"* ]]; then
    alias cpwd='pwd | tr -d "\n" | pbcopy'                        # Copy the working path to clipboard
    alias cl="fc -e -|pbcopy"                                     # Copy output of last command to clipboard
    alias caff="caffeinate -ism"                                  # Run command without letting mac sleep
    alias cleanDS="find . -type f -name '*.DS_Store' -ls -delete" # Delete .DS_Store files on Macs
fi

# time
alias time='/usr/bin/time'

# neovim
alias vim='nvim'
alias vi='nvim'

# git
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short' # A nicer Git Log

# netstat
alias port="netstat -tulpn | grep"

# code
alias code='code-insiders'

# kubectl
alias k='kubectl'