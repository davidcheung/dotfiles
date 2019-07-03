# alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'

### Add Git Status to bash prompt
# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

# WORKING_DIRECTORY='\W\[\033[33m\]'
# BRANCH=' \[\033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
# export PS1="\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$"

#### Change terminal title
PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

_completion_loader ()
{
    local compfile=./completions;
    [[ $BASH_SOURCE == */* ]] && compfile="${BASH_SOURCE%/*}/completions";
    compfile+="/${1##*/}";
    [[ -f "$compfile" ]] && . "$compfile" &> /dev/null && return 124;
    complete -F _minimal "$1" && return 124
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

source ~/git-completion.bash

source <(kubectl completion bash)


_ssh()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(grep -i '^Host' ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _ssh ssh

source ~/alias.bash


export NVM_DIR=~/.nvm

##################
## node paths
export PATH=./node_modules/.bin:$PATH
export PATH=:/Users/davidcheung/davidbin:$PATH
export PATH=:~/Library/Python/3.6/bin:$PATH
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
