" nnoremap <Leader>d .... now use <Leader>tr instead!
nnoremap <Leader>tr :VimFilerExplorer -simple -parent -toggle<CR>
nnoremap <Leader>nt :VimFilerExplorer -simple -parent -find<CR>
nnoremap <Leader>a :Search<CR>
nnoremap <Leader>fb :Unite buffer<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
map <Leader>js :%!python -m json.tool<CR>
inoremap jk <ESC>
set clipboard=unnamed
" au Filetype javascript setl et ts=4 sw=4
