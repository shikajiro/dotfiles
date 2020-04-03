export EDITOR=nano
export SHELL=/bin/zsh

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

# java
eval "$(jenv init -)"

# ruby
eval "$(rbenv init -)"

# python
eval "$(pipenv --completion)"
export PATH="$HOME/.poetry/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
export GCLOUD=$HOME/google-cloud-sdk
if [[ -f "GCLOUD/path.bash.inc" ]]; then . "$GCLOUD/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [[ -f "GCLOUD/completion.bash.inc" ]]; then . "$GCLOUD/completion.bash.inc"; fi

# Android
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Flutter
export PATH="$PATH:$HOME/Develop/flutter/bin"

#
export PATH=$HOME/bin:$PATH
