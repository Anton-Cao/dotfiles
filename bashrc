alias c="clear"
alias e="emacsclient -t"
alias t="tmux a -t"
alias tn="tmux new -s"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gpush="git push"
alias gpull="git pull"
alias gb="git branch"
alias goto="git checkout"
alias gl="git log --graph --decorate --oneline"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi
