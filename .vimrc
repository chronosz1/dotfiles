""""""""""""""""""""""""""""""""
"""""""""" Basic Mode """"""""""
""""""""""""""""""""""""""""""""

set encoding=utf-8
filetype on
set clipboard=unnamedplus " Set desktop clipboard
set nowrap

"""""""""
" Spacing
"""""""""

set tabstop=4     " visual spaces for TAB character
set softtabstop=4 " number of spaces in tab for editing
set expandtab     " insert spaces instead of TAB character
set shiftwidth=4  " number of spaces to introduce on return for control structures, functions, etc

"""""""""""""""""
" Language syntax
"""""""""""""""""

syntax enable

""""
" UI
""""

colorscheme desert
highlight ExtraWhitespace ctermbg=red
set number
set cursorline
set showcmd
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-10.(%l,%c%V%)\ %<%P        " offset
highlight StatusLine ctermbg=3 ctermfg=10
highlight CursorLine ctermbg=darkgrey
highlight LineNr ctermbg=darkgrey ctermfg=white


set splitbelow
set splitright

set guifont=Neep\ 18


syntax on

""""""""
" Python
""""""""
augroup python_autocommands
    autocmd FileType python nnoremap <buffer> <Leader>G ofrom ipdb import set_trace; from pprint import pprint as pp;set_trace(context=6)<Esc>
augroup END

""""""""""""""""""
" PEP8 indentation
""""""""""""""""""
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let g:python_highlight_all=1


""""""""""
" HTML, JS
""""""""""
au BufNewFile,BufRead *.html,*.twig,*.vue,*.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set autoindent |
    \ set fileformat=unix


"""""""""""""""""
" Functionalities
"""""""""""""""""
"set foldmethod=indent
"set foldlevel=99

"""""""""""""""""
" Mappings
"""""""""""""""""

let g:mapleader = "\<Space>"

" Copy to clipboard
vnoremap <Leader>c :%y<cr>

" Return from insert mode to normal mode
inoremap jk <Esc>

" Buffer navigation
set hidden
nnoremap <C-N> :bnext<cr>
nnoremap <C-P> :bprev<cr>
nnoremap <C-K> :tabnew
" Split navigations
nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Up> :resize +2<cr>
nnoremap <Down> :resize -2<cr>
nnoremap <Left> :vertical resize +2<cr>
nnoremap <Right> :vertical resize -2<cr>

" Split existing buffers
nnoremap <Leader>hs :ls<cr>:sb
nnoremap <Leader>vs :ls<cr>:vertical sb

" List and switch buffers
nnoremap <Leader>ls :ls<cr>
" Next mapping is overwriten by the extended config for fzf integration
nnoremap <Leader>b :ls<cr>:b<Space>

" Fast save and exit
nnoremap <Leader>w :w<cr>
nnoremap <Leader>W :wa<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa<cr>
nnoremap <Leader>! :qa!<cr>
nnoremap <Leader>r :e!<cr>
nnoremap <Leader>D :bprev\|bd #<cr>

" Insert new line below, usefull for if, for, etc. statements
inoremap <C-Space> <Esc>o

" Break line
nnoremap <C-J> i<CR><ESC>

" Source vimrc
nnoremap <Leader>sv :source $MYVIMRC<cr>

" Disable old keys to force myself to use mappings
"nnoremap :w <Nop>
"nnoremap :wa <Nop>
"nnoremap :q <Nop>
"nnoremap :qa <Nop>
"nnoremap :bd <Nop>
"inoremap <Esc> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>


""""""""""""""
" Autocommands
""""""""""""""
augroup set_filetypes
    autocmd!
    autocmd BufRead *.wsgi set syntax=python filetype=python
    autocmd BufRead *.twig set syntax=html filetype=html
    autocmd BufRead *.vue set syntax=vue filetype=vue
augroup END

"""""""""""
" Searching
"""""""""""

set incsearch " search as characters are entered.
set hlsearch  " highlight matches
set ignorecase

""""""""
" Styles
""""""""

