"
" Configuration file for vim
"
set modelines=0  " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

packadd Cfilter

autocmd ColorScheme * hi LineNr       ctermfg=141                        cterm=none
autocmd ColorScheme * hi CursorLineNr ctermfg=121

autocmd ColorScheme * hi Visual                          ctermbg=magenta cterm=none
autocmd ColorScheme * hi VisualNOS                       ctermbg=magenta cterm=none
autocmd ColorScheme * hi Search       ctermfg=yellow     ctermbg=cyan    cterm=none
autocmd ColorScheme * hi IncSearch    ctermfg=yellow     ctermbg=cyan    cterm=none
autocmd ColorScheme * hi MatchParen   ctermfg=magenta    ctermbg=none

autocmd ColorScheme * hi TabLineSel   ctermfg=lightgreen ctermbg=blue    cterm=none
autocmd ColorScheme * hi TabLine      ctermfg=lightblue  ctermbg=27      cterm=none
autocmd ColorScheme * hi TabLineFill                     ctermbg=27      cterm=none

autocmd ColorScheme * hi StatusLine   ctermfg=lightblue  ctermbg=33      cterm=none
autocmd ColorScheme * hi EndOfBuffer  ctermfg=cyan                       cterm=none

autocmd ColorScheme * hi Pmenu        ctermfg=lightgreen ctermbg=blue
autocmd ColorScheme * hi PmenuSel     ctermfg=cyan       ctermbg=magenta cterm=bold

autocmd ColorScheme * hi ErrorMsg     ctermfg=magenta    ctermbg=none    cterm=none
autocmd ColorScheme * hi WarningMsg   ctermfg=magenta    ctermbg=none    cterm=none

set listchars=tab:»_,eol:«,extends:»,precedes:«,nbsp:%
autocmd ColorScheme * hi NonText      ctermfg=25         ctermbg=none    cterm=none
autocmd ColorScheme * hi SpecialKey   ctermfg=25         ctermbg=none    cterm=none

autocmd ColorScheme * hi Comment      ctermfg=14     ctermbg=none   cterm=none

autocmd ColorScheme * hi netrwDir      ctermfg=lightgreen
autocmd ColorScheme * hi netrwTreeBar  ctermfg=lightgreen
autocmd ColorScheme * hi netrwClassify ctermfg=lightgreen
autocmd ColorScheme * hi netrwComment  ctermfg=14     ctermbg=none   cterm=none
autocmd ColorScheme * hi netrwList     ctermfg=yellow ctermbg=none   cterm=none
autocmd ColorScheme * hi netrwVersion  ctermfg=130    ctermbg=none   cterm=none
autocmd ColorScheme * hi netrwHelpCmd  ctermfg=130    ctermbg=none   cterm=none


autocmd BufNewFile,BufRead *.script     set filetype=lua
autocmd BufNewFile,BufRead *.gui_script set filetype=lua

augroup InsertHook
  autocmd!
  autocmd InsertEnter * hi LineNr ctermfg=lightgreen
  autocmd InsertLeave * hi LineNr ctermfg=141
augroup END 

set incsearch
set hlsearch
set ignorecase smartcase

set number
set list
set cursorline

set autoindent
"set expandtab " indent tab を space にする
set tabstop=4    " 2
set shiftwidth=4 " 2
set nowrap
set whichwrap=b,s,h,l,<,>,[,]
set virtualedit=onemore " 改行にカーソルをおける
set virtualedit+=block  " 矩形選択で行末以降にカーソル移動可
set scrolloff=5
set wildmode=list:longest
set tabpagemax=30
set nf=""
set showtabline=2

set clipboard+=unnamed
syntax on

set statusline=%m\                 " 変更あり表示
set statusline+=%F                 " file name 表示
set statusline+=%=                 " 以降を右寄せ
set statusline+=%{&fileencoding}\  " file encoding
set statusline+=%p%%\              " 行数の%
set statusline+=%l/%L              " 現在行数/全行数
"set statusline^=%{coc#status()}   " coc.vim
set laststatus=2   " 0: off  1: on 2 win  2: on
set completeopt=menuone,noinsert
set foldmethod=manual
set shortmess+=I

" leader key
let mapleader = "\<Space>"

colorscheme koehler " evening


"
" mode normal
"

" quit
nnoremap w  :q<cr>
nnoremap :q :q!
"nnoremap q  :q<cr>

" save
nnoremap a :w<cr>

" reload
nnoremap :e :e!

" open latest
nnoremap <c-u> `0
nnoremap 0     `0

" open latest
nnoremap :l :Latest<cr>
command! -nargs=0 Latest
\ call setqflist([], ' ', {'lines' : v:oldfiles, 'efm' : '%f',
\                          'quickfixtextfunc' : 'QfOldFiles'}) | tab cw
func QfOldFiles(info)
  " info frm quickfix
  let items = getqflist({'id' : a:info.id, 'items' : 1}).items
  let l = []
  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    " mod file-name simple
    call add(l, fnamemodify(bufname(items[idx].bufnr), ':p:.'))
  endfor
  return l
endfunc

"nnoremap :b :brows oldfiles<cr>
"nnoremap :b :b #


"
" cursor mv
"

" cursor mv dir
nnoremap <Right> l
nnoremap <Left>  h
nnoremap <Up>    k
nnoremap <Down>  j

" cursor mv line
nnoremap <c-k> 10k
nnoremap <c-j> 10j

" cursor mv line in
nnoremap <expr> ; col(".") == col("$") ? "0" : "$l"

" cursor mv char
nnoremap l     l
nnoremap <c-o> h

" cursor mv word - forward
nnoremap f     w
nnoremap <c-f> el
"nnoremap <c-l> el

" cursor mv word - back
nnoremap o     b

" cursor mv file
nnoremap <expr> gj line(".") == 1 ? "G" : "gg0"
nnoremap <expr> gn line(".") == line("$") ? "gg" : "G$l"
nnoremap gg gg
nnoremap <c-g> G

" cursor mv bracket
nnoremap <c-l> %
"nnoremap <c-v> %
"nnoremap 0     %

" cursor mv jump list
nnoremap b     <c-o>
nnoremap <c-b> <c-i>

" cursor mv window split
nnoremap @ <c-w>w

" scroll
nnoremap <c-e>  10<c-e>
nnoremap <up>   <c-y>
nnoremap <down> <c-e>
nnoremap K      10<c-y>
nnoremap J      10<c-e>

"
" edit
"

" ins
nnoremap e i

" ins line
nnoremap u O<Esc>
"nnoremap h O<Esc>

" ins cr
nnoremap m i<cr><Esc>

" del char
nnoremap s    "ax
nnoremap x    x
nnoremap <BS> h"ax

" del line
nnoremap d  dd

" del line forward
nnoremap cc D

" del cr
nnoremap <c-m> J

" del word back
nnoremap <c-w> hvbd

" del word forward
nnoremap <expr> <c-d> col(".") == col("$") ? "<esc>" : '"adw'
nnoremap <expr> <c-s> col(".") == col("$") ? "<esc>" : '"ade'
"nnoremap <c-s> dw

" select all
nnoremap A ggVG

" select word
nnoremap i viw
nnoremap I v
"nnoremap <c-u> v

" select box
nnoremap v <c-v>

" yank
nnoremap c yy

" paste
nnoremap p P

" undo, redo
nnoremap h     u
nnoremap <c-h> <c-r>
"nnoremap <c-h> u
"nnoremap h     <c-r>

" repeat
nnoremap .     .
"nnoremap <c-p> .
"nnoremap <c-w> .

" inc, dec
nnoremap + <c-a>
nnoremap - <c-x>

" indent
nnoremap > >>
nnoremap < <<

