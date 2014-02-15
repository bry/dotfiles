# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/go/bin:/usr/local/heroku:/usr/local/heroku/bin:/Applications/Postgres.app/Contents/MacOS/bin:/Users/bcabalo/.rvm/gems/ruby-2.0.0-p0/bin:/Users/bcabalo/.rvm/gems/ruby-2.0.0-p0@global/bin:/Users/bcabalo/.rvm/rubies/ruby-2.0.0-p0/bin:/Users/bcabalo/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/Users/bcabalo/.rvm/bin:/Applications/eclipse/android-sdk-macosx/tools:/Applications/eclipse/android-sdk-macosx/platform-tools:/usr/local/mysql/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export EDITOR="vim -f"
export VISUAL="vim -f"
export LANG="en_US.UTF-8"

# Aliases
alias grep='grep --color=auto'
alias p='cd /Users/bcabalo/Projects'

alias g='git status'
alias gpr="git pull --rebase"
alias gsgpr="git stash; git pull --rebase; git stash pop;"
