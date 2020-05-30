#autoshell(){
#  [[ -n $AUTOLS_DIR ]] && [[ $AUTOLS_DIR != $PWD ]] && [ -e ./.start.sh ] &&  ./.start.sh
#  AUTOLS_DIR="${PWD}"
#}
#PROMPT_COMMAND="autoshell"

#eval "$(direnv hook bash)"

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Take a screenshot
# Usage: screenshot
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

function cdls() {
    \cd $1;
    ls;
}

alias cd=cdls

alias k='kubectl'
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Fire an intent
# Usage: startintent https://twitter.com/nisrulz
alias startintent="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X shell am start $1"

# Install Apk
# Usage: apkinstall ~/path/to/apk/App.apk
alias apkinstall="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X install -r $1"

# Uninstall an app
# Usage: rmapp com.example.demoapp
alias rmapp="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X uninstall $1"

# Clear all data of an app
# Usage: clearapp com.example.demoapp
alias clearapp="adb devices | tail -n +2 | cut -sf 1 | xargs -I X adb -s X shell pm clear $1"

# Launch your debug apk on your connected device
# Execute at the root of your android project
# Usage: launchDebugApk
#alias launchDebugApk="adb shell monkey -p `aapt dump badging ./app/build/outputs/apk/debug/app-debug.apk | grep -e 'package: name' | cut -d \' -f 2` 1"

HISTTIMEFORMAT='%Y-%m-%dT%T%z '

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
