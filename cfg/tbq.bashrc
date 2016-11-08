# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias gj="sudo shutdown -h now"
alias reboot="sudo reboot"
alias gs="git status"
alias gp="git push"
alias gcp="git add .;git commit -am update;git push"
alias nginx="sudo /work/nginx/sbin/nginx"

export JAVA_HOME=/home/tboqi/lib/jdk1.7.0_80
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
