# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="/Users/shikajiro/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#plugins=(
#  git
#  adb aws brew docker-compose docker-machine docker flutter gcloud github gitignore golang gradle httpie iterm2 jenv kubectl minikube mosh node npm osx pip pipenv pyenv python tmux vagrant 
#  virtualenv vscode xcode )

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=nano
export SHELL=/bin/zsh

export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/sbin"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

#node
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# java
eval "$(jenv init -)"

# go
eval "$(goenv init -)"

# ruby
eval "$(rbenv init -)"

# python
export PATH="$HOME/.poetry/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

# Android
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Flutter
export PATH="$PATH:$HOME/Develop/github.com/flutter/flutter/bin"

# gcloud
export CLOUDSDK_PYTHON="$HOME/.pyenv/versions/3.8.13/bin/python"
if [ -f '/Users/shikajiro/Develop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shikajiro/Develop/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/shikajiro/Develop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shikajiro/Develop/google-cloud-sdk/completion.zsh.inc'; fi


# alias
alias ls="exa"
alias cat="bat -p"
alias sed="gsed"
alias split="gsplit"


# functions
adb_wifi(){
  ip=$(adb shell "ip addr show wlan0 | grep 192.168" | awk -F' ' '{print $2}' | awk -F'/' '{print $1}')
  echo $ip
  adb tcpip 5555
  adb connect $ip
}
ss() {
  size=600
  datestr=$(date -j "+%s")
  name=screen-$datestr-$size.png
  tmpname=tmp-$datestr.png
  adb exec-out screencap -p > $tmpname
  convert $tmpname -resize ${size}x${size} $name
  rm $tmpname
  echo $name
}

ffmpeggif() {
  ffmpeg -i $1 -vf scale=320:-1 -r 10 $1.gif
  echo "create $(pwd)/$1.gif"
}

activity() {
  adb shell dumpsys activity | grep -B 1 "Run #[0-9]*:"
}

androiddebugkey-report(){
  keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android
}

adb_device_info() {
  adb shell getprop | grep -e 'model' -e 'version.sdk' -e 'manufacturer' -e 'hardware' -e 'platform' -e 'revision' -e 'serialno' -e 'product.name' -e 'brand'
}

layout_poetry() {
  if [[ ! -f pyproject.toml ]]; then
    log_error 'No pyproject.toml found. Use `poetry new` or `poetry init` to create one first.'
    exit 2
  fi

  # create venv if it doesn't exist
  poetry run true

  export VIRTUAL_ENV=$(poetry env info --path)
  export POETRY_ACTIVE=1
  PATH_add "$VIRTUAL_ENV/bin"
}

