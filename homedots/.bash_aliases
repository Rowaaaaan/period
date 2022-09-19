alias v="nvim"
alias yt="ytfzf"
alias yta="ytfzf -ma"
alias rick="curl 34.244.211.48:8000"

# giph aliases
alias giphva="giph -a -s"
alias giphg="giph -s"

# envs.sh aliases
0file() { curl -F"file=@$1" https://envs.sh ; }
0pb() { curl -F"file=@-;" https://envs.sh ; }
0url() { curl -F"url=$1" https://envs.sh ; }
0short() { curl -F"shorten=$1" https://envs.sh ; }
