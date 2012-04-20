source "/usr/local/git/contrib/completion/git-completion.bash"

export DISPLAY=:0.0
export EDITOR="mvim -f"
export VISUAL="mvim -f"

export LANG="en_US.UTF-8"

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# aliases

alias vim="mvim"
alias tvim="/usr/bin/vim"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias greps='ps aux | grep -i'
alias rp='greps ruby'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias l1="ls -1"
alias la1="ls -a1"

alias g="git status"
alias gc="git commit -v"
alias gpr="git pull --rebase"
alias gsgpr="git stash; git pull --rebase; git stash pop;"
alias gg="git log --all --grep"
alias ga="git log --all --author"
alias gbc="git branch -a --contains"
alias gd="git diff"
alias gdc="git diff --cached"
alias gbg="git branch -a | grep"

alias r='rails'
alias be='bundle exec'
alias ts='thin start'
alias ss='script/server'
alias sc='script/console'
alias migrate='rake db:migrate'
alias tail1k="tail -n 1000 -f"
alias taildev="tail -n 1000 -f log/development.log"

alias o="open -a"

alias install_nokogiri_gem="gem install nokogiri -- --with-xml2-include=/usr/local/Cellar/libxml2/2.7.8/include/libxml2 --with-xml2-lib=/usr/local/Cellar/libxml2/2.7.8/lib --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.26 --with-iconv-include=/usr/local/Cellar/libiconv/1.13.1/include --with-iconv-lib=/usr/local/Cellar/libiconv/1.13.1/lib"
