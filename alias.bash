#  ###################################
#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias bashreload='source ~/.bash_profile'
alias gaf='git diff && git a && git fx'     # Git diff then add then fixup HEAD
alias gfp='git fetch && git pull'
alias gprune="git br | grep --color=never 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -D"
alias gstale="git branch -vv | grep 'origin/.*: gone]'"
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
# cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias pt='git diff origin/master --name-only | grep .js$ | xargs prettier --write'
alias killallnode='kill -9 $(pgrep node)'
alias postico='open -n /Applications/Postico.app/'
#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias pem-key-pair='openssl genpkey -algorithm RSA -out private_key.pem -pkeyopt rsa_keygen_bits:2048 && openssl rsa -pubout -in private_key.pem -out public_key.pem'
alias loginaws='$(aws ecr get-login --no-include-email --region us-west-2)'
alias kbc='kubectl'
kbc-default-namespace () { kubectl config set-context --current  --namespace="$1"; }
kns-set () { kubectl config set-context --current  --namespace="$1"; }
kns () { kubectl config get-contexts | awk '{print $5}' | tail -n1; }
kbclogs () {
  keyword=$1
  num=${2:-1}
  rest=$3
  kubectl logs -f $(kubectl get po | grep "$keyword" | awk '{print $1}' | sed -n ${num}p) $3;
}
fcd () { cd *"$1"*; }
alias rds-tunnel='ssh -i ~/.ssh/adeptmind.pem -N -L5431:gsd-prod.cc317gog3hcw.us-west-2.rds.amazonaws.com:5432 gsd-tunnel'
alias rds-tunnel-internal='ssh -i ~/.ssh/adeptmind.pem -N -L5431:gsd-prod.cc317gog3hcw.us-west-2.rds.amazonaws.com:5432 gsd-tunnel-internal'
alias jest-test='node --inspect-brk node_modules/.bin/jest --runInBand'
alias gre='GREP_OPTIONS="--color=auto" grep'
alias reset-network='sudo ifconfig en0 down && sudo route flush && sudo ifconfig en0 up'
adeptvpn4000 () { ssh -i ~/.ssh/adeptmind.pem -g -R \*:4000:0.0.0.0:$1 ubuntu@vpn.internal.adeptmind.ai; }
curlcode () {
  url=$1
  curl -LI "$1" -o /dev/null -w '%
  {http_code}\n' -s;
}
curll () {
  url=$1
  curl "$1" -w '\n' -s;
}

alias adapter-tunnel='ssh -i ~/.ssh/adeptmind.pem -gq -R \*:4000:0.0.0.0:8153 ubuntu@vpn.internal.adeptmind.ai'

killport () {
  port2kill=$1
  task2killcontains="debug"
  lsof -i:"$port2kill" | grep $task2killcontains | awk '{print $2}' | xargs kill -9
}