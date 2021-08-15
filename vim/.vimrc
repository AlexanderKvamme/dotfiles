" These are my plugs right here
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Nerdtree
let NERDTreeShowHidden=1

" Gitgutter
:highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

nmap <leader>h <Plug>(GitGutterNextHunk)
nmap <leader>H <Plug>(gitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

let mapleader = ","
":set termguicolors
":colorscheme seoul256
:syntax on
set clipboard=unnamed

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
:set bs=2


" tpope/vim-commentary
" map <leader>/ Commentary<cr>
" map <C-l> <plug>Commentary
" map <leader>

" Alexander's Mappings to move lines up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Insert new line without leaving normal mode
:nmap <CR><CR> o<ESC>

" Navigating between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new splits to the right/below
set splitbelow
set splitright

"""" Golang for vim
" Enable filetype plugins 
filetype plugin on
set autowrite

set updatetime=100
set ignorecase
set number

" Make line numbers less obtrusive
hi LineNr term=bold cterm=bold ctermfg=DarkGrey guifg=Grey guibg=Grey90

set tabstop=4 " tab as 4 spaces in vim in stead of 8
set shiftwidth=4 
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" swap files
set directory^=$HOME/.vim/swap//

