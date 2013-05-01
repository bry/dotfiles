. ~/.profile
. ~/.bashrc

export PATH="$HOME/.vadimr-tools/scripts:$PATH"

export PATH="/usr/local/bin:$PATH" # Brew should be first.
export PATH="/usr/local/heroku/bin:$PATH" # Heroku Toolbelt
export PATH="/usr/local/share/npm/bin:$PATH" # npm

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
