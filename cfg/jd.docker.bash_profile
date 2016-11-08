# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
alias gs="git status"
alias gd="git diff"
alias gcm="git commit -am"
alias gs="git status"
