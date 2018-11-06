set -o vi
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'


if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi


alias tmux='tmux -2 -f ~/.tmux.conf '
alias vi='vim'
setxkbmap -option "ctrl:nocaps"

export ORACLE_HOME=~/Downloads/instantclient_11_2
export LD_LIBRARY_PATH=$ORACLE_HOME


# maven 2
export M2_HOME=~/env/apps/maven/maven/
export PATH=~/env/apps/maven/maven/bin:${PATH}

# java
export PATH=~/env/java/java7/bin/:${PATH}
export JAVA_HOME=~/env/java/java7/

# bin
export PATH=~/env/bin/:${PATH}

# android
#export PATH=~/env/apps/android/sdk/platform-tools/:${PATH}
#export PATH=~/env/apps/adt-bundle-linux-x86_64-20140321/android-studio/gradle/gradle-2.2.1/bin:${PATH}
export PATH=${PATH}:/home/steininr/env/android-sdk/platform-tools/
alias s='sudo su - -c "cd $PWD;bash"'
