source keys.vim
source plugins.vim

set nocompatible
filetype plugin on
syntax on
set runtimepath+=~/vw_tmp/vimwiki
let wiki = {}
let wiki.path = '~/vw_tmp/wiki'
let wiki.path_html = '~/vw_tmp/wiki/html'
let wiki.syntax = 'default'
let wiki.ext = '.wiki'
let g:vimwiki_list = [wiki]
