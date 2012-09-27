" {{{ Pathogen
"filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
" }}}
" {{{ Vundle
set nocompatible
filetype off
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'ap/vim-css-color'
Bundle 'Lokaltog/vim-powerline'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'MasterKey/OmniCppComplete'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'acustodioo/vim-enter-indent'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kien/ctrlp.vim'

Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'Syntastic'
Bundle 'current-func-info.vim'
Bundle 'phpfolding.vim'

filetype plugin indent on
" }}}

" {{{ Basic
syntax on
filetype plugin indent on

"set guifont=Consolas:h12
set guifont=Envy\ Code\ R\ for\ Powerline:h12
set autochdir
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set title
set clipboard=unnamed,unnamedplus,autoselect
set matchpairs+=<:>
let delimitMate_matchpairs="(:),[:],{:},<:>"
set shortmess=atToOI
set iskeyword+=_,$,@,%,#
"let Powerline_symbols="unicode"
let Powerline_symbols="fancy"
let delimitMate_expand_cr = 1

" {{{ Color Scheme
set background=dark
set t_Co=256
colo molokai
" }}}
" {{{ Wild Menu
set wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set wildmode=full
" }}}
set number
set smarttab
set laststatus=2
"set statusline=%<%02n:\ %f\ %m%r\ %{fugitive#statusline()}\ %y%=%l,%c%V\ of\ %L\ [%03.3b:0x%02.2B]\ %P
set nowrap
cwindow
"set tags+=.tags;/
"set completeopt=menuone,longest
"set complete+=k
"au FileType * exe('set1 disc+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
"exec "set path+=".substitute(getcwd(), " ", "\\\ ', 'g')."/**"
set hidden
set formatoptions=croqwanl1
set completeopt=menu,menuone,longest
set smartcase
" {{{ Search options
set showmatch
set incsearch
set ignorecase
set hlsearch
" }}}
" {{{ Indent options
set cindent
set autoindent
set smartindent
set sw=4
set sts=4
set et
" }}}
augroup myfiletypes
	autocmd!
	autocmd FileType php 	set sw=4 sts=4 et
	autocmd FileType c,cpp,h,hpp 	set sw=4 sts=4 et
	autocmd FileType py 	set sw=4 sts=4 et
augroup END
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File = 1
let Tlist_Compact_Format = 1
let Tlist_Use_RightWindow = 1
let Tlist_Enable_Fold_Column = 0
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/sys
set tags+=~/.vim/tags/net
set tags+=~/.vim/tags/netinet
set tags+=~/.vim/tags/arpa
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:SuperTabDefaultCompletionTypeDiscovery = "&omnifunc:<C-X><C-O>,&completefunc:<C-X><C-U>"
"set completeopt+=longest,menuone
set cursorline
set splitbelow
set mouse=a
if &term=="screen"
	set ttymouse=xterm2
endif
set relativenumber
set undodir=~/vimundo
set undofile
set backupdir=~/vimbak
set directory=~/vimbak
set ruler
set backspace=2
let mapleader=" "
" }}}

