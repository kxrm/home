" Jay's totally awesome VIM config

" EDITOR CONFIG ---------------------------------------------------------- {{{

set encoding=utf-8
set number relativenumber
set nocompatible
" set mouse=n
set backspace=2
set tabstop=4
set shiftwidth=4
set cursorline
set nowrap
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe
syntax on

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

let g:netrw_liststyle = 3
let g:netrw_banner = 0

" }}}

" File specific configs -------------------------------------------------- {{{

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.php
	\ set tabstop=4
	\ softtabstop=4
	\ shiftwidth=4
	\ autoindent
	\ fileformat=unix

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

" Plugins will be downloaded under the specified directory

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'sirver/ultisnips'

" Plugins that help us interpret code
Plug 'davidhalter/jedi-vim'
Plug 'shawncplus/phpcomplete.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" }}}

" PLUG-IN CONFIG --------------------------------------------------------- {{{

set t_Co=256
set t_ut=
colorscheme codedark

" air-line config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

let g:codi#interpreters = {
    \ 'python': {
        \ 'bin': 'python3',
        \ 'prompt': '^\(>>>\|\.\.\.\) ',
    \ },
\ }

let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips"]
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

 " }}}

" MAPPINGS --------------------------------------------------------------- {{{

let $ZFZ_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>t :VimuxRunCommand("python3 " . bufname("%"))<CR>
 " Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
"
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
"
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
"
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
"
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
"
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>
"
" Clear the terminal screen of the runner pane.
map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>

" }}}

