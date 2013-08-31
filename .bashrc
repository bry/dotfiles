source ~/.vadimr-tools/scripts/git-completion.bash
source ~/.vadimr-tools/scripts/git-prompt.sh

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

TERM=screen-256color

export EDITOR="vim -f"
export VISUAL="vim -f"

export LANG="en_US.UTF-8"

alias grep='grep --color=auto'

alias g="git status"
alias gpr="git pull --rebase"
alias gsgpr="git stash; git pull --rebase; git stash pop;"
