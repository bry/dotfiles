PATH="$PATH:/usr/local/mysql/bin"
PATH="$HOME/tools/my:$PATH"
PATH="$HOME/local/node/bin:$PATH"
# PATH="$HOME:/Users/vadimr/tools/play-1.2.3:$PATH"

export DISPLAY=:0.0

export EDITOR="mvim -f"
export VISUAL="mvim -f"

export LANG="en_US.UTF-8"

# \a	The ASCII bell character (you can also type \007)
# \d	Date in "Wed Sep 06" format
# \e	ASCII escape character (you can also type \033)
# \h	First part of hostname (such as "mybox")
# \H	Full hostname (such as "mybox.mydomain.com")
# \l	The name of the shell's terminal device (such as "ttyp4")
# \j	The number of processes you've suspended in this shell by hitting ^Z
# \n	Newline
# \r	Carriage return
# \s	The name of the shell executable (such as "bash")
# \t	Time in 24-hour format (such as "23:01:01")
# \T	Time in 12-hour format (such as "11:01:01")
# \@	Time in 12-hour format with am/pm
# \u	Your username
# \v	Version of bash (such as 2.04)
# \V	Bash version, including patchlevel
# \w	Current working directory (such as "/home/drobbins")
# \W	The "basename" of the current working directory (such as "drobbins")
# \!	Current command's position in the history buffer
# \#	Command number (this will count up at each prompt, as long as you type something)
# \$	If you are not root, inserts a "$"; if you are root, you get a "#"
# \xxx	Inserts an ASCII character based on three-digit number xxx (replace unused digits with zeros, such as "\007")
# \\	A backslash
# \[	This sequence should appear before a sequence of characters that don't move the cursor (like color escape sequences). This allows bash to calculate word wrapping correctly.
# \]	This sequence should appear after a sequence of non-printing characters.

_BLACK="\[\033[0;30m\]"
_RED="\[\033[0;31m\]"
_GREEN="\[\033[0;32m\]"
_YELLOW="\[\033[0;33m\]"
_BLUE="\[\033[0;34m\]"
_MOTTON_BLUE="\[\033[0;36m\]"
_DARK_GRAY="\[\033[1;30m\]"

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="$_MOTTON_BLUE\u@\H $_DARK_GRAY\W $_BLUE\$(parse_git_branch)$_MOTTON_BLUE\$$_BLACK "

# aliases

alias vim="mvim"
alias tvim="/usr/sbin/vim"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias greps='ps aux | grep -i'

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias l1="ls -1"
alias la1="ls -a1"

alias g="git status"
alias gc="git commit"
alias gpr="git pull --rebase"
alias gsgpr="git stash; git pull --rebase; git stash pop;"
alias gg="git log --all --grep"
alias ga="git log --all --author"
alias gbc="git branch -a --contains"
alias gd="git diff"

alias r='rails'
alias ts='thin start'
alias ss='script/server'
alias sc='script/console'
alias migrate='rake db:migrate'
alias taildev="tail -n 500 -f log/development.log"

alias rd='open -a Safari ~/x-files/dev/docs/rails/rdoc/index.html'
alias rguides='open -a Safari ~/projects/open/rails/railties/guides/output/index.html'
alias jqdoc='open -a Safari ~/x-files/dev/docs/jquery/jqapi-latest/index.html'

alias mr="mysql -uroot"

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
