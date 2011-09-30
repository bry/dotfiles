" Vadim Rachko's .vimrc file
" http://twitter.com/#!/VDMR  http://github.com/vadimr

call pathogen#runtime_append_all_bundles()

set nocompatible

" Set encoding
set encoding=utf-8

" Remap leader
if has('eval')
  let mapleader=","
end

set hidden
set history=1000
set scrolloff=3
set backspace=indent,eol,start

" Whitespace stuff
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set autoindent

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" incomplete commands
set showcmd
" always show cursor position
set ruler
set number

syntax on

" Undo
if has("persistent_undo")
  set undodir=~/.vim/tmp/undo
  set undofile
endif

" Backup
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set backup

" Tab completion
set wildmenu
set wildmode=longest,list
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=vendor/**,public/assets/**,public/packages/**,log/*

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
" json is javascript
au BufNewFile,BufRead *.json set ft=javascript
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
" html.erb is eruby
au BufNewFile,BufRead *.html.erb set filetype=html.eruby
" .opener file is Ruby
au BufNewFile,BufRead .opener set filetype=ruby
" 78 width for text files
au FileType text setlocal textwidth=78

filetype plugin indent on

if has("gui_running")
  set guicursor=a:block
  " always show last status
  set ls=2

  " remove menu...
  set guioptions=egmrt
  " remove scrollbars
  set guioptions-=r
  set guifont=Monaco:h12
  " line padding
  set lsp=1
  " visualvbell instead of beeping
  set vb

  " highlighting of cursor line
  set cursorline

  colorscheme molokai
endif

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

" Change buffers
map <C-h> :bp<CR>
map <C-l> :bn<CR>

nnoremap <CR> :noh<cr>

" Match brackets by tab
nnoremap <tab> %
vnoremap <tab> %

" Jumps by 5 lines
map <C-j> 5j
map <C-k> 5k

" Custom commands
command! Rb setf ruby
command! Py setf python
command! Js setf javascript
command! Rc e $MYVIMRC
command! Profile e ~/.profile
command! Ctags !ctags -R *
command! RemoveTrailingSpaces %s/\s\+$//e

" CommandT
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMatchWindowAtTop=1

" minibuf
let g:miniBufExplSplitBelow=0

" NERDTree
map <Leader>n :NERDTreeFind<CR>

" Quick run
map <Leader>r :QuickRun<CR>

" Cab vim
let g:cab_ack_cmd = "ack -Qi"

" Custom functions
fun! s:smallWindow()
  if exists("+lines")
    set lines=22
  endif
  if exists("+columns")
    set columns=80
  endif
endf

command! Small :call s:smallWindow()

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
function! EditLastFileFromDir(dir)
  let last_file_name = system("find " . a:dir . " | tail -1")
  exe 'e ' . last_file_name
endfunction

command! -nargs=1 -complete=dir Elast call EditLastFileFromDir(<f-args>)
