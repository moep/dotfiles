"  ▌▌▌▛▛▌▛▘▛▘
"▗ ▚▘▌▌▌▌▌ ▙▖

" For more info type
" :help moep

" == general settings ==============================================================================
" {{{
" use system's vim settings
set rtp^=/usr/share/vim/vimfiles/

" use vim settings instead of vi
set nocompatible

" enable mouse in all modes
set mouse=a

" color scheme
if &t_Co > 255
  set termguicolors
endif
colorscheme photon_moep

" Status line
set ruler
set laststatus=2
set noshowmode

" Don't parse last lines for vim commands
set modelines=0

"hide buffers
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

" no initial folding
set nofoldenable

" highlight current line
set cursorline
"hi CursorLine   cterm=NONE ctermbg=240 ctermfg=NONE

" show non-printable characters
set list
set listchars=
set listchars+=tab:→\
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿

" remove trailing whitespaces and ^M chars
augroup ws
  autocmd!
  autocmd FileType c,cpp,java,php,js,json,css,scss,sass,py,rb,coffee,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
augroup end

" auto-index help files
command! -nargs=0 -bar Helptags
    \  for p in glob('~/.config/nvim/pack/bundle/opt/*', 1, 1)
    \|     exe 'packadd ' . fnamemodify(p, ':t')
    \| endfor
    \| helptags ALL

" disable capslock when entering normal mode
" TODO xdotool not avialable in FreeBSD?
"function TurnOffCaps()
"    let capsState = matchstr(system('xset -q'), '00: Caps Lock:\s\+\zs\(on\|off\)\ze')
"    if capsState == 'on'
"        silent! execute ':!xdotool key Caps_Lock'
"    endif
"endfunction

"augroup insert_leave
"    autocmd!
"    autocmd InsertLeave * call TurnOffCaps()
"augroup end

" c specific settings
let &path.="src/include,/usr/local/include/,"
augroup c_settings
    autocmd!
augroup end
" }}}

" == custom commands ===============================================================================
" {{{
" leader key: ,
let mapleader="\\"

" no timeout for leader
"set notimeout

" replace esc with jj in insert mode
"inoremap <esc> <nop>
inoremap jj <esc>

" Prevent accidentially entering ex mode
nnoremap Q <nop>

" Clear search highlightling with AltGr+/ (us-layout)
nnoremap ¿ :nohlsearch<cr>

" Should be project specific
nnoremap <F1> make kernel
nnoremap <F2> make run

" Buffers in general
nnoremap <silent> <leader>h :bn<CR>
nnoremap <silent> <leader>l :bp<CR>
nnoremap <silent> <C-Right> :bn<CR>
nnoremap <silent> <C-Left>  :bp<CR>
nnoremap <silent> <C-Down>  :bd<CR>

" Fzf
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>F :Rg<CR>
nnoremap <silent> <Leader>f :BLines<CR>
nnoremap <silent> <Leader>e :Buffers<CR>
nnoremap <silent> <leader>. :Buffers<CR>

" misc
"nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

nnoremap <C-Up> :'<,'> !figlet -d ~/.local/ports/figlet-fonts/  -w 150 -f '3d' -- <CR>
" }}}

" == lightline =====================================================================================
" {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \            [ 'readonly', 'relativepath', 'modified', 'gitbranch' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitGutter'
      \ },
\ }

let g:lightline.enable = {
  \ 'statusline': 1,
  \ 'tabline': 1
\ }

" shorter mode indicators
let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'V-L',
    \ "\<C-v>": 'V-L',
    \ 'c' : ':',
    \ 's' : 'S',
    \ 'S' : 'S-L',
    \ "\<C-s>": 'S-B',
    \ 't': 'T',
    \ }
" }}}

" == bufferline ====================================================================================
" {{{
lua require('config/bufferline')
lua require('config/devicons')

nnoremap <silent> <leader>b :BufferLinePick<CR>
" }}}
" == git gutter ====================================================================================
" {{{
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
" }}}

" == nvim-tree =====================================================================================
" {{{
lua << EOF
require'nvim-tree'.setup()
require'nvim-web-devicons'.setup()
vim.api.nvim_set_keymap('n', 'T', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
EOF

" Workaround for fish causing a long freeze when calling NvimTreeToggle (or setup)
set shell=/usr/local/bin/bash
" }}}

" == LSP ===========================================================================================

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set completeopt=menu,menuone,noselect

" https://github.com/neovim/nvim-lspconfig
lua require('config/lsp_rust')
lua require('config/lsp_keymap')
lua require('config/lsp_clangd')
" }}}
echohl Error | echo "(V) (°,,,°) (V)" | echohl None
