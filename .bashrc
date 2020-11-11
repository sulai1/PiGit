# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# ------------------------------------
# ALIASES
# ------------------------------------
# Edit .bashrc
alias bashedit='sudo open -a TextEdit ~/.bashrc'

# Force terminal to recognize changes to .bashrc
alias bashrefresh='source ~/.bashrc'

# Ideal directory listing
alias ll="ls -laFG"
# -l list in long format
# -F Display a...
#       slash (`/') immediately after each pathname that is a directory,
#       asterisk (`*') after each that is executable,
#       at sign (`@') after each symbolic link
#       equals sign (`=') after each socket,
#       percent sign (`%') after each whiteout,
#       vertical bar (`|') after each that is a FIFO.
# -G = Color
# -a = Show hidden files

# Ask before removing files
alias rm='rm -i'

# Search history. Example usage: `histg git` to recent commands that use git
alias histg="history | grep"

# Get your current IP
alias myip="curl http://ipecho.net/plain; echo"

# Example alias for SSH'ing into a server
alias myserver="ssh user@111.111.111.111"

# Example alias for quickly getting to a commonly used directory
alias htdocs='cd /Applications/XAMPP/htdocs'


# ------------------------------------
# Color variables
# ------------------------------------
# Regular Colors
Black='\[\033[0;30m\]'
Red='\[\033[0;31m\]'
Green='\[\033[0;32m\]'
Yellow='\[\033[0;33m\]'
Blue='\[\033[0;34m\]'
Purple='\[\033[0;35m\]'
Cyan='\[\033[0;36m\]'
White='\[\033[0;37m\]'
Light_Gray='\[\033[0;37m\]'

# Reset colors
NONE='\[\033[0;0m\]'



# ------------------------------------
# Configure prompt
# Includes special handling for git repos
# ------------------------------------
# When in a git repo, this method is used to determine the current branch
function parse_git_branch {
    git branch 2>/dev/null | grep '^*' | sed 's_^..__' | sed 's_\(.*\)_(\1)_'
}

# When in a git repo, this method is used to determine if there are changes
function git_dirty {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "!"
  else
    echo ""
  fi
}

# Variables
ps1_dir="$Green\u@\h:$Purple\w$NONE"
ps1_git="$Cyan \$(parse_git_branch)$Red \$(git_dirty)$NONE "

export PS1="${ps1_dir}${ps1_git}\$ "

