if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Textmate's CMD-T alike
NeoBundle 'kien/ctrlp.vim'

" bad-whitespace - Highlights whitespace at the end of lines
NeoBundle 'bitc/vim-bad-whitespace'

" Auto indentation discovery
" is it useful?
NeoBundle 'ciaranm/detectindent'
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
autocmd BufNewFile,BufReadPost * :DetectIndent
autocmd FileType make setlocal noexpandtab

" Syntax checking
NeoBundle 'vim-syntastic/syntastic'
"let g:syntastic_python_pylint_args = "--rcfile ~/.pylintrc"
let g:syntastic_python_checkers = ['flake8']

" Theme
NeoBundle 'altercation/vim-colors-solarized'
colorscheme solarized

" git wrapper
NeoBundle 'tpope/vim-fugitive'

" git diff in gutter
NeoBundle 'airblade/vim-gitgutter'

"Bundle 'Lokaltog/powerline'
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"call vam#ActivateAddons(['powerline'])

" Undo manager
NeoBundle 'Gundo'
nnoremap <F5> :GundoToggle<CR>

" Autocompletion, resintall with ./install.sh
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'build' : {
            \ 'unix' : './install.sh --clang-completer --system-libclang'
            \ },
\ }

" Buffer helper
NeoBundle 'troydm/easybuffer.vim'
nnoremap <c-@> :EasyBuffer<CR>
" XXX: why is it <C-Space> as well?
" Buffer is simply created from :edit file or :badd file
" Buffer list is listed (outside of plugin) using :buffers

" Rainbow Parentheses
NeoBundle 'luochen1990/rainbow'
let g:rainbow_active = 1

NeoBundle 'vim-scripts/DeleteTrailingWhitespace'
let g:DeleteTrailingWhitespace = 1

filetype plugin indent on

NeoBundleCheck

