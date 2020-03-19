
# ****************************************************************
# 環境変数
# ****************************************************************

### PATHの設定

## fundamental path
# homebrewのインストールコマンドのシンボリックリンク
export PATH="/usr/local/bin"
# 
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin

#どこかからダウンロードしてソースからビルドしたものはここで管理
export PATH=$PATH:$HOME/usr/bin

# coreutils path
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# gnu-sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# grep
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
# gnu-tar
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# TeX
export PATH="$PATH:/usr/local/texlive/2018/bin/x86_64-darwin"


# neovimのneovim-remote(vimの+clientserverの代わり)のコマンドnvrにパスを通す
export PATH="$HOME/.local/bin:$PATH"

### PATH以外の環境変数の設定

# CPATH
export CPATH=:/usr/local/include/eigen3

#言語設定
export LANG=ja_JP.UTF-8
#utcart iranai?
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
#Gnuplot
export GNUTERM=x11

# ls(GNU版)の色設定
#export LS_COLORS='di=32:ln=35:so=36:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ls(BSD版)の色設定
#export LSCOLORS=cxfxexdxbxegedabagacad

# ls(GNU)の色設定をgithub(https://github.com/seebi/dircolors-solarized)から
# ダウンロードしたsolarizedのカラースキームに変更
# dircolorsを使用しているため、coreutilsのダウンロードが必要
eval $(dircolors ~/dotfiles/colors/dircolors-solarized/dircolors.ansi-dark)

# terminal256色表示を有効
# export TERM=xterm-256color # 設定しなくてもdefaultでなっていたが念の為。--> やったら色おかしくなったので消した。

# neovim設定ファイル
export XDG_CONFIG_HOME=~/.config


# ****************************************************************
# Zsh setting
# ****************************************************************


#bindkey -v


###########################
## ヒストリの設定
# .zsh_history(コマンド履歴を保存するファイル)~/だけに置かれるように。
HISTFILE=~/.zsh_history
# メモリに保存するコマンド数(HISTSIZE)とファイルに保存するコマンド数(SAVESIZE)
HISTSIZE=500000
SAVEHIST=1000000

# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

###########################
## 補完
# 補完機能を有効にする
autoload -Uz compinit 
# 補完候補を一覧を表示
setopt auto_list
# タブ補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compinit
# 補完メニューをカーソルで選択可能にする
zstyle ':completion:*:default' menu select=1
# 補完候補のカラー表示
zstyle ':completion:*' list-colors "${LS_COLORS}"
# 入力ミス時に似たコマンドを表示
setopt correct

## for peco
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

###########################
## 分割ファイルの読み込み
# 分割ファイルは${HOME}/.zshに保存
# 末尾は.zshでindex順に読み込み

ZSHHOME="${HOME}/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi





###########################
## pip
# pip zsh 補完の有効化
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

###########################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit




########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        ;;
    linux*)
        #Linux用の設定
        ;;
esac



########################################
# .zshrcを更新後コンパイルする
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi











