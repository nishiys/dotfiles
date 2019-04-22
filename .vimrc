" *******************************************************************
" * 共通設定
" *******************************************************************
"""

"vi互換モードオフ（設定しなくてもvi互換にはなっていなかったが、明示的に書いておく）
set nocompatible

" ** Visual Settings
" syntax highlight
syntax enable
"show line number
set number
"highlight the current line
set cursorline
"highlight the current column
set cursorcolumn
"show editing filename
set title
" タブ等の不可視文字の可視化
set list
set listchars=tab:>.,trail:_,eol:↩︎,extends:≫,precedes:≪,nbsp:%
" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/


" ** Encoding
" ファイル読み込み時のエンコーディング設定
set encoding=utf-8
" vim script内でマルチバイト文字を使う場合の設定
scriptencoding utf-8
" 保存時のエンコーディング設定
set fileencoding=utf-8

" ** Indent
" tabをspaceとして入力する
set expandtab
" tab入力をspace xxつ分に設定する。
set tabstop=4
" vimが読み込み時や自動インデント時、>>コマンド時に挿入されるスペースの量
set shiftwidth=4
"改行時に前の行のインデントを継続する
set autoindent 
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" ** command
" コマンドモードの補完をわかりやすく表示
set wildmenu

" ** 文字列検索
"highlight search results
set hlsearch
"map <Esc><Esc> remove highlights
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"if search characters are small, they are case insensitive.
set ignorecase
"if search characters include capital letters, they are case sensitive.
set smartcase



" homebrewからインストールしたvimに変えたらbackspaceがきかなくなったのでこの設定を追加
set backspace=indent,eol,start
" コピペの保存行数を増やす
set viminfo='20,\"1000
" save yank on clipboard
if has("clipboard")
    set clipboard=unnamed,autoselect
endif
" enable the use of the mouse in all modes
if has("mouse")
    set mouse=a
    set ttymouse=xterm2 " screen使用時にマウス操作がフリーズする対策。今はいらないが。
endif

" esc keymapping [Control+j]をEscにマップ
noremap <C-j> <esc>
noremap! <C-j> <esc>

" for training 
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>



" *******************************************************************
" * vim-plug
" *******************************************************************

" vim-plugの設定
call plug#begin('~/.vim/plugged')
    " ** Colorscheme
    Plug 'tomasr/molokai', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'altercation/vim-colors-solarized', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'sickill/vim-monokai', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'skielbasa/vim-material-monokai', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'phanviet/vim-monokai-pro', {'do': 'cp colors/* ~/.vim/colors/'}

    Plug 'scrooloose/nerdtree' "ディレクトリをTree表示
    Plug 'Yggdroot/indentLine' "インデントを可視化

    " ** comment out
    Plug 'scrooloose/nerdcommenter'

    " ** autocomplete & snippet
    Plug 'Shougo/neocomplete.vim' "強力なコード補間機能 neocomplcacheの後継

    Plug 'Shougo/neosnippet.vim' " スニペット補完plugin
    Plug 'Shougo/neosnippet-snippets' " デフォルトsnippet

    " ** TeX
    Plug 'lervag/vimtex'

    " ** Markdown
    Plug 'plasticboy/vim-markdown' "Markdown用プラグイン
    Plug 'kannokanno/previm' "Markdownファイルをプレビューできるようにする
    Plug 'tyru/open-browser.vim' "Markdownファイルのプレビューをブラウザで行う

    "" ** vim-airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()


" *******************************************************************
" * Plugin Settings
" *******************************************************************


" set t_Co=256 " $TERMの方で設定されていれば不要
" -------------------------------------------------------------------
" ** Colorscheme-
" -------------------------------------------------------------------
" --- tomasr/molokai
" colorscheme molokai

" --- sickill/monokai
" colorscheme monokai

" --- solarized
" set background=dark
" colorscheme solarized

" skielbasa/vim-material-monokai
set background=dark
set termguicolors
colorscheme material-monokai
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1

" --- monokai_pro
" set termguicolors
" colorscheme monokai_pro 


"--- vim-airline ------------------------------
let g:airline_powerline_fonts = 1
" show status line always
set laststatus=2
" set colorscheme
" let g:airline_theme='materialmonokai'
let g:airline_theme = 'angr'
" tabline
let g:airline#extensions#tabline#enabled = 1






"--- NERDTree ---
""隠しファイルをデフォルトで表示
let NERDTreeShowHidden = 1 
""デフォルトでツリー表示
"autocmd VimEnter * execute 'NERDTree'


"--- NERD Commenter
" detect fyletyoe
filetype on
" add spaces after comment delimiters by default 
let g:NERDSpaceDelims=1
" ネストしている場所のコメントアウトを左揃えで並べる
let g:NERDDefaultAlign='left'



"--- Markdown -----------------------------
"".mkd, .mdファイルも.markdownファイルと認識させる
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
"" Ctrl + p でプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>
""勝手にmarkdown構文解釈して折りたたむのを防ぐ
let g:vim_markdown_folding_disabled=1

"-----------------------------------------------

"--- neocomplete ---
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 2文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 2
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 20
" preview windowを閉じない
let g:neocomplete#enable_auto_close_preview = 0
" バックスペースで補完のポップアップを閉じる
"inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
" <TAB> completion (デフォルトは<C-n>で次候補)
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <TAB>で選んで<Enter>で確定時に改行しない
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "<CR>"

" --- neosnippet ---
"" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" neosnippet-snippetsのtex.snipを.latex拡張子だけじゃなく.tex拡張子できかせる
let g:tex_flavor='latex'
" ------------------------------------------------------


"--- vimtex -----------------------------------
" neocompleteにvimtexに対応した挙動をさせる
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete

" 勝手にTeX数式が変換されて表示されてしまう問題を解決
let g:tex_conceal = ''



