" Vadim Rachko's .vimrc file.

set nocompatible " forget about vi

if has('eval')
  let mapleader="," " Remap leader
endif

set hidden
set history=1000
set scrolloff=3

set list listchars=tab:\ \ ,trail:·

" Default whitespace stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set autoindent

set textwidth=79

set nowrap

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

set showcmd " incomplete commands
set ruler " always show cursor position
set number

set vb " visualvbell instead of beeping

syntax on

" Undo
if has("persistent_undo")
  silent !mkdir ~/.vim/tmp/undo > /dev/null 2>&1
  set undodir=~/.vim/tmp/undo
  set undofile
endif

" No Backup, No Swap
set nobackup
set noswapfile
set nowb

" Tab completion
set wildmenu
set wildmode=longest,list

set wildignore+=*.o,*.so,.git,bin,coverage,log,tmp,vendor/gems,vendor/bundle,public/assets/,public/uploads/

au BufNewFile,BufRead *.conf set ft=config

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.html.erb set filetype=eruby
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.less set ft=css

au FileType ruby,haml,eruby,yaml,html,javascript,coffee,sass set shiftwidth=2 softtabstop=2 tabstop=2 expandtab

filetype plugin indent on

set ls=2 " always show last status

if exists('+colorcolumn')
  set colorcolumn=80
  " with grey color
  highlight ColorColumn ctermbg=7
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

if has("gui_running")
  set guicursor=a:block
  set guioptions=egmt " no menu, no scrollbars
  set lsp=1 " line padding
  set guifont=Monaco:h12
endif

" Clear 'search' on enter.
nnoremap <silent> <CR> :noh<cr>

" Change buffers
map <C-h> :bp<CR>
map <C-l> :bn<CR>

" Custom commands
command! Rc e $MYVIMRC
command! Ctags !ctags --exclude=*.{sql,js,log} --exclude=public --exclude=vendor/bundle -R *
command! RemoveTrailingSpaces %s/\s\+$//e

" Enable :Man plugin.
runtime ftplugin/man.vim

" Custom status line with list of buffers.
" Highlights current buffer with brackets.
"
set statusline=%f%=\ %<%{SLineWithBuffers()}\ %l,%c\ %P

function! SLineWithBuffers()
  let cur = bufname("%")
  let res = []
  for b in range(1, bufnr('$'))
    if buflisted(b)
      let bn = bufname(b)
      let tail = fnamemodify(bn, ":t")
      if tail == ""
        let tail = "x"
      endif
      let wrapped = bn == cur ? "[" . tail . "]" : " " . tail . " "
      call add(res, wrapped)
    endif
  endfor

  let l = len(res)
  if l < 2
    return ""
  else
    return "B(". l . ")" . join(res, "")
  endif
endfunction

" Vundle stuff {

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'mru.vim'
Bundle 'tomtom/tcomment_vim'

Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-quickrun'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jnwhiteh/vim-golang'

Bundle 'vadimr/bclose.vim'

filetype plugin indent on

" } Vundle stuff.

" ctrlp
let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v(\.git|vendor/bundle|public/uploads)'

" Quick run
map <Leader>r :QuickRun<CR>
