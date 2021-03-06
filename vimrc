set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ack.vim'
Bundle 'surround.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'taq/vim-rspec.git'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'skammer/vim-css-color'
Bundle 'altercation/vim-colors-solarized'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/othree/xml.vim.git'
Bundle 'git://github.com/janx/vim-rubytest.git'
Bundle 'git://github.com/mattn/zencoding-vim'
Bundle 'tpope/vim-rails.git'
Bundle 'git://github.com/drmingdrmer/xptemplate'
"Bundle 'tpope/vim-haml'
"Bundle 'tpope/vim-markdown'
"Bundle 'ervandew/supertab'
"Bundle 'gmarik/snipmate.vim'
"Bundle 'honza/snipmate-snippets'
"Bundle 'git://github.com/nono/vim-handlebars.git'
"Bundle 'git://github.com/fholgado/minibufexpl.vim.git'
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
set clipboard=unnamed

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,coverage

" Status bar
set laststatus=2

set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>
"let NERDTreeQuitOnOpen = 1

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" make uses real tabs
au FileType make set noexpandtab

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
"au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au BufRead,BufNewFile *.scss set ft=scss

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
syntax enable
set background=dark
"colorscheme solarized
colorscheme desert

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

let g:cssColorVimDoNotMessMyUpdatetime = 1
let g:SuperTabMappingForward="<tab>" 
set wildignore+=*.o,*.obj,.git,vendor/ruby/**,coverage,.sass-cache,tmp

let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_reversed = 0

map <S-d> :split<CR>
"imap <S-d> <Esc>:split<CR>

map <S-t> <Plug>RubyFileRun
"let g:rubytest_in_quickfix = 1


