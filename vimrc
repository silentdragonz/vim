set nocompatible
set background=dark
set t_Co=256
syntax on
filetype plugin indent on
"colorscheme slate2
"source ~/.vim/plugin/guicolorscheme.vim
"call s:GuiColorScheme("sift")
colo neverland
"colo darkspectrum
set wildmode=longest,list,full
set wildmenu
set number
set smarttab
set laststatus=2
set statusline=%<%02n:\ %f\ %m%r\ %y%=%l,%c%V\ of\ %L\ [%03.3b:0x%02.2B]\ %P
set nowrap
cwindow
"set tags+=.tags;/
"set completeopt=menuone,longest
"set complete+=k
"au FileType * exe('set1 disc+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
"exec "set path+=".substitute(getcwd(), " ", "\\\ ', 'g')."/**"
set cindent
set showmatch
set hidden
set autoindent
set smartindent
set incsearch
set ignorecase
set hlsearch
set encoding=utf8
set tenc=utf8
set fileencoding=utf8
set foldenable
set foldmethod=marker
set sw=4
set sts=4
set et
augroup myfiletypes
	autocmd!
	autocmd FileType php 	set sw=4 sts=4 et 
	autocmd FileType c,cpp,h,hpp 	set sw=4 sts=4 et
	autocmd FileType py 	set sw=4 sts=4 et
augroup END
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File = 1
let Tlist_Compact_Format = 1
let Tlist_Use_RightWindow = 1
let Tlist_Enable_Fold_Column = 0
nmap tp :tabprev<CR>
nmap tn :tabnext<CR>
nmap to :tabnew<CR>
nmap tc :tabclose<CR> 
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/sys
set tags+=~/.vim/tags/net
set tags+=~/.vim/tags/netinet
set tags+=~/.vim/tags/arpa
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let g:SuperTabDefaultCompletionTypeDiscovery = "&omnifunc:<C-X><C-O>,&completefunc:<C-X><C-U>"
set completeopt+=longest,menuone
set cursorline
map <F2> :NERDTreeToggle<CR>
map <A-l> <C-w>l
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-h> <C-w>h
set splitbelow
set mouse=a
if &term=="screen"
	set ttymouse=xterm2
endif
