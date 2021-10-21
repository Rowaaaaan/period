" Single keybinds
nnoremap <silent> <Tab> :bn!<CR>
nnoremap <silent> <S-Tab> :bp!<CR>
nnoremap <silent> <A-j> :resize -5<CR>
nnoremap <silent> <A-k> :resize +5<CR>
nnoremap <silent> <A-h> <C-W>5<
nnoremap <silent> <A-l> <C-W>5>

" Which_key config
let g:mapleader=" "

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" ####################################
" My key config
" ####################################
" Keymaps =========================== {{

" Exits out of terminal
tnoremap <Esc> <C-\><C-n>

" ==================================== }}

" Which-key config ================== {{

let g:which_key_map['f'] = {
	\ 'name' : 'File' ,
	\ 's' : [":w"                   , 'save file'    ],
	\ 't' : [':CocCommand explorer' , 'coc explorer' ],
	\ 'f' : [':Telescope fd'        , 'find files'   ],
	\ 'h' : [':Telescope oldfiles'  , 'file history' ],
	\ 'n' : [':new'                 , 'new file'     ],
	\ }

let g:which_key_map['w'] = {
      \ 'name' : 'Windows'  ,
      \ 'w' : ['<C-W>w'      , 'other-window'        ],
      \ 'd' : ['<C-W>c'      , 'delete-window'       ],
      \ '"' : ['<C-W>s'      , 'split-window-below'  ],
      \ '%' : ['<C-W>v'      , 'split-window-right'  ],
      \ 'h' : ['<C-W>h'      , 'window-left'         ],
      \ 'j' : ['<C-W>j'      , 'window-below'        ],
      \ 'l' : ['<C-W>l'      , 'window-right'        ],
      \ 'k' : ['<C-W>k'      , 'window-up'           ],
      \ 'H' : ['<C-W>5<'     , 'expand-window-left'  ],
      \ 'J' : [':resize +5'  , 'expand-window-below' ],
      \ 'L' : ['<C-W>5>'     , 'expand-window-right' ],
      \ 'K' : [':resize -5'  , 'expand-window-up'    ],
      \ '=' : ['<C-W>='      , 'balance-window'      ],
      \ '?' : ['Windows'     , 'fzf-window'          ],
      \ }

let g:which_key_map['b'] = {
      \ 'name' : 'Buffer' ,
      \ '1' : ['b1'        , 'buffer 1'        ],
      \ '2' : ['b2'        , 'buffer 2'        ],
      \ 'd' : ['bd'        , 'delete-buffer'   ],
      \ 'f' : ['bfirst'    , 'first-buffer'    ],
      \ 'l' : ['blast'     , 'last-buffer'     ],
      \ 'n' : ['bnext'     , 'next-buffer'     ],
      \ 'p' : ['bprevious' , 'previous-buffer' ],
      \ '?' : ['Buffers'   , 'fzf-buffer'      ],
      \ }

let g:which_key_map['g'] = {
	\ 'name' : 'Git'         ,
	\ 's' : [':Git'            , 'git status' ],
	\ 'p' : [':Git push'       , 'git push'   ],
	\ 'g' : [':Git pull'       , 'git pull'   ],
	\ 'c' : [':Git commit'     , 'git commit' ],
	\ }

let g:which_key_map['s'] = {
	\ 'name' : 'Sessions'  ,
	\ 'd' : ['Dashboard'   , 'home-buffer' ],
	\ 's' : ['SessionSave' , 'save session'],
	\ 'l' : ['SessionLoad' , 'load session'],
	\ }

" ==================================== }}

let g:which_key_map['l'] = {
	\ 'name' : 'LSP'               ,
	\ 'o': [':CocList outline'     ,	 'list outline'],
	\ 'd': [':CocList diagnostics' , 'list diagnostics'],
	\ }

call which_key#register('<Space>', "g:which_key_map")
