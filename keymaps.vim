nnoremap <silent> <Leader>tr :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <silent> <Leader>nt :<C-u>VimFilerExplorer -simple -parent -no-quit -find<CR>
nnoremap <Leader>a :Search<CR>
nnoremap <Leader>fb :Unite buffer<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
map <Leader>js :%!python -m json.tool<CR>
map <Leader>cs :%s/[{;}]/&\r/g|norm! =gg<CR>
inoremap jk <ESC>
set clipboard=unnamed
set autoindent
set shiftwidth=2

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

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

au BufLeave * if !&diff | let b:winview = winsaveview() | endif
au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif

nnoremap <Leader>er :ExecuteBuffer<CR>
nnoremap <Leader>ri :call RenewTagsFile()<CR>
nmap <Leader>jj :tselect <c-r>=expand("<cword>")<CR><CR>
" nmap <Leader>jj :call InvokeJumpToByType()<CR>

autocmd BufRead,BufNewFile *.js HighlightInlineHbs
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" au Filetype javascript setl et ts=4 sw=4

" git clone git@github.com:JakeBecker/elixir-ls.git
" cd elixir-ls && mkdir rel
" mix deps.get && mix compile
" mix elixir_ls.release -o rel

let g:ale_enabled = 0
let g:ale_elixir_elixir_ls_release = "/Users/".expand($USER)."/elixir-ls/rel"
let b:ale_elixir_elixir_ls_config = {'elixirLS': {'dialyzerEnabled': v:false, 'projectDir': expand($PWD)}}

autocmd FileType elixir nnoremap <Leader>jj :ALEGoToDefinition<cr>

let g:ale_linters = {'javascript': ['eslint'], 'elixir': ['elixir-ls']}

colorscheme PaperColor
