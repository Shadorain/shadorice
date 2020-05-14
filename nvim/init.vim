" ----------------------------------------------------- "
"                                                       "
"                   NEOVIM CONFIG                       "
"                                                       "
" ----------------------------------------------------- "
" ----- Plugs ----- " {{{
call plug#begin('~/.local/share/nvim/plugged')
	
    "<--General
	Plug 'terryma/vim-multiple-cursors'
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
    "Plug 'kaicataldo/material.vim'
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
    Plug 'davidhalter/jedi-vim'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'justinmk/vim-syntax-extra'    
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

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
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"let mapleader = "'"
"au ColorScheme * hi Normal ctermbg=none guibg=none
set t_Co=256
set t_ut=
set nocompatible
colorscheme shadopurplesecond
highlight SignColumn guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
set clipboard+=unnamedplus
" Toggle side numbers
set foldmethod=marker
"au BufRead,BufNewFile *.md		setfiletype md

" --- Custom Key Commands! --- {{{
" Copies selected text from split window and paste in other 
vnoremap <F3> y<c-w>wp<c-w>pgv
" Turns off all line numbers
noremap <F3> :set invnumber invrelativenumber<CR>
" Search and Replace
nnoremap <leader>R :%s///gcI<left><left><left><left><left>

" }}}
"}}}
" ----- Plug Config ----- " {{{
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
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gK
" Highlight > Numbers
highlight SignifySignAdd    ctermfg=green  guifg=#03fc7f guibg=none
highlight SignifySignDelete ctermfg=red    guifg=#db1f4e guibg=none
highlight SignifySignChange ctermfg=yellow guifg=#dbc893 guibg=none
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
map <Leader>vf :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>vh :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>
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

let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]

" --- Setup Section --- " {{{
" +Windows
let g:which_key_map.W = {
    \ 'name' : '+Windows' ,
    \ 'w' : ['<C-W>w'     , 'other-window']                 ,
    \ 'd' : ['<C-W>c'     , 'delete-window']                ,
    \ '-' : ['<C-W>s'     , 'split-window-below']           ,
    \ '|' : ['<C-W>v'     , 'split-window-right']           ,
    \ '2' : ['<C-W>v'     , 'layout-double-columns']        ,
    \ 'h' : ['<C-W>h'     , 'window-left']                  ,
    \ 'j' : ['<C-W>j'     , 'window-below']                 ,
    \ 'l' : ['<C-W>l'     , 'window-right']                 ,
    \ 'k' : ['<C-W>k'     , 'window-up']                    ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']           ,
    \ 'J' : ['resize +5'  , 'expand-window-below']          ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']          ,
    \ 'K' : ['resize -5'  , 'expand-window-up']             ,
    \ '=' : ['<C-W>='     , 'balance-window']               ,
    \ 's' : ['<C-W>s'     , 'split-window-horizontally']    ,
    \ 'v' : ['<C-W>v'     , 'split-window-vertically']      ,
    \ }

" +wiki
nmap <Leader>wb <Plug>VimwikiTabIndex
let g:which_key_map.w = {
    \ 'name' : '+Wiki' ,
    \ 'd' : ['<Plug>VimwikiDeleteLink'  , 'delete-link']        ,
    \ 'h' : ['<Plug>Vimwiki2HTML'       , 'convert-to-html']    ,
    \ 'hh': ['<Plug>Vimwiki2HTMLBrowse' , 'convert-and-browse'] ,
    \ 'i' : ['<Plug>VimwikiDiaryIndex'  , 'opens-diary']        ,
    \ 'r' : ['<Plug>VimwikiRenameLink'  , 'renames-link']       ,
    \ 's' : ['<Plug>VimwikiUISelect'    , 'select-wiki']        ,
    \ 'b' : ['<Plug>VimwikiTabIndex'    , 'opens-tab-of-index'] ,
    \ 'w' : ['<Plug>VimwikiIndex'       , 'opens-index']        ,
    \ 't' : {
        \ 'name' : '+todo',
        \ 'c' : ['<Plug>VimwikiToggleListItem^ddGo\<Esc>pI\<right>\<right>~~\<Esc>A~~\<Esc>^db' , 'complete']      ,
        \ 't' : [':n ~/vimwiki/Life/TODO.md' , 'open-TODO']                 ,  
        \ }
    \ }


" +lsp
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


"  }}}
" }}}
"}}}
" ----------------------------------------------------- "
