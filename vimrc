syntax on

set t_Co=256
set cursorline
set number
set hls
set autoindent
set smartindent
set ic
set smartcase
set encoding=utf-8
set ruler
set shiftwidth=4
set softtabstop=4
set expandtab
set showcmd
set wildmenu
filetype indent plugin on

" Toggle Vexplore with Ctrl-O
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()
        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile
            close
        endif
        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction
map <silent> <C-O> :call ToggleVExplorer()<CR>

" Toggle highlight search
nnoremap <F3> :set hlsearch!<CR>

"netrw
" absolute width of netrw window
let g:netrw_winsize = -28
" tree-view
let g:netrw_liststyle = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" use the previous window to open file
let g:netrw_browse_split = 4
" let g:netrw_preview = 1
let g:netrw_liststyle = 3

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" vinegar-vim
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'


" ALE
" Auto-complete for C/C++/ObjC/Qt
let g:clang_library_path='/usr/lib/libclang.so'

" ALE completion
let g:ale_completion_enabled = 1

" Only lint once file is saved, not while text is changing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0


" onehalfdark
" Set as default theme
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
