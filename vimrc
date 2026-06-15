set nocompatible
let mapleader=','

if has('nvim')
  let s:plug_dir = stdpath('data') . '/plugged'
  let s:plug_autoload = stdpath('config') . '/autoload/plug.vim'
  let s:undo_dir = stdpath('data') . '/backups'
elseif has('win32')
  let s:plug_dir = expand('~/vimfiles/plugged')
  let s:plug_autoload = expand('~/vimfiles/autoload/plug.vim')
  let s:undo_dir = expand('~/vimfiles/backups')
else
  let s:plug_dir = expand('~/.vim/plugged')
  let s:plug_autoload = expand('~/.vim/autoload/plug.vim')
  let s:undo_dir = expand('~/.vim/backups')
endif

if !filereadable(s:plug_autoload)
  call mkdir(fnamemodify(s:plug_autoload, ':h'), 'p')
  if has('win32')
    silent !powershell -NoProfile -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -OutFile $env:USERPROFILE\vimfiles\autoload\plug.vim"
  else
    silent execute '!curl -fLo' shellescape(s:plug_autoload) 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
  autocmd VimEnter * source $MYVIMRC
endif

execute 'source ' . fnameescape(s:plug_autoload)

call plug#begin(s:plug_dir)

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'henrik/vim-indexed-search'
Plug 'nelstrom/vim-visual-star-search'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'Keithbsmiley/investigate.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'bogado/file-line'
Plug 'skwp/YankRing.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'vim-scripts/matchit'
Plug 'vim-scripts/AutoTag'
Plug 'vim-scripts/lastpos'
Plug 'vim-scripts/AnsiEsc'
Plug 'editorconfig/editorconfig-vim'
Plug 'goldfeld/ctrlr.vim'
Plug 'skwp/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/color_highlight'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
if !has('win32')
  Plug 'xsunsmile/showmarks'
endif
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'w0rp/ale'
Plug 'jtratner/vim-flavored-markdown'
Plug 'nelstrom/vim-markdown-preview'
Plug 'skwp/vim-html-escape'
Plug 'jparise/vim-graphql'
Plug 'mogelbrod/vim-jsonpath'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/rspec.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'skwp/vim-spec-finder'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'austintaylor/vim-indentobject'
Plug 'bootleq/vim-textobj-rubysymbol'
Plug 'coderifous/textobj-word-column.vim'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'wellle/targets.vim'
if has('python3') || has('python')
  Plug 'sjl/gundo.vim'
endif

if !has('win32')
  let g:showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY'
  let g:showmarks_ignore_type = 'hqrm'
endif

call plug#end()

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set visualbell
set autoread
set hidden
syntax on
set noswapfile
set nobackup
set nowb
set encoding=utf-8
set fileencoding=utf-8

if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif
if has('persistent_undo')
  set undodir=s:undo_dir
  set undofile
endif

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
nnoremap p p=`]
nnoremap P P=`]
filetype plugin on
filetype indent on
set list listchars=tab:\ \ ,trail:·
set nowrap
set linebreak
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~,*.png,*.jpg,*.gif,*.gem,log/**,tmp/**,vendor/rails/**,vendor/cache/**
set scrolloff=8
set sidescrolloff=15
set sidescroll=1
set incsearch
set hlsearch
set ignorecase
set smartcase
set modelines=0
set nomodeline
set laststatus=2

if has('gui_running')
  set t_Co=256
  set guioptions-=r
  set guioptions-=L
  set guioptions-=T
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M
  if has('win32')
    set guifont=Consolas:h11
  endif
else
  if has('termguicolors')
    set termguicolors
  endif
endif

let g:solarized_termcolors = 256
let g:solarized_contrast = 'normal'
if !has('gui_running')
  let g:solarized_termtrans = 0
endif

set background=dark
silent! colorscheme solarized
if !exists('g:colors_name') || g:colors_name !=# 'solarized'
  colorscheme desert
endif

function! s:YadrColorsFix()
  hi Normal guifg=#93a1a1 ctermfg=251 guibg=#002b36 ctermbg=234
  hi Comment guifg=#52737B ctermfg=241 gui=italic
  hi Constant guifg=#2aa198 ctermfg=37
  hi Identifier guifg=#93a1a1 ctermfg=251
  hi Statement guifg=#859900 ctermfg=108
  hi Type guifg=#b58900 ctermfg=136 gui=bold
  hi Function guifg=#268bd2 ctermfg=33
  hi Special guifg=#dc322f ctermfg=160
  hi CursorLine guibg=#073642 ctermbg=235 gui=NONE cterm=NONE
  hi LineNr guifg=#586e75 ctermfg=241 guibg=#002b36 ctermbg=234 gui=bold
  hi VertSplit guifg=#073642 ctermbg=NONE
  hi Visual guibg=#073642 ctermbg=236
  hi MatchParen guibg=#073642 ctermbg=235 gui=bold

  hi link rubyLocalVariableOrMethod Normal
  hi link rubyDoBlock Normal
  hi link rubySymbol Identifier
  hi link rubyString Constant
  hi link rubyStringDelimiter Constant
  hi link rubyControl Statement
  hi link rubyPseudoVariable Type
  hi link rubyRailsMethod Type
  hi link rubyRailsARAssociationMethod Type
  hi link rubyRailsARValidationMethod Type

  hi NERDTreeFile guibg=NONE ctermbg=NONE
  hi link NERDTreeFile Constant
  hi link NERDTreeDir Identifier
endfunction
call s:YadrColorsFix()
augroup YadrColors
  autocmd!
  autocmd ColorScheme * call s:YadrColorsFix()
augroup END

let g:indent_guides_exclude_filetypes = ['nerdtree', 'help', 'startify', 'fzf']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1

if executable('ag')
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'
  let g:ctrlp_use_caching = 0
elseif executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --glob !.git'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_map = ',t'

if executable('ag')
elseif executable('rg')
  let g:ag_prg = 'rg'
  let g:ag_args = '--vimgrep'
endif

let g:EasyMotion_keys = 'asdfjkoweriop'
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_key = ',mc'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'
let g:yankring_history_dir = expand('~/vimfiles')
let g:yankring_history_file = 'yankring_history'
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:autotagExcludeSuffixes = 'tml.xml.text.txt.vim'
let g:surround_113 = "#{\r}"
let g:surround_35 = "#{\r}"
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:ale_sign_column_always = 1

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'YadrFugitive',
      \   'readonly': 'YadrReadonly',
      \   'filename': 'YadrFilename',
      \ },
      \ }

function! YadrReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return 'RO '
  else
    return ''
  endif
endfunction

function! YadrFugitive()
  if exists('*FugitiveHead')
    let h = FugitiveHead()
    return strlen(h) ? h . ' ' : ''
  endif
  return ''
endfunction

function! YadrFilename()
  return ('' != YadrReadonly() ? YadrReadonly() . ' ' : '') .
        \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction

if has('python3') || has('python')
  let g:gundo_right = 1
  let g:gundo_width = 60
endif

autocmd BufNewFile,BufRead *.es6 setfiletype javascript
autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
autocmd User fugitive
  \ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

inoremap <C-Space> <C-n>

nnoremap ,yw yiww
nnoremap ,ow "_diwhp
nnoremap Y y$
nnoremap 0 ^
nnoremap ^ 0
map ,# ysiw#
vmap ,# c#{<C-R>"}<Esc>
map ," ysiw"
vmap ," c"<C-R>""<Esc>
map ,' ysiw'
vmap ,' c'<C-R>"'<Esc>
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<Esc>
vmap ,) c(<C-R>")<Esc>
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<Esc>
vmap ,] c[<C-R>"]<Esc>
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<Esc>
vmap ,{ c{<C-R>"}<Esc>
map ,` ysiw`
imap <C-l> <space>=><space>
nnoremap ,. '.
imap <C-a> <Esc>wa

function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <C-w>f :sp +e<cfile><CR>
nnoremap <C-w>gf :tabe<cfile><CR>
map <silent> ,gz <C-w>o
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s
imap <silent> <C-K> <%=   %><Esc>3hi
imap <silent> <C-J> <%  %><Esc>2hi
nnoremap <silent> ,cf :let @+ = expand('%:p')<CR>
nnoremap <silent> ,cr :let @+ = expand('%')<CR>
nnoremap <silent> ,cn :let @+ = expand('%:t')<CR>
nmap <silent> // :nohlsearch<CR>
nmap <silent> ,vc yy:<C-f>p<C-c><CR>
nmap <silent> ,vr :so %<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>
nnoremap ' `
nnoremap ` '
nmap sj :SplitjoinSplit<CR>
nmap sk :SplitjoinJoin<CR>
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
nnoremap <silent> <C-x> :cn<CR>
nnoremap <silent> <C-z> :cp<CR>

imap <silent> <A-k> _
imap <silent> <A-d> _
imap <silent> <A-K> -
imap <silent> <A-D> -
nnoremap <A-'> f'ci'
nnoremap <A-"> f"ci"
nnoremap <A-(> f(ci(
nnoremap <A-)> f)ci)
nnoremap <A-[> f[ci[
nnoremap <A-]> f]ci]
nmap <A-N> :NERDTreeToggle<CR>
nnoremap <silent> <A-j> }
nnoremap <silent> <A-k> {
autocmd FileType ruby map <buffer> <A-j> ]m
autocmd FileType ruby map <buffer> <A-k> [m
autocmd FileType rspec map <buffer> <A-j> }
autocmd FileType rspec map <buffer> <A-k> {
autocmd FileType javascript map <buffer> <A-k> }
autocmd FileType javascript map <buffer> <A-j> {
map <A-/> :TComment<CR>
imap <A-/> <Esc>:TComment<CR>i
map <silent> <A-1> :tabn 1<CR>
map <silent> <A-2> :tabn 2<CR>
map <silent> <A-3> :tabn 3<CR>
map <silent> <A-4> :tabn 4<CR>
map <silent> <A-5> :tabn 5<CR>
map <silent> <A-6> :tabn 6<CR>
map <silent> <A-7> :tabn 7<CR>
map <silent> <A-8> :tabn 8<CR>
map <silent> <A-9> :tabn 9<CR>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nmap <A-A> :Tabularize /<CR>
vmap <A-A> :Tabularize /<CR>
map <A-%> :so %<CR>

nnoremap <silent> ,t :CtrlP<CR>
nnoremap <silent> ,b :CtrlPBuffer<CR>
nnoremap <silent> <A-P> :ClearCtrlPCache<CR>
nnoremap <silent> <A-M> :CtrlPBufTag<CR>
map ,ja :CtrlP app/assets<CR>
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jj :CtrlP app/assets/javascripts<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP lib<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jf :CtrlP fast_spec<CR>
map ,jd :CtrlP db<CR>
map ,jC :CtrlP config<CR>
map ,jV :CtrlP vendor<CR>
map ,jF :CtrlP factories<CR>
map ,jT :CtrlP test<CR>

nmap ,<Esc> ,,w
nmap ,<S-Esc> ,,b
nmap <space> <Plug>SneakForward
nmap <S-space> <Plug>SneakBackward

function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction
nnoremap <silent> ,k :Ag <C-R><C-W><CR>
vnoremap ,k :<C-U>execute 'Ag ' . GetVisual()<CR>
nnoremap ,K viwf!:<C-U>execute 'Ag ' . GetVisual()<CR>
nnoremap <silent> ,gd :Ag 'def <C-R><C-W>'<CR>
nnoremap ,gg :Ag ""<Left>
nnoremap ,gcf :exec 'Ag ' . expand('%:t:r')<CR>
nmap ,ag :Ag ""<Left>
nmap ,af :AgFile ""<Left>
nnoremap <silent> ,f <C-]>
nnoremap <silent> ,F :let word=expand('<cword>')<CR>:vsp<CR>:wincmd w<CR>:exec('tag ' . word)<CR>
nnoremap <silent> ,gf :vertical botright wincmd F<CR>
nnoremap <silent> ,q/ :execute 'vimgrep /' . @/ . '/g %'<CR>:copen<CR>
nnoremap <silent> ,qa/ :execute "Ag! '" . substitute(substitute(substitute(@/, '\\<', '\\b', ''), '\\>', '\\b', ''), '\\v', '', '') . "'"<CR>

onoremap an :<C-U>call <SID>NextTextObject('a', '/')<CR>
xnoremap an :<C-U>call <SID>NextTextObject('a', '/')<CR>
onoremap in :<C-U>call <SID>NextTextObject('i', '/')<CR>
xnoremap in :<C-U>call <SID>NextTextObject('i', '/')<CR>
onoremap al :<C-U>call <SID>NextTextObject('a', '?')<CR>
xnoremap al :<C-U>call <SID>NextTextObject('a', '?')<CR>
onoremap il :<C-U>call <SID>NextTextObject('i', '?')<CR>
xnoremap il :<C-U>call <SID>NextTextObject('i', '?')<CR>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  if c ==# 'b' || c ==# '(' || c ==# ')'
    let c = '('
  elseif c ==# 'B' || c ==# '{' || c ==# '}'
    let c = '{'
  elseif c ==# 'r' || c ==# '[' || c ==# ']'
    let c = '['
  elseif c ==# "'"
    let c = "'"
  elseif c ==# '"'
    let c = '"'
  else
    return
  endif
  execute 'normal! ' . a:dir . c . "\<CR>"
  if a:motion ==# 'a'
    execute 'normal! va' . c
  else
    let open = c ==# '(' ? '(' : c ==# '{' ? '{' : c ==# '[' ? '\[' : c
    let close = c ==# '(' ? ')' : c ==# '{' ? '}' : c ==# '[' ? '\]' : c
    let start_pos = getpos('.')
    let start_l = start_pos[1]
    let start_c = start_pos[2]
    if c ==# "'" || c ==# '"'
      let end_pos = searchpos(open)
    else
      let end_pos = searchpairpos(open, '', close)
    endif
    let end_l = end_pos[0]
    let end_c = end_pos[1]
    call setpos('.', start_pos)
    if start_l == end_l && start_c == (end_c - 1)
      execute 'normal! ax<Esc><Left>'
      execute 'normal! vi' . c
    elseif start_l == end_l && start_c == (end_c - 2)
      execute 'normal! vi' . c
    else
      let whichwrap = &whichwrap
      set whichwrap+=h,l
      execute 'normal! va' . c . 'hol'
      let &whichwrap = whichwrap
    endif
  endif
endfunction

function! CloseWindowOrKillBuffer()
  let n = len(filter(range(1, winnr('$')), 'winbufnr(v:val) == bufnr("%")'))
  if matchstr(expand('%'), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if n > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

function! OpenChangedFiles()
  only
  let filenames = []
  for line in split(system('git status -s'), '\n')
    if line =~# '^.[MA]' && len(split(line)) >= 2
      call add(filenames, split(line)[-1])
    endif
  endfor
  if len(filenames) > 0
    execute 'edit ' . fnameescape(filenames[0])
    for filename in filenames[1:]
      execute 'sp ' . fnameescape(filename)
    endfor
  endif
endfunction
command! OpenChangedFiles call OpenChangedFiles()
nnoremap ,ocf :OpenChangedFiles<CR>

function! StripTrailingWhitespaces()
  let _s = @/
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  let @/ = _s
  call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

function! SetupWrapping()
  set wrap linebreak nolist
  set showbreak=.
endfunction
command! -nargs=* Wrap call SetupWrapping()

nnoremap <silent> ,orb :normal varar%<Esc><Esc>
nnoremap <silent> ,vv :Eview<CR>
nnoremap <silent> ,cc :Econtroller<CR>
nnoremap ,ci :ChangeInsideSurrounding<CR>
nmap <silent> gcp <C-_>p
nnoremap ,yr :YRShow<CR>
if has('python3') || has('python')
  nmap ,u :GundoToggle<CR>
endif
nmap ,ig :IndentGuidesToggle<CR>
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e
sunmap W
sunmap B
sunmap E
nnoremap <A-*> *
vnoremap <A-*> *

if has('win32')
  map <silent> ,hp :!start "" "%"<CR><CR>
else
  map <silent> ,hp :!open -a Safari %<CR><CR>
endif

vmap ,gt :!tidy -q -i --show-errors 0<CR>

function! ChangePendingRspecToXit()
  while search('pending(') > 0
    normal dd
    ?it\s
    normal ix
  endwhile
endfunction
nnoremap <silent> ,rxit :call ChangePendingRspecToXit()<CR>
nnoremap <silent> \bf ^ibefore { <Esc>$a }
nnoremap <silent> \sp ^ispecify { <Esc>$a }

abbr rlb Rails.logger.banner
abbr rld Rails.logger.debug
abbr pry! require 'pry'; binding.pry
abbr cl! console.log( )<Left><Left>
abbr rbf before { }<Left><Left>
