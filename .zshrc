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

# Android
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Flutter
#export PATH="$PATH:$HOME/Develop/github.com/flutter/flutter/bin"

# gcloud
export CLOUDSDK_PYTHON="$HOME/.pyenv/versions/3.8.13/bin/python"
if [ -f '/Users/shikajiro/Develop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shikajiro/Develop/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/shikajiro/Develop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shikajiro/Develop/google-cloud-sdk/completion.zsh.inc'; fi

# asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc


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


. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh
