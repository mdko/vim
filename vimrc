" Based on .vimrc by Douglas Black (http://dougblack.io/words/a-good-vimrc.html),
" with lines I do not need/like/understand yet commented out.
" Also some tips from Steve Losh (http://stevelosh.com/blog/2010/09/coming-home-to-vim/).
" Colors {{{
syntax enable           " enable syntax processing
"colorscheme badwolf
set background=dark		" if you have a dark background in terminal, gets a better color map for syntax highlighting (tells Vim what bg color looks like)
" }}}
" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
set clipboard=unnamed
"set hidden
set undofile					" create a .un~ file whenever editing a file
nnoremap ; :
inoremap jk <esc>
noremap Y y$
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
"set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4        " 4 spaces when shifting blocks with >>, <<
set modeline
set modelines=1         " number of lines at beginning/end of file checked for modelines
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu
"set lazyredraw
set showmatch           " higlight matching parenthesis
set showmode
set scrolloff=3			" how far away from screen edges before screen scrolls
set ruler
"set formatoptions=qrn1
set colorcolumn=61		" 80
set title
" }}}
" Searching & Moving {{{
set ignorecase          " ignore case when searching
set smartcase			" ...unless you word has a capital letter
set gdefault			" applies substitutions globally on lines
set showmatch			" jump to matching bracket when inserted
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
nnoremap <C-h> <C-w>h	" move around split windows more easily
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 10
set foldcolumn=4		" size of column on left showing open/closed folds
" }}}
" Line Shortcuts {{{
"nnoremap j gj
"nnoremap k gk
"nnoremap B ^
"nnoremap E $
"nnoremap $ <nop>
"nnoremap ^ <nop>
nnoremap <tab> %
vnoremap <tab> %
nnoremap gV `[v`]
vnoremap . :norm.<CR>	 " Thanks to http://www.danielmiessler.com/study/vim/ for this
" }}}
" Leader Shortcuts {{{
let mapleader=","
"nnoremap <leader>m :silent make\|redraw!\|cw<CR>
"nnoremap <leader>w :NERDTree<CR>
" Gundo: git clone http://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
nnoremap <leader>u :GundoToggle<CR>
"nnoremap <leader>h :A<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>n :call ToggleNumber()<CR>
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
"nnoremap <leader>a :Ag			" silver searcher -- like ack, but better
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
"nnoremap <leader>d :Make! 
"nnoremap <leader>r :call RunTestFile()<CR>
"nnoremap <leader>g :call RunGoFile()<CR>
"vnoremap <leader>y :w !pbcopy<CR><CR>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>	" strip trailing whitespace
nnoremap <leader>l :set list!<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>r :set wrap!<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>ct :!ctags -R *<cr>
nnoremap <leader>b :call ChangeColorMap()<CR>
" }}}
" Man Plugin {{{
runtime ftplugin/man.vim
" }}}
" Powerline {{{
set encoding=utf-8
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
set laststatus=2
" }}}
" Ctags (For function name display) {{{
"let g:ctags_path='/usr/bin/ctags'
"let g:ctags_args='-L <files to create tags from>' " Args to pass to ctags
let g:ctags_title=1				  " To show tag name in title bar.
let g:ctags_statusline=1		  " To show tag name in status line.
let generate_tags=1				  " To start automatically when a supported
" }}}
" Vim-Airline {{{
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
" }}}
" CtrlP {{{
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|\.(o|swp|pyc|egg)$'
" }}}
" NERDTree {{{
"let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
" }}}
" Syntastic {{{
let g:syntastic_ignore_files = ['.java$','.cpp']
" }}}
" Launch Config {{{
"runtime! debian.vim
set nocompatible " don't make it vi compatible
call pathogen#infect()
" }}}
" Tmux {{{
"if exists('$TMUX') " allows cursor change in tmux mode
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
"    autocmd BufEnter *.cls setlocal filetype=java
"    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Backups {{{
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" toggles default color map (light vs dark background)
" see 'http://vim.wikia.com/wiki/Better_colors_for_syntax_highlighting'
function! ChangeColorMap()
	if (&background=="dark")
		set background=light
	else
		set background=dark
	endif
endfunction
" }}}
" Other {{{
" TODO: figure out a way to replace 'f' with 'F' in statusline when wanted
" }}}
"
" vim:foldmethod=marker:foldlevel=0