"
" search
"
nnoremap n     n
nnoremap <c-n> N
nnoremap /     /
nnoremap r     g*N

" open file session last
"nnoremap <c-p> `0

" tag jump
nnoremap t <c-w>gF

"
" tab
"
nnoremap <Tab>   gt
nnoremap <S-Tab> gT
nnoremap <S-Right> :tabm+1<Cr>
nnoremap <S-Left>  :tabm-1<Cr>

" buffers
"nnoremap :b :buffers

"
" esc
"
nnoremap <space> <esc>
nnoremap <bs>    <esc>

nnoremap , <esc>
"nnoremap . <esc>
nnoremap * <esc>
nnoremap _ <esc>
nnoremap ~ <esc>
"nnoremap @ <esc>
"nnoremap ; <esc>
nnoremap <c-@> <esc>
"nnoremap <c-:> <esc> " cannot set
"nnoremap <c-;> <esc> " cannot set
"nnoremap <c-,> <esc>
"nnoremap <c-[> <esc>
nnoremap <c-]> <esc>

"nnoremap 0 <esc>
"nnoremap a <esc>
"nnoremap b <esc>
"nnoremap d <esc>
"nnoremap e <esc>
nnoremap g <esc>
"nnoremap h <esc>
"nnoremap i <esc>
"nnoremap l <esc>
"nnoremap m <esc>
"nnoremap n <esc>
nnoremap q <esc>
"nnoremap r <esc>
"nnoremap s <esc>
"nnoremap t <esc>
"nnoremap u <esc>
"nnoremap w <esc>
"nnoremap x <esc>
nnoremap y <esc>
nnoremap z <esc>

nnoremap <c-a> <esc>
"nnoremap <c-b> <esc>
nnoremap <c-c> <esc>
"nnoremap <c-d> <esc>
"nnoremap <c-e> <esc>
"nnoremap <c-f> <esc>
"nnoremap <c-g> <esc>
"nnoremap <c-h> <esc>
"nnoremap <c-i> <esc> " tab
"nnoremap <c-l> <esc>
"nnoremap <c-m> <esc>
"nnoremap <c-n> <esc>
"nnoremap <c-o> <esc>
nnoremap <c-p> <esc>
nnoremap <c-q> <esc>
nnoremap <c-r> <esc>
"nnoremap <c-s> <esc>
nnoremap <c-t> <esc>
"nnoremap <c-u> <esc>
nnoremap <c-v> <esc>
"noremap <c-w> <esc>
nnoremap <c-x> <esc>
nnoremap <c-y> <esc>
nnoremap <c-z> <esc>

"
" mode visual
"

" mode ch line , ins
vnoremap i V
"vnoremap <expr> i mode() == "<c-v>" ? "I" : "V"
"vnoremap w V

" mode ch box
vnoremap v <c-v>

" cursor mv
"vnoremap <expr> ; col(".") == col("$") ? "0" : "$"

" cursor mv char
vnoremap l l

" cursor mv word - forward
vnoremap f     e
vnoremap <c-f> el
"vnoremap <c-l> el
" cursor mv word - back
vnoremap o b

" cursor mv in selected
vnoremap ; o

" cursor mv line
vnoremap <c-j> 10j
vnoremap <c-k> 10k

" cursor mv file
vnoremap gj gg0
vnoremap gg gg
vnoremap gn G$l

" cursor mv bracket
vnoremap <c-l> %

" ins | cut & ins
vnoremap <expr> e mode() == "<c-v>" ? "I" : "c"
vnoremap <c-s> c
"vnoremap e c
"vnoremap i c

" ins $
vnoremap <expr> $ mode() == "<c-v>" ? "$A" : "$"

" del char
vnoremap s x
vnoremap x x

" del line
vnoremap d d

" yank
vnoremap c y

" paste
vnoremap p "adhp

" inc, dec
vnoremap + <c-a>
vnoremap - <c-x>
"vnoremap + g<c-a>

" indent
vnoremap > >gv
vnoremap < <gv
vnoremap :t :'<,'>!expand -4

" upper / lower
vnoremap u     ~viw
vnoremap <c-u> uviw
"vnoremap u ~viwo

"
" search
"
vnoremap n "ay/<c-r>a<cr>
vnoremap / "ay/<c-r>a
vnoremap r "ay/<c-r>a<cr>N
"vnoremap * *<c-c>N

" replace
nnoremap :s :%s//<c-r>0/gc<cr>
"nnoremap :s :%s/<c-r>//<c-r>0/gc<cr>

"
" esc
"
vnoremap <space> <nop>
vnoremap @ <c-c>
vnoremap * <c-c>
vnoremap a <c-c>
vnoremap b <c-c>
"vnoremap d <c-c>
"vnoremap e <c-c>
"vnoremap h <c-c>
"vnoremap i <c-c>
"vnoremap o <c-c>
vnoremap q <c-c>
"vnoremap r <c-c>
"vnoremap s <c-c>
"vnoremap u <c-c>
vnoremap w <c-c>
"vnoremap x <c-c>
vnoremap y <c-c>
vnoremap <c-a> <c-c>
"vnoremap <c-f> <c-c>
"vnoremap <c-l> <c-c>
vnoremap <c-n> <c-c>
vnoremap <c-o> <c-c>
"vnoremap <c-p> <c-c>
vnoremap <c-q> <c-c>
"vnoremap <c-s> <c-c>
"vnoremap <c-u> <c-c>
vnoremap <c-v> <c-c>
vnoremap <c-w> <c-c>
vnoremap <c-x> <c-c>


"
" mode insert
"

" cursor mv line in
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$

" cursor mv char
inoremap <c-l> <c-o>l
inoremap <expr> <c-o> pumvisible() ? "<c-y>" : "<c-o>h"
"inoremap <c-o> <c-o>h

" cursor mv word
"inoremap <c-f> <c-o>w
"inoremap <c-q> <c-o>b

" del line
"inoremap <c-k> <c-o>D
"inoremap <c-c> <c-o>D

" del char forward
inoremap <c-d> <c-o>x
inoremap <c-s> <c-o>x
" del char back
inoremap <c-h> <c-h>

" del word forword
inoremap <expr> <c-k> pumvisible() ? "<c-p>" : "<c-o>dw"
"inoremap <expr> <c-k> pumvisible() ? "<up>"   : "<c-o>dw"

" line new
inoremap <expr> <c-j> pumvisible() ? "<c-n>" : "<cr>"
"inoremap <expr> <c-j> pumvisible() ? "<down>" : "<cr>"

" tab
inoremap <tab> <c-v><Tab>

" input complete
inoremap <c-m> <c-n>
"inoremap <c-j> <c-n>
"inoremap <c-v> <c-n>
inoremap <expr> <c-n> pumvisible() ? "<down>" : "<c-o>j"
inoremap <expr> <c-p> pumvisible() ? "<up>"   : "<c-o>k"