" Show trailing whitespaces.
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/









"""""""""""""""""""""""""""""""
"""""""" Extended Mode """"""""
"""""""""""""""""""""""""""""""

"""""""""
" Plugins
"""""""""

" Vundle

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""
" Plugin specification
""""""""""""""""""""""

" General

" fzf
set runtimepath+=~/.fzf/bin
set relativenumber
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" File Browsing
Plugin 'scrooloose/nerdtree'
" Git plugin for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Powerline status bar, and fonts
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Buffer navigation
Plugin 'ap/vim-buftabline'
" Color scheme
Plugin 'morhetz/gruvbox'
" Markdown syntax
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
" Rename files
Plugin 'danro/rename.vim'
" Ripgrep
Plugin 'jremmen/vim-ripgrep'
" Git diff in gutter
Plugin 'airblade/vim-gitgutter'
" Update continuously session files
Plugin 'tpope/vim-obsession'

" Language agnostic

" Asynchronous lint
Plugin 'w0rp/ale'
" Surrouning
Plugin 'tpope/vim-surround'
" Jedi Vim
Plugin 'davidhalter/jedi-vim'
" Tab autocompletion
Plugin 'ervandew/supertab'
" Code commenting
Plugin 'scrooloose/nerdcommenter'
" Auto pairs (brackets, quotes, etc.)
Plugin 'jiangmiao/auto-pairs'

" Python

" Doctring generator
Plugin 'heavenshell/vim-pydocstring'
" PEP8 indentation
Plugin 'vim-scripts/indentpython.vim'

" C
"
" Syntax
Plugin 'justinmk/vim-syntax-extra'

" HTML, CSS, JavaScript

" Autoclosing tags
Plugin 'alvan/vim-closetag'
" Highlight enclosing tags
Plugin 'Valloric/MatchTagAlways'
" JavaScript highlight (works for inline js!)
Plugin 'pangloss/vim-javascript'
" Vue highlighting
Plugin 'posva/vim-vue'

" Yaml/Ansible

" Ansible syntax
Plugin 'pearofducks/ansible-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""

" ALE
let g:ale_linters = {
\    'python': ['pylint', 'flake8'],
\    'javascript': ['eslint'],
\    'php': ['phpcs'],
\    'html': ['eslint', 'htmlhint'],
\    'json': ['jsonlint'],
\    'vue': ['eslint'],
\    'css': ['csslint'],
\    'markdown': ['mdl'],
\    'bash': ['shellcheck'],
\    'vim': ['vint']
\}

let g:ale_python_pylint_change_directory = 0

let g:ale_php_phpcs_standard = 'psr2'

let g:ale_fixers = {
\    'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\    'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
\    'html': ['remove_trailing_lines', 'trim_whitespace'],
\    'json': ['fixjson', 'prettier', 'remove_trailing_lines', 'trim_whitespace'],
\    'vue': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\    'vim': ['remove_trailing_lines', 'trim_whitespace'],
\    'css': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\    'markdown': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\    'bash': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

" scrooloose/nerdtree
augroup nerdtree
    autocmd!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd BufEnter * if (winnr("$") == 1 && bufname(0) == 'NERD_tree_1') | q | endif
augroup END

let g:NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Lokaltog/powerline
let g:Powerline_symbols = 'fancy'

" alvan/vim-closetag
let g:closetag_filenames = '*.html, *.twig, *.vue, *.xml'

" morhetz/gruvbox
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" tpope/obsession
" Start recording session on vim start.
augroup session
    autocmd!
    autocmd VimEnter * if (exists('this_obsession') == 0) | :Obsession | endif
augroup END

" pearofducks/ansible-vim
augroup set_ansible_filetypes
    autocmd!
    autocmd BufRead */*ansible*/*.yml set filetype=yaml.ansible
augroup END


"""""""""""""""""
" Mappings
"""""""""""""""""

" fzf
nnoremap <Leader>t :Files<cr>
nnoremap <Leader>b :Buffers<cr>

" ripgrep
nnoremap <Leader>R :Rg<Space>
