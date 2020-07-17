set nocompatible              " required
filetype off                  " required
syntax on
set tabstop=4
set shiftwidth=4
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set linebreak "softwrap after words
set incsearch "live search highlight"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' "bundle manager
Plugin 'Valloric/YouCompleteMe' "auto completion
Plugin 'vim-syntastic/syntastic' "syntax highlighting
Plugin '907th/vim-auto-save' "auto save
Plugin 'scrooloose/nerdtree' "file browser
Plugin 'tpope/vim-fugitive' "basic git commands
Plugin 'vim-airline/vim-airline' "improved status bar
Plugin 'TaDaa/vimade' "only highlight active window
Plugin 'morhetz/gruvbox' "gruvbox theme
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/csv.vim' "csv support
Plugin 'lervag/vimtex' "latex support
Plugin 'jiangmiao/auto-pairs' "auto close brackets, quotes ...
Plugin 'airblade/vim-gitgutter' "git info next to number line
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc' "required for color scheme switcher
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"spellcheck
nnoremap <F6> :setlocal spell! spelllang=en_us,de_de<CR>

"space as mapleader
let mapleader=" "
nnoremap <SPACE> <Nop>

"automaticlly set dir of current file as wirking dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"set autochdir

"fzf files mapping
nnoremap <silent> <Leader><Space> :Files<CR>

"color scheme
colorscheme dracula
nnoremap <F9> :RandomColorScheme<cr>

"quickly open ~/.vimrc
nnoremap <leader>r :tabedit $MYVIMRC<cr>

"auto reload .vimrc
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"remove gui functionality
set mouse=
set guioptions=

"vimtex configuration
let g:vimtex_latexmk_continuous=0 "no auto compilation
let g:vimtex_view_method='skim' "skim pdf viewer
let g:vimtex_quickfix_open_on_warning=0 "ignore warnings in quickfix window
let g:tex_flavor = "latex"
"let g:vimtex_quickfix_autoclose_after_keystrokes=1 "close quickfix window when moving cursor
"let g:vimtex_quickfix_mode=0 "disable quickfix window completely
nnoremap <leader>m :VimtexCompileSS<cr>
nnoremap <leader>l :VimtexView<cr>
nnoremap <leader>b :VimtexTocToggle<cr>

"windows/tab navigation
"nnoremap <Tab> <c-W>w
nnoremap <leader><Tab> gt
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"resize windows using arrow keys
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Down> :resize -5<CR>

"you complete me settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"auto save configuration
let g:auto_save=1 "auto enable on startup
let g:auto_save_silent=1  "do not display the auto-save notification

"enable line numbering
set nu

"NERDTree configuration
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1

"status bar configuration
set laststatus=2 "always show
let g:airline#extensions#tabline#enabled=1

"split configuration
nnoremap <leader>v :vnew<cr>
nnoremap <leader>h :new<cr>
nnoremap <leader>t :tabnew<cr>
set splitbelow
set splitright

"whitespaces
set list          " Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

"ignore syntactic errors
let g:tex_no_error=1 "ignores errors like highlighting underscores"
let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ 'SOME OTHER SYNTASTIC MESSAGE',
        \ 'SOME OTHER SYNTASTIC MESSAGE',
        \ ] }
