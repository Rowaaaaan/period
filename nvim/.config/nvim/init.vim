source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keys.vim
source ~/.config/nvim/autocmds.vim
source ~/.config/nvim/commands.vim

" Base settings
set nocompatible
filetype plugin on
syntax on
set mouse=a
set path+=**
set wildmenu
set termguicolors

" Indentation settings
set number relativenumber
set tabstop=4
set softtabstop=-1
set shiftwidth=0
set shiftround
set autoindent smartindent

" Fold settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" LSP settings
set updatetime=300

"Color settings
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onedark
let g:airline_theme='onedark'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

" LaTex
let g:livepreview_previewer='zathura'
let g:liveprevier_engine='pdflatex'

" Dashboard
let g:dashboard_default_executive = 'telescope'

" Neovide
let g:neovide_cursor_vfx_mode="railgun"
set guifont=FiraCode
