
###########################
## エイリアス

# -----------------------------------------------
# coreutils
# -----------------------------------------------
# PATHの方でnormal nameを使用するように設定済み

# -----------------------------------------------
# other basic linux commands
# -----------------------------------------------
alias awk='gawk'

export CLICOLOR=1
alias ls='ls -F --color=auto' #ディレクトリに/をつける(-F)
alias ll='ls -l' #ファイル情報表示
alias la='ls -a' #dotfileも表示
alias lla='ll -a'

alias rm='rm -iv' #-fつけると消すかどうか聞かずに削除してくれる。
alias mv='mv -v' #(--verbose)途中経過を表示
alias cp='cp -v'
alias mkdir='mkdir -p -v' #(--parents)親子ディレクトリを同時に作成可能, (--verbose)結果を表示





# source-highlightでlessに色付け
# lessはBSD版がないので、macも標準でGNU版
#export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
#export LESS='-R'
alias less='less -m -N -g -i -J --underline-special --SILENT'
# alias less='/usr/share/vim/vim80/macros/less.sh'

alias mpiexec="export TMPDIR='/tmp'; mpiexec" #macでは自動で$TMPDIRが決められ、そこに一時ファイルが保存される仕様になっているが、或る日突然$TMPDIRが長すぎるということでmpiexecが通らなくなったのでこのエイリアスを設定した。


# vim --> nvim 
alias vi='nvim'

# for vscode gdb debugging
alias code='sudo code --user-data-dir="$HOME/.vscode-root" $@'
