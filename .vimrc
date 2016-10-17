set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

  "let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  
  Plugin 'marcopaganini/termschool-vim-theme' " Tema 
  Plugin 'airblade/vim-gitgutter' " Plugin para utilizar o GIT 
  Plugin 'vim-airline/vim-airline' " Barra de status
  Plugin 'vim-airline/vim-airline-themes' "Tema pra barra de status
  Plugin 'scrooloose/nerdTree' "Gerenciador de arquivos
  Plugin 'skammer/vim-css-color' "Cor css
  
 colorscheme termschool
  

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype plugin indent on
syntax on




set laststatus=2
set showcmd
set ignorecase
set autoindent
set smartcase
set hlsearch
set cursorline
set softtabstop=4
set scrolloff=8
set sidescrolloff=10
set background=dark


" show existing tab with 4 spaces width
 set tabstop=4
" " when indenting with '>', use 4 spaces width
 set shiftwidth=4
" " On pressing tab, insert 4 spaces
 set expandtab
 set nu "insere numeração
 "identação
 set smartindent
 " abre os splits em posicoes corretas
 set splitbelow
 set splitright

 syntax on
 
"comandos para rodar NERDTree automaticamente
 autocmd vimenter * NERDTree

 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

 set laststatus=2 " deixa a barra do airline visivel o tempo todo
 
 "comandos para controlar janelas do split 
 nnoremap <C-J>  <C-W><C-J>
 nnoremap <C-K>  <C-W><C-K>
 nnoremap <C-L>  <C-W><C-L>
 nnoremap <C-H>  <C-W><C-H>

 noremap <Up> :Dont use me
 noremap <Down> :Dont use me
 noremap <Left> :Dont use me
 noremap <Right> :Dont use me

