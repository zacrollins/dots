#!/usr/bin/env zsh

fpath=($DOTFILES/zsh/plugins $fpath)

# +------------+
# | NAVIGATION |
# +------------+

setopt AUTO_CD              # Go to folder path without using cd.

# setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
# setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
# setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
# setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt BEEP		    # Disable BEEP noise

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +---------+
# | ALIASES |
# +---------+

. $ZDOTDIR/aliases.zsh

# +------------+
# | COMPLETION |
# +------------+

source $ZDOTDIR/completion.zsh

# kubectl completion
source <(kubectl completion zsh)

# az cli completion
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az

# Node Version Manger
# source ~/.nvm/nvm.sh

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+

source $(brew --prefix)/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# +--------+
# | PROMPT |
# +--------+

eval "$(starship init zsh)"