" ----------------------------------------------------- "
"                                                       "
"                   NEOVIM CONFIG                       "
"                                                       "
" ----------------------------------------------------- "
" ----- Plugs ----- " {{{
call plug#begin('~/.local/share/nvim/plugged')
	
    "<--General
	Plug 'terryma/vim-multiple-cursors'
    Plug 'junegunn/goyo.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'https://github.com/chrisbra/Colorizer.git'
    Plug 'itchyny/lightline.vim'
    Plug 'godlygeek/tabular'
    Plug 'mattn/calendar-vim'
    Plug 'vifm/vifm.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'metakirby5/codi.vim'
    Plug 'ap/vim-css-color'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
    Plug 'unblevable/quick-scope'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tpope/vim-surround'
    Plug 'sainnhe/lightline_foobar.vim'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'justinmk/vim-sneak'
    Plug 'mhinz/vim-startify'
    "<--Git Integration
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    "<--Nerd tree
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdcommenter'
    "<--Syntax
    "Plug 'davidhalter/jedi-vim'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'justinmk/vim-syntax-extra'    
    "<--Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

call plug#end()

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}
" ----- General ----- " {{{
syntax enable
set termguicolors
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number                     " Show current line number
set relativenumber             " Show relative line numbers
filetype plugin on
"let g:mapleader = " "
"let mapleader = " "
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<C-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<C-u>WhichKey  ','<CR>
"let mapleader = "'"
set t_Co=256
set t_ut=
set nocompatible
au ColorScheme * hi Normal ctermbg=none guibg=none
colorscheme shadopurplesecond
highlight SignColumn guibg=none
"set clipboard+=unnamedplus
" Toggle side numbers
set foldmethod=marker
"au BufRead,BufNewFile *.md		setfiletype md
" TEST CRAP
"set viminfo='100,n$HOME/.config/nvim/autoload/plugged/vim-startify/test/viminfo'

" --- Custom Key Commands! --- {{{
" Copies selected text from split window and paste in other 
vnoremap <F3> y<c-w>wp<c-w>gv
" Turns off all line numbers
noremap <F3> :set invnumber invrelativenumber<CR>

" }}}
"}}}
" ----- Plug Config ----- " {{{
" Plug >-- Snippets " {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom_snips"]
" }}}
" Plug >-- CoC " {{{
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"}}}
" Plug >-- Sneak " {{{
let g:sneak#prompt = '❱'
"}}}
" Plug >-- Startify " {{{
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_enable_special = 0
" let g:startify_session_autoload = 1
" Lists
let g:startify_lists = [
    \ { 'type': 'sessions',    'header': ['    Sessions']                    },
    \ { 'type': 'bookmarks',   'header': ['    Bookmarks']                   },
    \ { 'type': 'files',       'header': ['    Files']                       },
    \ { 'type': 'dir',         'header': ['    Current Directory '.getcwd()] },
    \ ]

" Bookmarks
let g:startify_bookmarks = [
    \ { 'n':  '~/.config/nvim/init.vim'                        },
    \ { 's':  '~/.config/sxhkd/sxhkdrc'                        },
    \ { 'b':  '~/.config/bspwm/bspwmrc'                        },
    \ { 'k':  '~/.config/kitty/kitty.conf'                     },
    \ { 'p':  '~/.config/polybar/config'                       },
    \ { 'c':  '~/.config/picom.conf'                           },
    \ { 'S':  '~/Documents/PY-Projects/Shadochan/shadochan.py' },
    \ { 'w':  '~/vimwiki/index.md'                             },
    \ { 'm':  '~/.config/miscellaneous'                        },
    \ { 'r':  '~/.config/rofi/themes/onedark.rasi'             },
    \ { 'Z':  '~/.config/zsh/.zshrc'                           },
    \ { 'z':  '~/.zshenv'                                      },
    \ { 'd':  '~/Documents/'                                   },
    \ { 'ds': '~/Documents/SchoolWork/'                        },
    \ { 'dh': '~/Documents/HTB/'                               },
    \ { 'dc': '~/Documents/CTF/'                               },
    \ { 'D':  '~/Downloads/'                                   },
    \ { 'ps':  '~/Pictures/Screenshots/'                       },
    \ { 'P':  '~/Pictures/'                                    },
    \ { 'M':  '~/Music/'                                       },
    \ { 'sc': '~/Documents/Shadochan/'                         },
    \ ]
" Ascii Art
let g:startify_custom_header = [
    \ '    _________  __                  ___                        __            ',       
    \ '   /   _____/ |  |__  _____     __| _/ _____ _______ _____   |__|  ____     ',
    \ '   \_____  \  |  |  \ \__  \   / __ | /  _  \\_  __ \\__  \  |  | /    \    ',
    \ '   /        \ |   Y  \ / __ \_/ /_/ |(  <_>  )|  | \/ / __ \_|  ||   |  \   ',
    \ '  /_______  / |___|  /(____  /\____ | \_____/ |__|   (____  /|__||___|  /   ',
    \ '          \/       \/      \/      \/                    \/          \/     ',
    \ ]
" Autostart nerdtree with Startify
"autocmd VimEnter *                                                                 
"    \   if !argc()                                                         
"    \ |   Startify                                                         
"    \ |   NERDTree                                                         
"    \ |   wincmd w                                                         
"    \ | endif
" }}}
" Plug >-- Signify " {{{
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0 "-\
let g:signify_sign_show_text = 1  "-+--- Gets rid of extra numbers
" Jump through Hunks
"nmap <leader>gj <plug>(signify-next-hunk)
"nmap <leader>gk <plug>(signify-prev-hunk)
"nmap <leader>gJ 9999<leader>gJ
"nmap <leader>gK 9999<leader>gK
" }}}
" Plug >-- Fugitive/Rhubarb " {{{
" }}}
" Plug >-- NERDTree " {{{
"autocmd vimenter * NERDTree  " will auto open nerdtree
map <C-t> :NERDTreeToggle<CR> 
" maps ctrl+t to open nerdtree
" }}}
" Plug >-- Lightline " {{{
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif
set noshowmode

let g:lightline = { 'colorscheme': 'palenight_alter' }
" }}}
" Plug >-- Vifm " {{{
"map <Leader>vf :Vifm<CR>
"map <Leader>vs :VsplitVifm<CR>
"map <Leader>vh :SplitVifm<CR>
"map <Leader>dv :DiffVifm<CR>
"map <Leader>tv :TabVifm<CR>
"let g:vifm_replace_netrw = 1                                                                  
"let g:vifm_replace_netrw_cmd = '/home/shadow/.config/vifm/scripts/vifmrun'                    
"let g:NERDTreeHijackNetrw = 1                                                                 
"let g:loaded_netrw       = 1                                                                  
"let g:loaded_netrwPlugin = 1
" }}}
" Plug >-- VimWiki " {{{
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

set foldenable
let g:markdown_folding=1
let g:vim_markdown_folding_level=6

"let g:vimwiki_listsyms = '✗○◐●✓'
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
" }}}
" Plug >-- Quick Scope " {{{
let g:qs_highlight_on_keys = ['f', 'F', 't' , 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
"}}}
" Plug >-- Markdown Preview " {{{
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'qutebrowser'
set updatetime=100

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

let g:mkdp_page_title = '「${name}」'
nmap <F5> <Plug>MarkdownPreview
"nmap <M-s> <Plug>MarkdownPreviewStop
"nmap <C-p> <Plug>MarkdownPreviewToggle
" }}}
" Plug >-- Vim Which-Key " {{{
" Hides statusbar while which-key is open
call which_key#register('<Space>', "g:which_key_map")

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

nnoremap <silent> <leader> :silent WhichKey '<leader>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<leader>'<CR>

" Define a separator
let g:which_key_sep = '→'

let g:which_key_map = {}


" Search and Replace
nnoremap <leader>R :%s///gcI<left><left><left><left><left>
let g:which_key_map['R'] = [ ':%s///gcI<left><left><left><left><left>' , 'Search & Replace' ]
let g:which_key_map['S'] = [ ':Startify' , 'Startify' ]
let g:which_key_map['V'] = [ ':Vifm' , 'Vifm' ]
let g:which_key_map['Z'] = [ ':au ColorScheme * hi Normal ctermbg=none guibg=none<CR>' , 'BG Toggle' ]

" --- Setup Section --- " {{{
" +Calendar {{{
let g:which_key_map.c = {
    \ 'name' : '+Calendar',
    \ 'al' : [':Calendar'   , 'Calendar Left']      ,
    \ 'ar' : [':CalendarVR' , 'Calendar Right']     ,
    \ 'ab' : [':CalendarH'  , 'Calendar Bottom']    ,
    \ 'af' : [':CalendarT'  , 'Calendar Full']      ,
    \ }
" }}}
" +Startify {{{
let g:which_key_map.s = {
    \ 'name' : '+Startify',
    \ 'n' :  [':n ~/.config/nvim/init.vim' , 'Init.vim'                          ],
    \ 's' :  [':n ~/.config/sxhkd/sxhkdrc' , 'sxhkdrc'                           ],
    \ 'b' :  [':n ~/.config/bspwm/bspwmrc' , 'bspwmrc'                           ],
    \ 'k' :  [':n ~/.config/kitty/kitty.conf' , 'Kitty Conf'                     ],
    \ 'p' :  [':n ~/.config/polybar/config' , 'Polybar Conf'                     ],
    \ 'c' :  [':n ~/.config/picom.conf' , 'Picom Conf'                           ],
    \ 'S' :  [':n ~/Documents/PY-Projects/Shadochan/shadochan.py' , 'Shadochan'  ],
    \ 'w' :  [':n ~/vimwiki/index.md' , 'Vimwiki Index'                          ],
    \ 'm' :  [':n ~/.config/miscellaneous' , 'Misc File'                         ],
    \ 'r' :  [':n ~/.config/rofi/themes/onedark.rasi' , 'Rofi Theme'             ],
    \ 'Z' :  [':n ~/.config/zsh/.zshrc' , 'zshrc'                                ],
    \ 'z' :  [':n ~/.zshenv' , 'zshenv'                                          ],
    \ 'd' :  [':n ~/Documents/' , '~/Documents/'                                 ],
    \ 'ds':  [':n ~/Documents/SchoolWork/' , '~/Documents/SchoolWork/'           ],
    \ 'dh':  [':n ~/Documents/HTB/' , '~/Documents/HTB/'                         ],
    \ 'dc':  [':n ~/Documents/CTF/' , '~/Documents/CTF/'                         ],
    \ 'D' :  [':n ~/Downloads/' , '~/Downloads/'                                 ],
    \ 'ps':  [':n ~/Pictures/Screenshots/' , '~/Pictures/Screenshots/'           ],
    \ 'P' :  [':n ~/Pictures/' , '~/Pictures/'                                   ],
    \ 'M' :  [':n ~/Music/' , '~/Music/'                                         ],
    \ 'sc':  [':n ~/Documents/Shadochan/' , '~/Documents/Shadochan/'             ],
    \ }

" }}}
" +NERDCommenter {{{
let g:NERDCreateDefaultMappings = 0
let g:which_key_map['/'] = {
    \ 'name' : '+Commenter' ,
    \ '/' : ['<Plug>NERDCommenterToggle'    , 'Toggles Comment']    ,
    \ '$' : ['<Plug>NERDCommenterToEOL'     , 'Comment to EOL']     ,
    \ 'A' : ['<Plug>NERDCommenterAppend'    , 'Append to EOL']      ,
    \ 's' : ['<Plug>NERDCommenterSexy'      , 'Sexy']               ,
    \ 'u' : ['<Plug>NERDCommenterUncomment' , 'Uncomment']          ,
    \ 'y' : ['<Plug>NERDCommenterYank'      , 'Comment and Yank']   ,
    \ }
" }}}
" +Windows {{{
let g:which_key_map.W = {
    \ 'name' : '+Windows' ,
    \ 'w' : ['<C-W>w'     , 'Swap']                 ,
    \ 'd' : ['<C-W>c'     , 'Delete split']         ,
    \ 'h' : ['<C-W>h'     , 'Swap left']            ,
    \ 'j' : ['<C-W>j'     , 'Swap below']           ,
    \ 'l' : ['<C-W>l'     , 'Swap right']           ,
    \ 'k' : ['<C-W>k'     , 'Swap up']              ,
    \ 'H' : ['<C-W>5<'    , 'Expand left']          ,
    \ 'J' : [':resize +5'  , 'Expand below']         ,
    \ 'L' : ['<C-W>5>'    , 'Expand right']         ,
    \ 'K' : [':resize -5'  , 'Expand up']            ,
    \ '=' : ['<C-W>='     , 'Balance']              ,
    \ 's' : ['<C-W>s'     , 'Split Horizontally']   ,
    \ 'v' : ['<C-W>v'     , 'Split Vertically']     ,
    \ }
" }}}
" +wiki {{{
nmap <Leader>wb <Plug>VimwikiTabIndex
let g:which_key_map.w = {
    \ 'name' : '+Wiki' ,
    \ 'd' : ['<Plug>VimwikiDeleteLink'  , 'Delete']        ,
    \ 'h' : ['<Plug>Vimwiki2HTML'       , 'Convert to html']    ,
    \ 'hh': ['<Plug>Vimwiki2HTMLBrowse' , 'Convert and browse'] ,
    \ 'i' : ['<Plug>VimwikiDiaryIndex'  , 'Opens Diary']        ,
    \ 'r' : ['<Plug>VimwikiRenameLink'  , 'Renames Link']       ,
    \ 's' : ['<Plug>VimwikiUISelect'    , 'Select wiki']        ,
    \ 'b' : ['<Plug>VimwikiTabIndex'    , 'Opens tab of index'] ,
    \ 'w' : ['<Plug>VimwikiIndex'       , 'Opens index']        ,
    \ 't' : {
        \ 'name' : '+todo',
        \ 'c' : ['<Plug>VimwikiToggleListItem^ddGo\<Esc>pI\<right>\<right>~~\<Esc>A~~\<Esc>^db' , 'Complete TODO']      ,
        \ 't' : [':n ~/vimwiki/Life/TODO.md' , 'Open TODO']                 ,  
        \ }
    \ }
" }}}
" +lsp {{{
let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
        \ },
      \ }
" }}}
"  }}}
" }}}
"}}}
" ----------------------------------------------------- "
