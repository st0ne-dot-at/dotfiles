set -o vi
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'


if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi


alias tmux='tmux -2 -f ~/.tmux.conf '
alias vi='vim'
setxkbmap -option "ctrl:nocaps"

export PATH=${PATH}:/home/steininr/android/sdk/platform-tools

export ORACLE_HOME=~/Downloads/instantclient_11_2
export LD_LIBRARY_PATH=$ORACLE_HOME


# maven 2
export M2_HOME=~/env/apps/maven/maven/
export PATH=~/env/apps/maven/maven/bin:${PATH}

# java
export PATH=~/env/java/java6/bin/:${PATH}
export JAVA_HOME=~/env/java/java6/

# bin
export PATH=~/env/bin/:${PATH}

# android
export PATH=~/env/apps/android/sdk/platform-tools/:${PATH}
