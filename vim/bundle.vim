set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Textmate's CMD-T alike
Bundle 'kien/ctrlp.vim'

Bundle 'bitc/vim-bad-whitespace'

" Auto indentation discovery
" is it useful?
Bundle 'ciaranm/detectindent'
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
autocmd BufNewFile,BufReadPost * :DetectIndent
autocmd FileType make setlocal noexpandtab

" Syntax checking
Bundle 'scrooloose/syntastic'

" Theme
Bundle 'fugalh/desert.vim'
colorscheme desert

" git wrapper
Bundle 'tpope/vim-fugitive'

" git diff in gutter
Bundle 'airblade/vim-gitgutter'

"Bundle 'Lokaltog/powerline'
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"call vam#ActivateAddons(['powerline'])

" Undo manager
Bundle 'Gundo'
nnoremap <F5> :GundoToggle<CR>

" Autocompletion, resintall with ./install.sh
Bundle 'Valloric/YouCompleteMe'

" Buffer helper
Bundle 'troydm/easybuffer.vim'
nnoremap <c-@> :EasyBuffer<CR>
" XXX: why is it <C-Space> as well?
" Buffer is simply created from :edit file or :badd file
" Buffer list is listed (outside of plugin) using :buffers


filetype plugin indent on

