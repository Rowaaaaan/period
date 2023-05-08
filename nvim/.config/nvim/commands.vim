" My custom commands

command! MakeTags !ctags -R .
command! EditPlugins find! ~/.config/nvim/plugins.vim
command! EditConf find! ~/.config/nvim/init.vim
command! EditKeys find! ~/.config/nvim/keys.vim
command! -nargs=0 Scratch new | setlocal buftype=nofile noswapfile bufhidden=wipe nobuflisted " Scratch buffer

" CoC function to show documentation on hover
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('definitionHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction
