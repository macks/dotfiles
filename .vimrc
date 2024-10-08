set enc=utf-8
set fenc=utf-8
set fencs=utf-8,cp932,euc-jp
au BufReadPost * if search('\e\$B.*\e(B') | edit ++enc=iso-2022-jp | endif
filetype plugin on

set sw=2 sts=2
set hlsearch incsearch ignorecase smartcase autoindent wildmenu showmatch nobackup ruler
set modeline
set laststatus=2
" set formatoptions=croql
syntax on

runtime macros/matchit.vim

" plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/git-commit'
Plug 'vim-scripts/svn-diff.vim'
Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'

if has('lua') && (v:version > 703 || v:version == 703 && has('patch885'))
  Plug 'Shougo/neocomplete'
endif

if v:version >= 800
  Plug 'w0rp/ale'
endif

if filereadable($HOME . '/.vimrc.local.plugins')
  source ~/.vimrc.local.plugins
endif
call plug#end()

" git-commit
let g:git_diff_spawn_mode = 1

" vim-go
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
au FileType go nmap <C-g> :GoDecls<cr>
au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>

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

" neocomplete
let g:neocomplete#enable_at_startup = 1

" file types
au FileType ruby,eruby set et
au FileType haml,sass,scss set et
au FileType python set et sw=4 sts=4
au FileType go set noet sw=8 sts=8 ts=8 autowrite

" read local vimrc
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
