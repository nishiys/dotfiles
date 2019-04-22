

# ****************************************************************
# Zplug
# ****************************************************************

# brewのインストールパスを設定する
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# pluginの追加

# zplugをzplugで管理
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# Zshの候補選択を拡張
zplug "zsh-users/zsh-completions"
# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"
# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# ヒストリの補完を強化する
zplug "zsh-users/zsh-history-substring-search", defer:3
# テーマをpowerlevel9kに
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

## 未インストール項目をインストールする
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
       echo; zplug install
  fi
fi
## コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose



###########################################
## powerlevel9k
# font setting
#POWERLEVEL9K_MODE='nerdfont-complete'


#プロンプトを二行表示
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
# Adding Newline Before Each Prompt
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# RPROMPT Contents
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
# Disable RPROMPT
POWERLEVEL9K_DISABLE_RPROMPT=true
# changing separator
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$''
# changing prompt prefix
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "















