set number
set nocompatible
set clipboard=unnamed
set autoindent expandtab tabstop=2 shiftwidth=2
set encoding=utf-8 nobomb
set hlsearch

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

abbr rlb Rails.logger.banner
abbr rld Rails.logger.debug
abbr pry! require 'pry'; binding.pry
abbr cl! console.log( )<left><left>
abbr rbf before { }<left><left>

nnoremap <silent> ,t :FZF<CR>

map ,ja :CtrlP app/assets<CR>
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jj :CtrlP app/assets/javascripts<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP app/libs<CR>
map ,jp :CtrlP app/public<CR>
map ,js :CtrlP app/spec<CR>
map ,jf :CtrlP app/fast_spec<CR>
map ,jd :CtrlP app/database<CR>
map ,jC :CtrlP app/config<CR>
map ,jV :CtrlP app/vendor<CR>
map ,jF :CtrlP app/factories<CR>
map ,jT :CtrlP app/test<CR>
nnoremap <silent> <D-M> :CtrlPBufTag<CR>

nnoremap <silent>  :Ag <cword><CR>
vnoremap  :<C-U>execute "Ag " . GetVisual()<CR>
nnoremap ,K viwf!:<C-U>execute "Ag " . GetVisual()<CR>
nnoremap <silent> ,gd :Ag 'def <cword>'<CR>
nnoremap ,gg :Ag ""<left>
nnoremap ,gcf :exec "Ag " . expand("%:t:r")<CR>u

:vmap ,gt :!tidy -q -i --show-errors 0<CR>

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

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

map <A-/> :TComment<CR>
imap <A-/> <Esc>:TComment<CR>i

nmap <A-A> :Tabularize /
vmap <A-A> :Tabularize /
map <A-%> :so %<CR>

map ,# ysiw#
vmap ,# c#{<C-R>"}<map <A-/> :TComment<CR>
imap <A-/> <Esc>:TComment<CR>i

function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

nmap <silent> // :nohlsearch<CR>

function! <SID>StripTrailingWhitespaces()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

"search
function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! "gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

nnoremap <silent> ,k :Ag <cword><CR>
vnoremap ,k :<C-U>execute "Ag " . GetVisual()<CR>
nnoremap ,K viwf!:<C-U>execute "Ag " . GetVisual()<CR>
nnoremap <silent> ,gd :Ag 'def <cword>'<CR>
nnoremap ,gg :Ag ""<left>
nnoremap ,gcf :exec "Ag " . expand("%:t:r")<CR>


"snipmate
let g:snipMate = { 'snippet_version' : 0 }

"surround
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " ="

"Tcomment
nmap <silent> gcp <c-_>p

"tidy
:vmap ,gt :!tidy -q -i --show-errors 0<CR>

"tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" ========================================
" Linux specific General vim sanity improvements
" ========================================
"
" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Now using the middle finger of either hand you can type
" underscores with Alt-k or Alt-d, and add Shift
" to type dashes
imap <silent> <A-k> _
imap <silent> <A-d> _
imap <silent> <A-K> -
imap <silent> <A-D> -

" Change inside various enclosures with Alt-" and Alt-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <A-'> f'ci'
nnoremap <A-"> f"ci"
nnoremap <A-(> f(ci(
nnoremap <A-)> f)ci)
nnoremap <A-[> f[ci[
nnoremap <A-]> f]ci]

" ==== NERD tree
" Alt-Shift-N for nerd tree
nmap <A-N> :NERDTreeToggle<CR>

" move up/down quickly by using Alt-j, Alt-k
" which will move us around by functions
nnoremap <silent> <A-j> }
nnoremap <silent> <A-k> {
autocmd FileType ruby map <buffer> <A-j> ]m
autocmd FileType ruby map <buffer> <A-k> [m
autocmd FileType rspec map <buffer> <A-j> }
autocmd FileType rspec map <buffer> <A-k> {
autocmd FileType javascript map <buffer> <A-k> }
autocmd FileType javascript map <buffer> <A-j> {

" Command-/ to toggle comments
map <A-/> :TComment<CR>
imap <A-/> <Esc>:TComment<CR>i

" Use Alt- numbers to pick the tab you want
map <silent> <A-1> :tabn 1<cr>
map <silent> <A-2> :tabn 2<cr>
map <silent> <A-3> :tabn 3<cr>
map <silent> <A-4> :tabn 4<cr>
map <silent> <A-5> :tabn 5<cr>
map <silent> <A-6> :tabn 6<cr>
map <silent> <A-7> :tabn 7<cr>
map <silent> <A-8> :tabn 8<cr>
map <silent> <A-9> :tabn 9<cr>

" Resize windows with arrow keys
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right>  <C-w>>

" ============================
" Tabularize - alignment
" ============================
" Hit Alt-Shift-A then type a character you want to align by
nmap <A-A> :Tabularize /
vmap <A-A> :Tabularize /

" Source current file Alt-% (good for vim development)
map <A-%> :so %<CR>}