" Folding {{{
	set foldenable
	set foldmethod=marker
	set foldlevel=0
	set foldcolumn=0
	set foldtext=FoldText()
	" Universal FoldText function {{{
		function! FoldText(...)
			" This function uses code from doy's vim-foldtext: https://github.com/doy/vim-foldtext
			" Prepare fold variables {{{
				" Use function argument as line text if provided
				let l:line = a:0 > 0 ? a:1 : getline(v:foldstart)

				let l:line_count = v:foldend - v:foldstart + 1
				let l:indent = repeat(' ', indent(v:foldstart))

				let l:w_win = winwidth(0)
				let l:w_num = getwinvar(0, '&number') * getwinvar(0, '&numberwidth')
				let l:w_fold = getwinvar(0, '&foldcolumn')
			" }}}
			" Handle diff foldmethod {{{
				if &fdm == 'diff'
					let l:text = printf('ǒ %s matching lines Ǔ', l:line_count)

					" Center-align the foldtext
					return repeat('Ć', (l:w_win - strchars(l:text) - l:w_num - l:w_fold) / 2) . l:text
				endif
			" }}}
			" Handle other foldmethods {{{
				let l:text = l:line
				" Remove foldmarkers {{{
					let l:foldmarkers = split(&foldmarker, ',')
					let l:text = substitute(l:text, '\V' . l:foldmarkers[0] . '\%(\d\+\)\?\s\*', '', '')
				" }}}
				" Remove comments {{{
					let l:comment = split(&commentstring, '%s')

					if l:comment[0] != ''
						let l:comment_begin = l:comment[0]
						let l:comment_end = ''

						if len(l:comment) > 1
							let l:comment_end = l:comment[1]
						endif

						let l:pattern = '\V' . l:comment_begin . '\s\*' . l:comment_end . '\s\*\$'

						if l:text =~ l:pattern
							let l:text = substitute(l:text, l:pattern, ' ', '')
						else
							let l:text = substitute(l:text, '.*\V' . l:comment_begin, ' ', '')

							if l:comment_end != ''
								let l:text = substitute(l:text, '\V' . l:comment_end, ' ', '')
							endif
						endif
					endif
				" }}}
				" Remove preceding non-word characters {{{
					let l:text = substitute(l:text, '^\W*', '', '')
				" }}}
				" Remove surrounding whitespace {{{
					let l:text = substitute(l:text, '^\s*\(.\{-}\)\s*$', '\1', '')
				" }}}
				" Make unmatched block delimiters prettier {{{
					let l:text = substitute(l:text, '([^)]*$',   'ǒ ĵ Ǔ', '')
					let l:text = substitute(l:text, '{[^}]*$',   'ǒ ĵ Ǔ', '')
					let l:text = substitute(l:text, '\[[^\]]*$', 'ǒ ĵ Ǔ', '')
				" }}}
				" Add arrows when indent level > 2 spaces {{{
					if indent(v:foldstart) > 2
						let l:cline = substitute(l:line, '^\s*\(.\{-}\)\s*$', '\1', '')
						let l:clen = strlen(matchstr(l:cline, '^\W*'))

						let l:indent = repeat(' ', indent(v:foldstart) - 2)
						let l:text = '▸ ' . l:text
					endif
				" }}}
				" Prepare fold text {{{
					let l:fnum = printf(' %s ʭ ', l:line_count)
					let l:ftext = printf('%s%s ', l:indent, l:text)
				" }}}
				return l:ftext . repeat('―', l:w_win - strchars(l:fnum) - strchars(l:ftext) - l:w_num - l:w_fold) . l:fnum
			" }}}
		endfunction
	" }}}
	" PHP FoldText function {{{
		function! FoldText_PHP()
			" This function uses code from phpfolding.vim
			let l:curline = v:foldstart
			let l:line = getline(l:curline)
			" Did we fold a DocBlock? {{{
				if strridx(l:line, '#@+') != -1
					if (matchstr(l:line, '^.*#@+..*$') == l:line)
						let l:line = substitute(l:line, '^.*#@+', '', 'g') . ' ' . g:phpDocBlockIncludedPostfix
					else
						let l:line = getline(l:curline + 1) . ' ' . g:phpDocBlockIncludedPostfix
					endif
			" }}}
			" Did we fold an API comment block? {{{
				elseif strridx(l:line, "\/\*\*") != -1
					let s:state = 0

					while l:curline < v:foldend
						let l:loopline = getline(l:curline)

						if s:state == 0 && strridx(l:loopline, "\*\/") != -1
							let s:state = 1
						elseif s:state == 1 && (matchstr(l:loopline, '^\s*$') != l:loopline)
							break
						endif

						let l:curline = l:curline + 1
					endwhile

					let l:line = getline(l:curline)
				endif
			" }}}
			" Cleanup {{{
				let l:line = substitute(l:line, '/\*\|\*/\d\=', '', 'g')
				let l:line = substitute(l:line, '^\s*\*\?\s*', '', 'g')
				let l:line = substitute(l:line, '{$', '', 'g')
				let l:line = substitute(l:line, '($', '(...)', 'g')
			" }}}
			" Append postfix if there is PhpDoc in the fold {{{
				if l:curline != v:foldstart
					let l:line = l:line . " " . g:phpDocIncludedPostfix . " "
				endif
			" }}}
			return FoldText(l:line)
		endfunction
	" }}}
	" Enable PHP FoldText function {{{
		let g:DisableAutoPHPFolding = 1

		au FileType php EnableFastPHPFolds
		au FileType php set foldtext=FoldText() | setl foldtext=FoldText_PHP()
	" }}}
" }}}

