nnoremap <silent> <Leader>tr :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <silent> <Leader>nt :<C-u>VimFilerExplorer -simple -parent -no-quit -find<CR>
nnoremap <Leader>a :Search<CR>
nnoremap <Leader>fb :Unite buffer<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
map <Leader>js :%!python -m json.tool<CR>
inoremap jk <ESC>
set clipboard=unnamed
set autoindent
set shiftwidth=2

set tags=.ztags;
function! RenewTagsFile()
    exe 'silent !rm -rf .ztags'
    exe 'silent !ctags -a -Rf .ztags --languages=typescript,javascript 2>/dev/null'
    exe 'redraw!'
endfunction
function! InvokeJumpToByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':call jedi#goto_definitions()'
    else
        :exe "norm \<C-]>"
    endif
endfunction
nnoremap <Leader>ri :call RenewTagsFile()<CR>
nmap <Leader>jj :call InvokeJumpToByType()<CR>

autocmd BufRead,BufNewFile *.js HighlightInlineHbs
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" au Filetype javascript setl et ts=4 sw=4
