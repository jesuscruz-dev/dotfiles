filetype plugin indent on
filetype plugin on
filetype on

syntax on
colorscheme sorbet

set nocompatible
set nobackup
set nowritebackup
set noswapfile
set number
set relativenumber
set hlsearch
set incsearch
set autoindent
set smartindent
set nowrap
set expandtab
set noshowmode
set cursorline
set termguicolors
set title
set list

set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set listchars=tab:»\ ,trail:·
set laststatus=2

set statusline=
set statusline+=%1*
set statusline+=\ 
set statusline+=%{Mode()}
set statusline+=\ 
set statusline+=%2*
set statusline+=\ 
set statusline+=%f
set statusline+=%m
set statusline+=%=
execute 'set statusline+=' . system('git -C ' . expand('%:p:h') . ' rev-parse --abbrev-ref HEAD 2>/dev/null')
set statusline+=\ 

highlight User1 guifg=#fefefe guibg=#005577
highlight User2 guifg=#bababa guibg=#202939

augroup highlight
    autocmd!
    autocmd InsertEnter * highlight User1 guifg=#000000 guibg=#96e736
    autocmd InsertLeave * highlight User1 guifg=#fefefe guibg=#005577
augroup END

augroup relativenumber
    autocmd!
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber
augroup END

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

nmap <C-b> :vsplit . <cr>

function! Mode()
    let l:current_mode = mode()
    if l:current_mode ==# 'n'
        return 'NORMAL'
    elseif l:current_mode ==# 'v'
        return 'VISUAL'
    elseif l:current_mode ==# 'V'
        return 'LINE'
    elseif l:current_mode ==# "\<C-v>"
        return 'BLOCK'
    elseif l:current_mode ==# 'i'
        return 'INSERT'
    elseif l:current_mode ==# 'R'
        return 'REPLACE'
    elseif l:current_mode ==# 'c'
        return 'COMMAND'
    elseif l:current_mode ==# 't'
        return 'TERMINAL'
    else
        return 'UNKNOWN'
    endif
endfunction