" {{{ Mappings
" {{{ Tabs
nmap tp :tabprev<CR>
nmap tn :tabnext<CR>
nmap to :tabnew<CR>
nmap tc :tabclose<CR>
" }}}
"nnoremap y y+
"nnoremap p +gP
nnoremap <silent> <F8> :TlistToggle<CR>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F2> :NERDTreeToggle<CR>
map <A-l> <C-w>l
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-h> <C-w>h
inoremap jj <ESC>
nnoremap <Tab> %
" {{{ Buffer
map <leader>bd :bdelete<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>
"map <leader>fo :FufFileWithCurrentBufferDir<CR>
"map <leader>o :FufFileWithCurrentBufferDir<CR>
"map <leader>bo :FufBuffer<CR>
map <leader>fo :CtrlP<CR>
map <leader>o :CtrlP<CR>
map <leader>bo :CtrlPBuffer<CR>
" }}}
map <leader><leader> :noh<CR>
map <leader>z ZZ
map <leader>u :GundoToggle<CR>
	" Repurpose arrow keys to move lines {{{
		" Inspired by http://jeetworks.com/node/89
		function! s:MoveLineUp()
			call <SID>MoveLineOrVisualUp(".", "")
		endfunction

		function! s:MoveLineDown()
			call <SID>MoveLineOrVisualDown(".", "")
		endfunction

		function! s:MoveVisualUp()
			call <SID>MoveLineOrVisualUp("'<", "'<,'>")
			normal gv
		endfunction

		function! s:MoveVisualDown()
			call <SID>MoveLineOrVisualDown("'>", "'<,'>")
			normal gv
		endfunction

		function! s:MoveLineOrVisualUp(line_getter, range)
			let l_num = line(a:line_getter)
			if l_num - v:count1 - 1 < 0
				let move_arg = "0"
			else
				let move_arg = a:line_getter." -".(v:count1 + 1)
			endif
			call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
		endfunction

		function! s:MoveLineOrVisualDown(line_getter, range)
			let l_num = line(a:line_getter)
			if l_num + v:count1 > line("$")
				let move_arg = "$"
			else
				let move_arg = a:line_getter." +".v:count1
			endif
			call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
		endfunction

		function! s:MoveLineOrVisualUpOrDown(move_arg)
			let col_num = virtcol(".")
			execute "silent! ".a:move_arg
			execute "normal! ".col_num."|"
		endfunction

		" Arrow key remapping:
		" Up/Dn = move line up/dn
		" Left/Right = indent/unindent
		function! SetArrowKeysAsTextShifters()
			" Normal mode
			nnoremap <silent> <Left>   <<
			nnoremap <silent> <Right>  >>
			nnoremap <silent> <Up>     <Esc>:call <SID>MoveLineUp()<CR>
			nnoremap <silent> <Down>   <Esc>:call <SID>MoveLineDown()<CR>

			" Visual mode
			vnoremap <silent> <Left>   <gv
			vnoremap <silent> <Right>  >gv
			vnoremap <silent> <Up>     <Esc>:call <SID>MoveVisualUp()<CR>
			vnoremap <silent> <Down>   <Esc>:call <SID>MoveVisualDown()<CR>

			" Insert mode
			inoremap <silent> <Left>   <C-D>
			inoremap <silent> <Right>  <C-T>
			inoremap <silent> <Up>     <C-O>:call <SID>MoveLineUp()<CR>
			inoremap <silent> <Down>   <C-O>:call <SID>MoveLineDown()<CR>
		endfunction

		call SetArrowKeysAsTextShifters()
	" }}}
" }}}
	augroup Whitespace " {{{
		autocmd!
		" Remove trailing whitespace from selected filetypes {{{
			function! s:StripTrailingWhitespace()
				normal mZ

				%s/\s\+$//e

				normal `Z
			endfunction

			au FileType html,css,sass,javascript,php,python,ruby,psql,vim au BufWritePre <buffer> :silent! call <SID>StripTrailingWhitespace()
		" }}}
	augroup END " }}}

	" PHP highlighting settings {{{
		let g:php_folding = 0
		let g:php_html_in_strings = 1
		let g:php_parent_error_close = 1
		let g:php_parent_error_open = 1
		let g:php_no_shorttags = 1
	" }}}
	" Python highlighting settings {{{
		let g:python_highlight_all = 1
		let g:python_show_sync = 1
		let g:python_print_as_function = 1
	" }}}
	" Syntastic settings {{{
		let g:syntastic_enable_signs = 1
		let g:syntastic_auto_loc_list = 0
	" }}}
	" Gundo settings {{{
		let g:gundo_right = 1
		let g:gundo_width = 50
	" }}}
	" SuperTab settings {{{
		let g:SuperTabDefaultCompletionType = 'context'
		let g:SuperTabContextDefaultCompletionType = '<c-n>'
		let g:SuperTabLongestEnhanced = 1
	" }}}

