" Vadim Rachko's .vimrc file
" http://twitter.com/VDMR  http://github.com/vadimr

set nocompatible " forget about vi

set encoding=utf-8

if has('eval')
  let mapleader="," " Remap leader
end

set hidden
set history=1000
set scrolloff=3
set backspace=indent,eol,start

" Default whitespace stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent

set wrap

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
au BufRead,BufNewFile *.proto set ft=proto

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru} set ft=ruby
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
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

if has("gui_running")
  set guicursor=a:block
  set guioptions=egmrt " remove menu...
  set guioptions-=r " remove scrollbars
  set lsp=1 " line padding
  set cursorline " highlighting of cursor line

  set guifont=Monaco:h12
endif

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

" Clear 'search' on enter.
nnoremap <silent> <CR> :noh<cr>

" Match brackets by tab
nnoremap <tab> %
vnoremap <tab> %

" Change buffers
map <C-h> :bp<CR>
map <C-l> :bn<CR>

" Jumps by 5 lines
map <C-j> 5j
map <C-k> 5k

" Custom commands
command! Rc e $MYVIMRC
command! Ctags !ctags --exclude=*.{sql,js,log} --exclude=public --exclude=vendor/bundle -R *
command! RemoveTrailingSpaces %s/\s\+$//e

" Enable :Man plugin.
runtime ftplugin/man.vim

" Custom functions

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Command for opening last file from indicated directory
" example: :Elast db/migrate
function! EditLastFileFromDir(dir, ...)
  let all_files = glob(a:dir . "/*")
  let str_index = get(a:000, 0)
  let index = -1 - str2nr(str_index)

  if len(all_files) > 0
    let last_file_name = split(all_files)[index]
    exe 'e ' . last_file_name
  endif
endfunction

command! -nargs=+ -complete=dir Elast call EditLastFileFromDir(<f-args>)

" Next mapping is adopted from destroyallsoftware.com screencasts
" expand path of directory of current file typing %% in command mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Vundle stuff {

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mru.vim'
Bundle 'minibufexpl.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'kchmck/vim-coffee-script'

Bundle 'vadimr/bclose.vim'

filetype plugin indent on

" } Vundle stuff.

" ctrlp
let g:ctrlp_custom_ignore = 'vendor/bundle'
let g:ctrlp_map = ''
map <leader>t :CtrlP<CR>

" minibuf
let g:miniBufExplSplitBelow=0

" NERDTree
map <Leader>n :NERDTreeFind<CR>
let NERDTreeHighlightCursorline=0

" Quick run
map <Leader>r :QuickRun<CR>
