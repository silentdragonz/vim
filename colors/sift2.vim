" Vim color file
" sift v1.0
" http://www.vim.org/scripts/script.php?script_id=1454
" 
" Maintainer:	Shawn Axsom <axs221@gmail.com>
"
"   * Place :colo sift in your VimRC/GVimRC file
"     * GvimRC if using GUI any
"
"   - Thanks to Desert and OceanDeep for their color scheme 
"     file layouts
"   - Thanks to Raimon Grau for his feedback

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
		syntax reset
    endif
endif

let g:colors_name="sift2"

hi Normal       ctermfg=189	 ctermbg=233	   "1a1823
hi NonText      ctermfg=235	 ctermbg=234	

hi Folded       ctermbg=235	 ctermfg=152	
hi FoldColumn	ctermbg=235	 ctermfg=187	
hi LineNr       ctermbg=235	 ctermfg=104	 
hi StatusLine	ctermbg=236	 ctermfg=63	 cterm=none
hi StatusLineNC	ctermbg=235	 ctermfg=233	 cterm=none
hi VertSplit	ctermbg=235	 ctermfg=8	 cterm=none

" syntax highlighting """"""""""""""""""""""""""""""""""""""""

hi Comment		ctermfg=238	 ctermbg=233	
"hi Comment 	ctermbg=0	 ctermfg=15	
hi Title		ctermfg=202	  cterm=none
hi Underlined   ctermfg=203	 cterm=none

hi Statement    ctermfg=204	  cterm=none
hi Type			ctermfg=175	  cterm=none
hi Constant		ctermfg=181	
hi Number		ctermfg=182	
hi PreProc      ctermfg=169	
hi Identifier   ctermfg=139	
hi Special		ctermfg=139	
hi Operator		ctermfg=239	
hi Keyword		ctermfg=10	
hi Error        ctermbg=65	
hi Function     ctermfg=131	 ctermbg=bg "or green 50b3b0 
hi Conditional	ctermfg=215	 ctermbg=bg
hi Repeat		ctermfg=203	 ctermbg=bg
hi Exception	ctermfg=227	
"hi Ignore       ctermfg=241	
"hi Todo			ctermfg=202	 ctermbg=11	
"""""this section borrowed from OceanDeep/Midnight"""""
"hi Label cterm=None ctermfg=120	 ctermbg=bg
"highlight Operator cterm=None ctermfg=185	 ctermbg=bg
"highlight Keyword cterm=bold ctermfg=250	 ctermbg=bg
"highlight Exception cterm=none ctermfg=167	 ctermbg=bg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"end syntax highlighting """""""""""""""""""""""""""""""""""""

" highlight groups
"hi CursorIM
hi Directory	ctermfg=152	
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
hi ErrorMsg     ctermbg=203	

hi Cursor       ctermbg=251	 ctermfg=235	


hi Search       ctermbg=246	 ctermfg=236	
hi IncSearch	ctermfg=251	 ctermbg=236	 

hi ModeMsg    	ctermfg=38	
hi MoreMsg      ctermfg=29	
hi Question    	ctermfg=146	
hi SpecialKey	ctermfg=115	
hi Visual       ctermfg=237	 ctermbg=98	
"hi VisualNOS
hi WarningMsg	ctermfg=209	
"hi WildMenu
"hi Menu
"hi Scrollbar  ctermbg=239	 ctermfg=180	
"hi Tooltip


" new Vim 7.0 items
hi Pmenu        ctermbg=60	 ctermfg=110	
hi PmenuSel     ctermbg=67	 ctermfg=153	                    





"vim: sw=4


