set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp932,euc-jp
autocmd BufReadPost * if search('\e\$B.*\e(B') | edit ++enc=iso-2022-jp | endif
filetype plugin on

set sw=2 sts=2
set hlsearch incsearch ignorecase smartcase autoindent wildmenu showmatch nobackup ruler
set modeline
" set laststatus=2
" set formatoptions=croql
syntax on

runtime macros/matchit.vim

" plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/git-commit'
Plug 'vim-scripts/svn-diff.vim'
Plug 'jamessan/vim-gnupg'
Plug 'uarun/vim-protobuf'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go'
Plug 'pearofducks/ansible-vim'

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'

if filereadable($HOME . '/.vimrc.local.plugins')
  source ~/.vimrc.local.plugins
endif
call plug#end()

" git-commit
let g:git_diff_spawn_mode = 1

" key mapping
noremap g} gt
noremap g{ gT
noremap <Space>t :NERDTree<CR>

if v:version >= 602
  set ambiwidth=double
endif

if v:version >= 700
  " Popup menu
  hi Pmenu ctermfg=black ctermbg=white
  hi PmenuSel ctermfg=black ctermbg=cyan
  hi PmenuSbar ctermbg=black

  " Omni Completion
  set completeopt=menu
endif

if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

if has('gui_running')
  set guioptions-=T
  set guifont=Monospace\ 12
  set columns=80 lines=35
endif

" file types
au BufRead,BufNewFile *.rb,*.erb set et
au BufRead,BufNewFile *.py set et sw=4 sts=4
au BufRead,BufNewFile *.haml,*.sass,*.scss set et
au BufRead,BufNewFile *.go set noet sw=8 sts=8 ts=8

" read local vimrc
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
