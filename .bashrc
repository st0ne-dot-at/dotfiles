set -o vi
export SVN_EDITOR='vim'
export GIT_EDITOR='vim'


if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi


alias tmux='tmux -2 -f ~/.tmux.conf '
alias vi='vim'
setxkbmap -option "ctrl:nocaps"
