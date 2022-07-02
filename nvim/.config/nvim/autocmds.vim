" Autocmds

" File templates
autocmd BufNewFile *.c,*.cc,*.cpp 0r ~/.config/nvim/skel/skel.cpp | exec "normal 3j"
autocmd BufNewFile *.html,*.htm 0r ~/.config/nvim/skel/skel.html | exec "normal 3j"
autocmd BufNewFile *.pde 0r ~/.config/nvim/skel/skel.pde

autocmd BufReadPre *.vim silent! foldmethod=manual
autocmd BufWinLeave *.vim silent! foldmethod=indent
" remove trailing whitespace
autocmd BufWritePre * silent! %s/\s\+$//
autocmd BufReadPre ~/.config/awesome/* silent! :CocDisable
autocmd BufWinLeave ~/.config/awesome/* silent! :CocEnable

" format code before writing
autocmd BufWritePre :normal gg=G
