#fundamental path
export PATH="/usr/local/bin"
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin
export PATH=$PATH:$HOME/usr/bin #どこかからダウンロードしてソースからビルドしたものはここへ

#utcart iranai?
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#TeX
export PATH="$PATH:/usr/local/texlive/2017/bin/x86_64-darwin"

#Gnuplot
export GNUTERM=x11

#git (Homebrew)
export PATH="$PATH:/usr/local/Cellar/git/2.14.3/bin/"

# bash prompt
export PS1='\n\[\033[36m\]\u@\h \[\033[0m\]\[\033[31m\]\W \[\033[36m\]\$ \[\033[0m\]'
export LSCOLORS=cxfxexdxbxegedabagacad

#alias setting
#alias rm='rmtrash' #rmtrash is installed by homebrew.
alias rm='rm -i' #-fつけると消すかどうか聞かずに削除してくれる。
alias mpiexec="export TMPDIR='/tmp'; mpiexec" #macでは自動で$TMPDIRが決められ、そこに一時ファイルが保存される仕様になっているが、或る日突然$TMPDIRが長すぎるということでmpiexecが通らなくなったのでこのエイリアスを設定した。
alias ls='ls -FG' #lsに色をつける(-G),ディレクトリに/をつける(-F)
