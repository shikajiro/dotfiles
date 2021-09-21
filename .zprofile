# complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -Uz colors
colors

FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit
