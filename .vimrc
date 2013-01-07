" Vadim Rachko's .vimrc file
" http://twitter.com/#!/VDMR  http://github.com/vadimr

call pathogen#runtime_append_all_bundles()

set clipboard=unnamed

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

" incomplete commands
set showcmd
" always show cursor position
set ruler
set number

" visualvbell instead of beeping
set vb

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

au BufNewFile,BufRead *.conf set ft=config
au BufRead,BufNewFile *.proto set ft=proto

au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Vagrantfile,Thorfile,Guardfile,config.ru} set ft=ruby
au BufNewFile,BufRead *.html.erb set filetype=eruby

au BufRead,BufNewFile *.json set ft=javascript

" PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79

" http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml#Spaces_vs._Tabs
au FileType cpp set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
au FileType c set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=79

" 78 width for text files
au FileType text setlocal textwidth=78

filetype plugin indent on

" always show last status
set ls=2

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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

  " highlighting of cursor line
  set cursorline

  colorscheme github
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
command! Rc e $MYVIMRC
command! Ctags !ctags --exclude=*.{sql,js,log} --exclude=public -R *
command! RemoveTrailingSpaces %s/\s\+$//e

" CommandT
let g:CommandTAlwaysShowDotFiles=1
let g:CommandTMatchWindowAtTop=1

" minibuf
let g:miniBufExplSplitBelow=0

" NERDTree
map <Leader>n :NERDTreeFind<CR>
let NERDTreeHighlightCursorline=0

" Quick run
map <Leader>r :QuickRun<CR>

" Cab vim
let g:cab_ack_cmd = "ack -Qi"

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
" map ,e to open files in the same directory as current file
map <leader>e :edit %%
