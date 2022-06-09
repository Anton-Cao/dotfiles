alias c="clear"
alias g="grep -Hn"
alias e="emacs -nw"
alias ta="tmux a -t"
alias ts="tmux new -s"
alias tl="tmux ls"
alias tkss="tmux kill-session -t"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gpush="git push"
alias gpull="git pull"
alias gl="git log --graph --decorate --oneline"

cdu(){
  for i in $(seq 1 $1);
  do
    cd ..
  done
}

# emacs takes too long to boot up
export EDITOR="vim"
export VISUAL="vim"

# necessary for spacemacs theme to display correctly
export TERM=xterm-256color

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi