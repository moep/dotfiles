"  ▌▌▌▛▛▌▛▘▛▘
"▗ ▚▘▌▌▌▌▌ ▙▖

" use system's vim settings
set rtp^=/usr/share/vim/vimfiles/

" use vim settings instsetead of vim
set nocompatible

" enable mouse in all modes
set mouse=a

" color scheme
" fogbell_lite sunbather
colorscheme photon_moep

" Status line
set ruler
set laststatus=2
set noshowmode
"hi StatusLine ctermbg=white ctermfg=240
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

" Don't parse last lines for vim commands
set modelines=0

" hide buffers
set hidden

" less strict find and search
set path+=**
set ignorecase
set smartcase
set infercase
set wildignorecase
set wildignore+=.git,*.tmp,*.o,*.obj

" search highlight
set hlsearch
set incsearch

" syntax highlighting and line numbers
syntax on
set number relativenumber
"set number

" better backspace handling
set backspace=indent,eol,start
set softtabstop=2

" indent 2 spaces; every 2 spaces
set shiftwidth=2
set tabstop=2

" replace tabs with spaces
set expandtab

" autoindent
set autoindent

" no line wrapping
"set nowrap

" no folding
set nofoldenable

" highlight current line
set cursorline
"hi CursorLine   cterm=NONE ctermbg=240 ctermfg=NONE

" show non-printable characters
set list
set listchars=
set listchars+=tab:𐄙\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿

" remove trailing whitespaces and ^M chars
augroup ws
  au!
  autocmd FileType c,cpp,java,php,js,json,css,scss,sass,py,rb,coffee,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup end

" leader key: ,
let mapleader=","

" == c specific settings =========================================================================== 
autocmd FileType c set shiftwidth=2|set softtabstop=2|set cindent

" == custom commands =============================================================================== 
" Prevent accidentially entering ex mode
map q: <Nop>
nnoremap Q <nop>

" Buftabline
nnoremap <silent> <C-Left>  :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>
nnoremap <silent> <C-Down>  :bd<CR>

" Fzf
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <C-F> :Rg<CR>
nnoremap <silent> <Leader>f :BLines<CR>
nnoremap <silent> <C-E> :Buffers<CR>

" misc
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

"nnoremap <C-Up> :'<,'> !figlet -d ~/tmp/figlet-fonts/  -w 150 -f '3d' -- <CR>

" == lightline ===================================================================================== 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \            [ 'readonly', 'modified', 'gitbranch' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitGutter'
      \ },
\ }

let g:lightline.enable = {
  \ 'statusline': 1,
  \ 'tabline': 1
\ }

" == git gutter ==================================================================================== 
function! LightlineGitGutter()
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction

hi GitGutterAddLine ctermbg=NONE ctermfg=1 cterm=NONE
hi GitGutterAddLine ctermbg=NONE ctermfg=1 cterm=NONE   
hi GitGutterChangeLine       ctermbg=NONE ctermfg=1 cterm=NONE
hi GitGutterDeleteLine       ctermbg=NONE ctermfg=1 cterm=NONE
hi GitGutterChangeDeleteLine ctermbg=NONE ctermfg=1 cterm=NONE

" disable keybinding
" " disable keybindingss
let g:gitgutter_map_keys = 0

let g:gitgutter_sign_added = '▐'
let g:gitgutter_sign_modified = '▐'
let g:gitgutter_sign_removed = '▐'
let g:gitgutter_sign_removed_first_line = '▐'
let g:gitgutter_sign_removed_above_and_below = '▐'
let g:gitgutter_sign_modified_removed = '▐'

" colors
" Colors
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=28
highlight GitGutterChange ctermfg=214
highlight GitGutterDelete ctermfg=160
highlight GitGutterChangeDelete ctermfg=39

" == jedi-vim ====================================================================================== 
