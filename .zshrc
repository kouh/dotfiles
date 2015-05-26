export LANG=ja_JP.UTF-8

# Zsh ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward


########################################
# Zsh 補完

# 補完機能を有効にする
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -C
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない


########################################
# Zsh オプション

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# vcs_info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '(%b%c%u)'
zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
# プロンプト表示
# PROMPT='[%n@%~]$ '
PROMPT="%F{cyan}[%n@%D{%m/%d %T}]%f "
RPROMPT="%F{green}[%~]%{${reset_color}%}"
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}

alias ls='ls -G -F'
alias ll='ls -alt'
alias c='clear'
alias up='cd ..'
alias f='open .'

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

