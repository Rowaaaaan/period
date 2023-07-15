" Single keybinds
nnoremap <silent> <Tab> :bn!<CR>
nnoremap <silent> <S-Tab> :bp!<CR>
nnoremap <silent> <A-j> :resize -5<CR>
nnoremap <silent> <A-k> :resize +5<CR>
nnoremap <silent> <A-h> <C-W>5<
nnoremap <silent> <A-l> <C-W>5>

" Scroll coc floating window
if has('nvim-0.4.0') || has('patch-8.2.0750')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Toggle Coc completion because it blocks
" Some terminals send <NUL> when you press <C-space>
" inoremap <silent><expr> <NUL> coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

" CoC Tab autocomplete
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
let g:coc_snippet_next = '<tab>'

" Which_key config
let g:mapleader=" "

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR

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

nnoremap <silent> <leader>. :Files<CR>
nnoremap <silent> <leader>x :Scratch<CR>

" ==================================== }}

" Which-key config ================== {{

let g:which_key_map['f'] = {
			\ 'name' : 'File' ,
			\ 's' : [":w"                   , 'save file'          ],
			\ 'S' : [":wa"                  , 'save all'           ],
			\ 'b' : [':CocCommand explorer' , 'coc explorer'       ],
			\ 'f' : ['Files'                , 'find files'         ],
			\ 'h' : ['History'              , 'file history'       ],
			\ 'n' : [':new'                 , 'new file'           ],
			\ 'c' : [':EditConf'            , 'edit nvim config'   ],
			\ 'k' : [':EditKeys'            , 'edit nvim keybinds' ],
			\ 'p' : [':EditPlugins'         , 'edit nvim plugins'  ],
			\ }

let g:which_key_map['w'] = {
			\ 'name' : 'Windows'  ,
			\ 'd' : ['<C-W>c'      , 'delete-window'              ],
			\ 's' : ['<C-W>s'      , 'split-window-below'         ],
			\ 'v' : ['<C-W>v'      , 'split-window-right'         ],
			\ 'h' : ['<C-W>h'      , 'window-left'                ],
			\ 'j' : ['<C-W>j'      , 'window-below'               ],
			\ 'l' : ['<C-W>l'      , 'window-right'               ],
			\ 'k' : ['<C-W>k'      , 'window-up'                  ],
			\ 'w' : ['<C-W>w'      , 'go to next window'          ],
			\ 'p' : ['<C-W>p'      , 'go to previous window'      ],
			\ 'b' : ['<C-W>b'      , 'go to bottom window'        ],
			\ 'x' : ['<C-W>x'      , 'exchange window'            ],
			\ 'R' : ['<C-W>R'      , 'rotate windows upwards'     ],
			\ 'H' : ['<C-W>H'      , 'move window to far left'    ],
			\ 'J' : ['<C-W>H'      , 'move window to very bottom' ],
			\ 'L' : ['<C-W>L'      , 'move window to far right'   ],
			\ 'K' : ['<C-W>K'      , 'move window to very top'    ],
			\ '=' : ['<C-W>='      , 'balance-window'             ],
			\ '?' : ['Windows'     , 'fzf-window'                 ],
			\ }

let g:which_key_map['b'] = {
			\ 'name' : 'Buffer' ,
			\ '1' : ['b1'                       , 'buffer 1'                  ],
			\ '2' : ['b2'                       , 'buffer 2'                  ],
			\ 'd' : ['bd'                       , 'delete-buffer'             ],
			\ 'f' : ['bfirst'                   , 'first-buffer'              ],
			\ 'l' : ['blast'                    , 'last-buffer'               ],
			\ 'n' : ['bnext'                    , 'next-buffer'               ],
			\ 'p' : ['bprevious'                , 'previous-buffer'           ],
			\ '?' : ['Buffers'                  , 'fzf-buffer'                ],
			\ 't' : [':!kitty -e bash & disown' , 'terminal'                  ],
			\ 'g' : [':!kitty -e lazygit & disown' , 'git gui using lazygit'  ],
			\ '#' : [":b#"                      , 'Previously opened buffer']
			\ }

let g:which_key_map['g'] = {
			\ 'name' : 'Git'         ,
			\ 's' : [':Git'            , 'git status' ],
			\ 'P' : [':Git pull'       , 'git pull'   ],
			\ 'g' : [':LazyGit'       , 'git pull'   ],
			\ 'c' : [':Git commit'     , 'git commit' ],
			\ 'p' : [':Git push'       , 'git push'   ],
			\ }

let g:which_key_map['s'] = {
			\ 'name' : 'Sessions'  ,
			\ 'd' : ['Dashboard'   , 'home-buffer' ],
			\ 's' : [':mksession!' , 'save session'],
			\ 'l' : [':source Session.vim' , 'load session'],
			\ }

" ==================================== }}

let g:which_key_map['l'] = {
			\ 'name' : 'LSP'               ,
			\ 'o': [':CocList outline'               , 'list outline'     ],
			\ 'd': [':CocList diagnostics'           , 'list diagnostics' ],
			\ 'f': [":call CocActionAsync('format')" , 'format file'      ],
			\ }

call which_key#register('<Space>', "g:which_key_map")