" ========================================
" General vim sanity improvements
" ========================================
"
"
" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" ==== NERD tree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
" " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, K, J
" NOTE: This has moved to vim/settings/vim-tmux-navigator.vim.
" nnoremap <silent> <C-h> <C-w>h
" nnoremap <silent> <C-l> <C-w>l
" nnoremap <silent> <C-k> <C-w>k
" nnoremap <silent> <C-j> <C-w>j

" Make gf (go to file) create the file, if not existent
nnoremap <C-w>f :sp +e<cfile><CR>
nnoremap <C-w>gf :tabe<cfile><CR>

" Zoom in
map <silent> ,gz <C-w>o

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cr :let @* = expand("%")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Get the current highlight group. Useful for then remapping the color
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" ,hp = html preview
map <silent> ,hp :!open -a Safari %<CR><CR>

" Map Ctrl-x and Ctrl-z to navigate the quickfix error list (normally :cn and
" :cp)
nnoremap <silent> <C-x> :cn<CR>
nnoremap <silent> <C-z> :cp<CR>

" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>

" Make it beautiful - colors and fonts

if has("gui_running")
  "tell the term has 256 colors
  set t_Co=256

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  if has("gui_gtk2")
    set guifont=Inconsolata\ XL\ 12,Inconsolata\ 15,Monaco\ 12
  else
    set guifont=Inconsolata\ XL:h17,Inconsolata:h20,Monaco:h17
  end
else
  let g:CSApprox_loaded = 1

  " For people using a terminal that is not Solarized
  if exists("g:yadr_using_unsolarized_terminal")
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
  end
endif

colorscheme solarized
set background=dark

"vimspec
map rcs :call RunCurrentSpecFile()<CR>
map rcl :call RunNearestSpec()<CR>
map rls :call RunLastSpec()<CR>
map ras :call RunAllSpecs()<CR>

"pluggin

call plug#begin()
  Plug 'thoughtbot/vim-rspec'
  Plug 'junegunn/vim-easy-align'
  Plug 'ecomba/vim-ruby-refactoring'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-rvm'
  Plug 'vim-ruby/vim-ruby'
  Plug 'keith/rspec.vim'
  Plug 'skwp/vim-iterm-rspec'
  Plug 'skwp/vim-spec-finder'
  Plug 'ck3g/vim-change-hash-syntax'
  Plug 'tpope/vim-bundler'
  Plug 'justinmk/vim-sneak'
  Plug 'rking/ag.vim'
  Plug 'henrik/vim-indexed-search'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'skwp/greplace.vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'Raimondi/delimitMate'
  Plug 'briandoll/change-inside-surroundings.vim'
  Plug 'godlygeek/tabular'
  Plug 'tomtom/tcomment_vim'
  Plug 'vim-scripts/camelcasemotion'
  Plug 'https://github.com/adelarsq/vim-matchit'
  Plug 'kristijanhusak/vim-multiple-cursors'
  Plug 'Keithbsmiley/investigate.vim'
  Plug 'chrisbra/NrrwRgn'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'bogado/file-line'
  Plug 'mattn/webapi-vim'
  Plug 'sjl/gundo.vim'
  Plug 'skwp/YankRing.vim'
  Plug 'tomtom/tlib_vim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-scripts/AnsiEsc.vim'
  Plug 'vim-scripts/AutoTag'
  Plug 'vim-scripts/lastpos.vim'
  Plug 'vim-scripts/sudo.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'chrisbra/color_highlight'
  Plug 'skwp/vim-colors-solarized'
  Plug 'itchyny/lightline.vim'
  Plug 'jby/tmux.vim'
  Plug 'morhetz/gruvbox'
  Plug 'chriskempson/base16-vim'
  Plug 'godlygeek/csapprox'
  Plug 'gregsexton/gitv'
  Plug 'mattn/gist-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'
  Plug 'w0rp/ale'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
  Plug 'jtratner/vim-flavored-markdown'
  Plug 'vim-syntastic/syntastic'
  Plug 'nelstrom/vim-markdown-preview'
  Plug 'skwp/vim-html-escape'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'jparise/vim-graphql'
  Plug 'mogelbrod/vim-jsonpath'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf'
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
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'thinca/vim-textobj-function-javascript'
  Plug 'wellle/targets.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()

let g:deoplete#enable_at_startup = 1
autocmd CursorHold * silent! checktime
