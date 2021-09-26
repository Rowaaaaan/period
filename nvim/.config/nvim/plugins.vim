if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-sleuth'

" File manipulation =============================={{

	Plug 'liuchengxu/vim-which-key'                     " Shows popup of leader key combinations
	Plug 'tpope/vim-repeat'                             " Repeats last command using .
	Plug 'tpope/vim-surround'                           " Surrounds text with either func name ex. main(), html tags, or brackets {} of choice
	Plug 'jiangmiao/auto-pairs'                         " Automatically pairs brackets and parenthesis
	Plug 'haya14busa/incsearch.vim'                     " Show search result-highlights whilst typing the query

" =============================================}}

" File browsing =================================={{

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file opener, use: :FZF or :FZF! for fullscreen
	Plug 'junegunn/fzf.vim'

" =============================================}}

" Plugin for Git =============================={{

	if has('nvim') || has('patch-8.0.902')
		Plug 'mhinz/vim-signify'
	else
		Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
	endif

	Plug 'tpope/vim-fugitive'

" =============================================}}

" Navigation ================================={{

	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
	Plug 'pechorin/any-jump.vim'
	Plug 'justinmk/vim-sneak'
	Plug 'honza/vim-snippets'

" =============================================}}

" Formatting =========================================================== {{

	Plug 'godlygeek/tabular'							 " :Tab /regex can align code on occurrences of the given regex. I.e. :Tab /= aligns all = signs in a block.
	Plug 'preservim/nerdcommenter'

" =============================================}}

" Bloat ================================================================ {{

	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	Plug 'machakann/vim-highlightedyank'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-airline/vim-airline'
	Plug 'joshdick/onedark.vim'
	Plug 'kyoz/purify', { 'rtp': 'vim' }
	"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Shows colors from hex and rgb codes
	Plug 'ryanoasis/vim-devicons'
	Plug 'psliwka/vim-smoothie'
	Plug 'vimwiki/vimwiki', { 'branch' : 'dev' }
	Plug 'xuhdev/vim-latex-live-preview'
	Plug 'onsails/lspkind-nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'Yggdroot/indentLine'
	Plug 'glepnir/dashboard-nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'

" =============================================}}

" Language Plugins ===================================================== {{{

	Plug 'puremourning/vimspector', {
		\ 'do': 'python3 install_gadget.py --enable-vscode-cpptools'
		\ }

	Plug 'sheerun/vim-polyglot'		" Syntax highlighting for most languages
	Plug 'alvan/vim-closetag'

	" PHP
	Plug 'adoy/vim-php-refactoring-toolbox'
	Plug 'StanAngeloff/php.vim'
	Plug 'kevinoid/vim-jsonc'
	Plug 'stephpy/vim-php-cs-fixer'

	" HTML
	Plug 'ap/vim-css-color'
	Plug 'mattn/emmet-vim'

	" JS
	Plug 'pangloss/vim-javascript' " syntax highlighting JS
	Plug 'ianks/vim-tsx'
	Plug 'leafgarland/typescript-vim'
	Plug 'HerringtonDarkholme/yats.vim' " typescript syntax highlighting
	Plug 'mxw/vim-jsx'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'turbio/bracey.vim'

" =============================================}}}
" ========= Unused plugins ========== {{{

	"" Haskell
	" Plug 'neovimhaskell/haskell-vim'
	" Plug 'Twinside/vim-hoogle', {'on': 'Hoogle'}

	" Rust
	" Plug 'rust-lang/rust.vim'
	" Plug 'mattn/webapi-vim'

	" Plug 'LnL7/vim-nix'
	" Plug 'udalov/kotlin-vim'
	" Plug 'purescript-contrib/purescript-vim'

	" Plug 'nathanaelkane/vim-indent-guides' " Can be toggled using <leader>ig (intent-guides)
	" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
	" Plug 'hauleth/sad.vim'                              " Use siw instead of ciw. when using . afterwards, will find the next occurrence of the changed word and change it too

" =============================================}}}
call plug#end()
