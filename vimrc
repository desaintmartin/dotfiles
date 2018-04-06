set nocompatible

filetype indent plugin on

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" XXX check this one
map P :TlistToggle<CR>

syntax on

set encoding=utf8
set expandtab
set textwidth=79
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set backspace=indent,eol,start
set shiftround
set smartcase
set showmode
set showcmd
set autoindent
set nocindent
set paste
set number
set relativenumber
set ruler

set hlsearch
set showmatch
set incsearch
set nowrap

set mouse=a
set mousehide

set novisualbell

set history=1000

set cursorline
set cursorcolumn

set cc=80

" Command completion style
set wildmode=list:longest,list:full
set complete=slf

set listchars=trail:◃,nbsp:•
set list

autocmd FileType python set omnifunc=pythoncomplete#Complete

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Blank character
set lcs=tab:\→\ ,trail:~,nbsp:¤,extends:>,precedes:<
set list


function! ToggleFold()
	if foldlevel('.') == 0
		normal! l
	else
		if foldclosed('.') < 0
			 . foldclose
		else
			 . foldopen
		endif
  endif
  echo
endf

" Folding
hi FoldColumn guibg=grey78 gui=Bold guifg=DarkBlue
"set foldmethod=syntax
set foldcolumn=0
set foldclose=
set foldmethod=indent
set foldnestmax=10
set foldlevel=10
set fillchars=vert:\|,fold:\
set foldminlines=5

" Code folding toggle
noremap <space> :call ToggleFold()<CR>

" Vundle (package manager, call :BundleInstall in vim)
source ~/.vim/bundle.vim

highlight Normal ctermfg=grey ctermbg=233

