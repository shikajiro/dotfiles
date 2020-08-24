
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

export EDITOR=nano

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"

# Path to the bash it configuration
export BASH_IT="/Users/shikajiro/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.

# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby-python-docker'

# Load Bash It
source "$BASH_IT"/bash_it.sh

# java
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export PATH=$PATH:$JAVA_HOME/bin
eval "$(jenv init -)"
export PATH="$HOME/.jenv/bin:$PATH"

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


#power-shell
function _update_ps1() {
    export PS1=""
}
export PROMPT_COMMAND="_update_ps1; "
#power-shell


export PATH="$HOME/.cargo/bin:$PATH"
