" *******************************************************************
" * 共通設定
" *******************************************************************

"vi互換モードオフ（設定しなくてもvi互換にはなっていなかったが、明示的に書いておく）
set nocompatible

" ** Encoding
" ファイル読み込み時のエンコーディング設定
set encoding=utf-8 " neovimではutf-8に統一なのでなくてもOK
" vim script内でマルチバイト文字を使う場合の設定
scriptencoding utf-8
" 保存時のエンコーディング設定
set fileencoding=utf-8

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
set listchars=tab:>-,eol:↲,precedes:«,extends:»,trail:_,nbsp:%
" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
" 全角記号をきっちり全角で表示
" terminal側の設定も必須．[Macのターミナル上\(とVim上\)で全角記号の幅がおかしい問題を解決する \- Qiita](https://qiita.com/ex_SOUL/items/e51fe1a24bd4ab31d3c2)
set ambiwidth=double

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

" GUI setting
if has("nvim")
    " save yank on clipboard
    set clipboard=unnamed
    " enable the use of the mouse in all modes
    set mouse=a
else
    if has("clipboard")
        set clipboard=unnamed
        " autoselectは選択したときにyankしなくてもクリップボードにコピー
        " neovimで入れてるとエラー出る
    endif
    if has("mouse")
        set mouse=a
    endif
endif


" ** neovim ternimal emulator settings
if has("nvim")
    " :ternimalで起動するshellをzshに設定
    set sh=zsh
    " nvim terminal modeの色をtrue colorで設定できる用にする。
    " let g:terminal_color_0  = "#1b2b34" "black
    " let g:terminal_color_1  = "#ed5f67" "red
    " let g:terminal_color_2  = "#9ac895" "green
    " let g:terminal_color_3  = "#fbc963" "yellow
    " let g:terminal_color_4  = "#669acd" "blue
    " let g:terminal_color_5  = "#c695c6" "magenta
    " let g:terminal_color_6  = "#5fb4b4" "cyan
    " let g:terminal_color_7  = "#c1c6cf" "white
    " let g:terminal_color_8  = "#65737e" "bright black
    " let g:terminal_color_9  = "#fa9257" "bright red
    " let g:terminal_color_10 = "#343d46" "bright green
    " let g:terminal_color_11 = "#4f5b66" "bright yellow
    " let g:terminal_color_12 = "#a8aebb" "bright blue
    " let g:terminal_color_13 = "#ced4df" "bright magenta
    " let g:terminal_color_14 = "#ac7967" "bright cyan
    " let g:terminal_color_15 = "#d9dfea" "bright white
    " let g:terminal_color_background="#1b2b34" "background
    " let g:terminal_color_foreground="#c1c6cf" "foreground
endif





" ** Key mappings
" esc keymapping [Control+j]をEscにマップ
noremap <C-j> <esc>
noremap! <C-j> <esc>

" j,k移動を折り返されたテキスト内でも自然に振る舞わせる（表示行単位の移動）
nnoremap j gj
nnoremap k gk

" 行頭 → 非空白行頭 → 行末 をローテートする
function! s:rotate_in_line()
    let c = col('.')

    let cmd = c == 1 ? '^' : '$'
    execute "normal! ".cmd

    if c == col('.')
        if cmd == '^'
            normal! $
        else
            normal! 0
        endif
    endif
endfunction
" t に割り当て
nnoremap <silent>t :<C-u>call <SID>rotate_in_line()<CR>

