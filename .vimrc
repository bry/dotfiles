" Vadim Rachko's .vimrc file.

set nocompatible " forget about vi

if has('eval')
  let mapleader="," " Remap leader
endif

set hidden
set history=1000
set scrolloff=3
set backspace=indent,eol,start

" Default whitespace stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set nowrap

" Search
set hlsearch
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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems,vendor/bundle
set wildignore+=public/assets,public/packages,log/*,tmp,bin,script,coverage

au BufNewFile,BufRead *.conf set ft=config

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.html.erb set filetype=eruby
au BufRead,BufNewFile *.json set ft=javascript
au BufRead,BufNewFile *.less set ft=css

" PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79

au FileType c set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
au FileType cpp set tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79

" 78 width for text files
au FileType text setlocal textwidth=78

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

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'thinca/vim-quickrun'
Bundle 'kchmck/vim-coffee-script'

Bundle 'vadimr/bclose.vim'

filetype plugin indent on

" } Vundle stuff.

" ctrlp
let g:ctrlp_custom_ignore = 'vendor/bundle'
let g:ctrlp_map = ''
map <leader>t :CtrlP<CR>

" Quick run
map <Leader>r :QuickRun<CR>