"inoremap ( ()<c-o>h
"inoremap < <><c-o>h
"inoremap [ []<c-o>h
inoremap { {}<c-o>h
inoremap <expr> " col(".") == 1 ? "\"" : "\"\"<c-o>h"
inoremap ' ''<c-o>h

" quit, esc
"inoremap <c-;> <esc>
inoremap <esc> <esc>
inoremap <c-c> <esc>
inoremap <c-f> <esc>
inoremap <c-q> <esc>


" 
" mode ex
" 
" quit
cnoremap <c-q> <c-c>

" cursor mv line in
cnoremap <c-a> <Home>
cnoremap <c-e> <End>

" cursor mv char
cnoremap <c-b> <Left>
cnoremap <c-l> <Right>

" cursor mv word
cnoremap <c-o> <S-Left>
cnoremap <c-f> <S-Right>

" del char
cnoremap <c-h> <bs>
cnoremap <c-d> <del>

" del word
cnoremap <c-k> <S-Right><c-w>

" del line in
cnoremap <c-c> <c-u>

"cnoremap <c-p> <Up>
"cnoremap <c-n> <Down>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
end

" vimgrep
command! -nargs=1 G :vimgrep /<args>/j **/*.lua
nnoremap :g :G 

"
" quickfix
"
autocmd QuickFixCmdPost vimgrep,grep tab cw
"autocmd QuickFixCmdPost vimgrep,grep,Latest tab cw
"autocmd QuickFixCmdPost vimgrep,grep,setqflist tab cw
"autocmd QuickFixCmdPost vimgrep,grep tab copen
"autocmd QuickFixCmdPost vimgrep,grep tab cgetb


"
" netrw
"

" launch
nnoremap :f :Tex .<cr>

let g:netrw_liststyle    = 3 " view file tree
let g:netrw_browse_split = 3 " file open tab

func! NetrwKeyBind_opn (islocal) abort
  return "normal  \<cr>"
endfunc
func! NetrwKeyBind_mv_word_back (islocal) abort
  return "normal! b"
endfunc

let g:Netrw_UserMaps = [
\ ['<c-o>'    , 'NetrwKeyBind_opn'],
\ ['<c-l>'    , 'NetrwKeyBind_opn'],
\ ['o'        , 'NetrwKeyBind_mv_word_back'],
\]
"\ ['<leader>o', 'NetrwKeyBind_opn'],
"\ ['o',         'NetrwMapping_cr'],


" 
" plugin
" 
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"
" fzf
"

" preview window
let g:fzf_preview_window = ['down:40%:hidden', 'ctrl-/']
let g:fzf_action = { 'ctrl-o': 'tab drop' }

"let g:fzf_buffers_jump = 1
"fzf#vim#complete#buffer_line([spec])

" lines
nnoremap <leader>i :BLines<cr>
vnoremap <leader>i "ay:BLines <c-r>a<cr>
command! -bang -nargs=? BLines
\ call fzf#vim#buffer_lines(<q-args>,{'options': ['--no-sort']}, <bang>1)

" files
nnoremap <leader>u :Files <cr>
vnoremap <leader>u :Files <cr>
"nnoremap <leader>f :Files <cr>
"vnoremap <leader>f :Files <cr>
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, <bang>1)

" rg
"
" fzf#vim#grep(
"   command,
"   [has_column bool],
"   [spec dict],
"   [fullscreen bool]
" )
nnoremap <leader>o :Rg <cr>
vnoremap <leader>o "ay:Rg <c-r>a<cr>
"nnoremap <leader>p :Rg <c-r><c-w><cr>
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg 
\     --line-number --smart-case --no-multiline --no-heading --color=always 
\     -- '.shellescape(<q-args>),
\   0,
\   fzf#vim#with_preview(
\     {'options': '--exact --delimiter : --nth 3..'},
\     'up:70%:hidden',
\     '/'
\   ),
\   <bang>1
\ )
"\     -g "*.lua" -g "*.script" -g "*.gui_script" 

" 
" ctags
" 
filetype on
set tags=./.tags;
"nnoremap <c-]> g<c-]>
"nnoremap :c :!sh sh/ctags.sh

nnoremap <leader>j :Tags <c-r><c-w><cr>
vnoremap <leader>j "ay:Tags <c-r>a<cr>
"nnoremap <leader>c :Tags<cr>
"vnoremap <leader>c "ay:Tags <c-r>a<cr>
command! -bang -nargs=? Tags
\ call fzf#vim#tags(<q-args>, <bang>1)

let g:fzf_colors = {
\   'hl':      ['fg', 'Statement'],
\   'hl+':     ['fg', 'Statement'],
\ }
"\   'bg+':     ['bg', 'Normal'],


"
" set last
"

" comment auto off
au FileType * set fo-=c fo-=r fo-=o

