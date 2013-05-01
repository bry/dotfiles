source "/usr/local/Cellar/git/1.8.1.1/etc/bash_completion.d/git-completion.bash"
source "/usr/local/Cellar/git/1.8.1.1/etc/bash_completion.d/git-prompt.sh"

export EDITOR="vim -f"
export VISUAL="vim -f"

export LANG="en_US.UTF-8"

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

TERM=screen-256color

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias greps='ps aux | grep -i'
alias rp='greps ruby'

alias g="git status"
alias gc="git commit -v"
alias gpr="git pull --rebase"
alias gsgpr="git stash; git pull --rebase; git stash pop;"
alias gg="git log --all --grep"
alias ga="git log --all --author"
alias gbc="git branch -a --contains"

alias vs="vagrant ssh"