" normal modeで方向キー無効化
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
    Plug 'crusoexia/vim-monokai', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'skielbasa/vim-material-monokai', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'phanviet/vim-monokai-pro', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'lifepillar/vim-solarized8', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'hzchirs/vim-material', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'kristijanhusak/vim-hybrid-material', {'do': 'cp colors/* ~/.vim/colors/'}
    Plug 'morhetz/gruvbox', {'do': 'cp colors/* ~/.vim/colors/'} 


    Plug 'scrooloose/nerdtree' "ディレクトリをTree表示
    Plug 'Yggdroot/indentLine' "インデントを可視化

    " ** enhanced syntax highlight
    Plug 'octol/vim-cpp-enhanced-highlight' " for C++ syntax highlight

    " ** cursor settings
    " Plug 'rhysd/accelerated-jk' " jk移動を加速度的に高速化

    " ** comment out
    Plug 'scrooloose/nerdcommenter'

    " ** autocomplete & snippet
    if has("nvim")
        Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    else
        Plug 'Shougo/neocomplete.vim' "強力なコード補間機能 neocomplcacheの後継
    endif

    Plug 'Shougo/neosnippet.vim' " スニペット補完plugin
    Plug 'Shougo/neosnippet-snippets' " デフォルトsnippet

    " ** Git plugin
    Plug 'tpope/vim-fugitive'
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
" *** tomasr/molokai
" colorscheme molokai

" *** sickill/monokai
" set termguicolors
" let g:monokai_term_italic = 1
" colorscheme monokai

" *** solarized
" set background=dark
" colorscheme solarized

" " *** solarized true color版
" " true color 有効
" set termguicolors
" " 斜体を積極的に使う
" let g:solarized_term_italics = 1
" " Solarized Light
" colorscheme solarized8_high

" *** skielbasa/vim-material-monokai
" set background=dark
" set termguicolors " termnilaのtrue colorを使用
" colorscheme material-monokai
" let g:materialmonokai_italic=1
" let g:materialmonokai_subtle_spell=1

" *** monokai_pro
set termguicolors
colorscheme monokai_pro

" *** material --Dark
" set termguicolors
" set background=dark
" colorscheme vim-material

" *** hybrid material
" set termguicolors
" set background=dark
" colorscheme hybrid_material

" *** gruvbox
" set termguicolors
" set background=dark
" colorscheme gruvbox

" -------------------------------------------------------------------

" -----------------------------------------------
"  ** vim-airline
let g:airline_powerline_fonts = 1
" show status line always
set laststatus=2
" set colorscheme
" let g:airline_theme='materialmonokai'
" let g:airline_theme = 'angr'
let g:airline_theme='gruvbox'
" tabline
let g:airline#extensions#tabline#enabled = 1
" -----------------------------------------------


" -----------------------------------------------
"  ** NERDTree
""隠しファイルをデフォルトで表示
" let NERDTreeShowHidden = 1
""デフォルトでツリー表示
"autocmd VimEnter * execute 'NERDTree'
" -----------------------------------------------

" -----------------------------------------------
"  ** NERD Commenter
" detect fyletyoe
filetype on
" add spaces after comment delimiters by default
let g:NERDSpaceDelims=1
" ネストしている場所のコメントアウトを左揃えで並べる
let g:NERDDefaultAlign='left'
" -----------------------------------------------

" -----------------------------------------------
"  ** Markdown
"".mkd, .mdファイルも.markdownファイルと認識させる
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
"" Ctrl + p でプレビュー
nnoremap <silent> <C-p> :PrevimOpen<CR>
""勝手にmarkdown構文解釈して折りたたむのを防ぐ
let g:vim_markdown_folding_disabled=1
" -----------------------------------------------

" -----------------------------------------------
"  ** neocomplete / deoplete
if has ("nvim")
    "  deoplete.nvim
    " Use deoplete
    let g:deoplete#enable_at_startup = 1
    " pyenvで管理しているpython3を指定
    let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
    " <TAB>で選んで<Enter>で確定時に改行しない
    inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"
endif

" <TAB> completion (デフォルトは<C-n>で次候補)
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" -----------------------------------------------


" -----------------------------------------------
"  ** neosnippet
"" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

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
" -----------------------------------------------

" -----------------------------------------------
"  ** vimtex
" neocompleteにvimtexに対応した挙動をさせる
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete
" SyncTeX (PDFViewr側でも設定が必要)
" skimをdefaultのviewerに設定
let g:vimtex_view_method = 'skim'
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" TeX数式などが勝手に変換して表示される問題を解決
" [vim\-latexの表示について · Issue \#529 · vim\-jp/issues](https://github.com/vim-jp/issues/issues/529)
let g:tex_conceal = ''
" -----------------------------------------------



