" Based on .vimrc by Douglas Black (http://dougblack.io/words/a-good-vimrc.html),
" with lines I do not need/like/understand yet commented out.
" Also some tips from Steve Losh (http://stevelosh.com/blog/2010/09/coming-home-to-vim/).
" Note: my .scm (scheme) files are set to be identified as racket for
" syntax-highlighting purposes (via "~/.vim/bundle/vim-racket/ftdetect/racket.vim")
" Colors {{{
syntax enable           " enable syntax processing
set background=dark		" if you have a dark background in terminal, gets a better color map for syntax highlighting (tells Vim what bg color looks like)
"colorscheme bandit
hi Comment ctermfg=DarkYellow
" }}}
" Misc {{{
set ttyfast                     " faster redraw
" Enable mouse use in all modes
set mouse=a
" Terminal that supports mouse codes
set ttymouse=xterm2

set backspace=indent,eol,start
set clipboard=unnamed
"set hidden
nnoremap ; :
inoremap jk <esc>
noremap Y y$
cnoremap W w
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs (change for writing in C, leave for Haskell)
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
set colorcolumn=80 "65 140 61 80
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
"nnoremap <leader>s :mksession<CR>
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
nnoremap <leader>cl :call ToggleLeftHandInfo()<CR>  " toggle various lines, numbers, etc. on left side of screen, for easy visual copying
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
" Trinity {{{
nnoremap <leader>t :TrinityToggleAll<CR>
" nmap <leader>[something] :TrinityToggleSourceExplorer<CR>
" nmap <leader>[something] :TrinityToggleTagList<CR>
" nmap <leader>[something] :TrinityToggleNERDTree<CR>
" -- for Source_Explorer
" let g:SrcExpl_updateTagsCmd = ""
"
" Set the height of Source Explorer window "
let g:SrcExpl_winHeight = 8

" Set 100 ms for refreshing the Source Explorer "
let g:SrcExpl_refreshTime = 100

" Set "Enter" key to jump into the exact definition context "
let g:SrcExpl_jumpKey = "<ENTER>"

" Set "Space" key for back from the definition context "
let g:SrcExpl_gobackKey = "<SPACE>"

" In order to avoid conflicts, the Source Explorer should know what plugins "
" except itself are using buffers. And you need add their buffer names into "
" below listaccording to the command ":buffers!"                            "
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
     \ ]

" Enable/Disable the local definition searching, and note that this is not  "
" guaranteed to work, the Source Explorer doesn't check the syntax for now. "
" It only searches for a match with the keyword according to command 'gd'   "
let g:SrcExpl_searchLocalDef = 1

" Do not let the Source Explorer update the tags file when opening "
let g:SrcExpl_isUpdateTags = 0
"                                                                              "
" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to "
" create/update a tags file                                                "
" let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"                                                                              "
" Set "<F12>" key for updating the tags file artificially                   "
" let g:SrcExpl_updateTagsKey = "<F12>"
"                                                                              "
" Set "<F3>" key for displaying the previous definition in the jump list    "
" let g:SrcExpl_prevDefKey = "<F3>"
"                                                                              "
" Set "<F4>" key for displaying the next definition in the jump list        "
" let g:SrcExpl_nextDefKey = "<F4>"
" }}}
" CCTree {{{
let g:CCTreeCscopeDb = "$CSCOPE_DB"
" }}}
" Ctags {{{
set tags=$CTAGS
set csto=0 " set to 1 for vim to use ctags file before cscope file
" }}}
" TagHighlight {{{
if ! exists('g:TagHighlightSettings')
let g:TagHighlightSettings = {}
endif
"let g:TagHighlightSettings['TagFileName'] = $CTAGS
" }}}
" Launch Config {{{
"runtime! debian.vim
set nocompatible " don't make it vi compatible
call pathogen#infect()
" }}}
" Slimv {{{
"let g:slimv_swank_cmd = '! xterm -e clisp --load /home/michael/.vim/bundle-available/slime/slime/start-swank.lisp &'
"let g:slimv_swank_cmd = '! xterm -e mit-scheme-x86-64 --load /home/michael/.vim/bundle/slimv/slime/start-swank.lisp &'
" }}}
" Tslime {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<leader>s'
let g:tslime_visual_mapping = '<leader>s'
let g:tslime_vars_mapping = '<leader>S'
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
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.rb :call <SID>StripTrailingWhitespaces()
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
"    autocmd BufEnter *.cls setlocal filetype=java
"    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}
" Undos {{{
set undofile					" create a .un~ file whenever editing a file
" Put it in the current directory's .vim-undo dir if exists, otherwise home
" ~/.vim-undo directory we create ourselves. See
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
if exists("+undofile")
    if isdirectory($HOME . '/.vim-undo') == 0
        :silent !mkdir ~/.vim-undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo//
    set undodir+=~/.vim-undo//
    set undofile
endif
"}}}
" Backups and Swaps {{{
set backup 
if isdirectory($HOME . '/.vim-backup') == 0
    :silent !mkdir ~/.vim-backup >/dev/null 2>&1
endif
set backupdir=./.vim-backup,~/.vim-backup,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
if isdirectory($HOME . '/.vim-swap') == 0
    :silent !mkdir ~/.vim-swap >/dev/null 2>&1
endif
set directory=./.vim-swap//,~/.vim-swap//,~/.tmp,~/tmp,/var/tmp,/tmp 
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

function! ToggleLeftHandInfo()
    " TODO actually toggle
    set nonumber
    set norelativenumber
    set nofoldenable
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
" K-framework {{{
au BufRead,BufNewFile *.k set filetype=kframework
au! Syntax kframework source kframework.vim
syn on
" }}}
" Other {{{
" TODO: figure out a way to replace 'f' with 'F' in statusline when wanted
" }}}
"
" vim:foldmethod=marker:foldlevel=0
