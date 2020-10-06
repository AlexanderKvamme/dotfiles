" These are my plugs right here
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
"Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
"Plug 'AndrewRadev/splitjoin.vim'
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

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

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

" Disable keys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

"""" Golang for vim
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Enable filetype plugins 
filetype plugin on
set autowrite

" go shortcuts
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" bruk heller funksjonen under
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" bedre build shortcut/funksjon
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_auto_type_info = 1
set updatetime=100
set ignorecase
set number

" Make line numbers less obtrusive
hi LineNr term=bold cterm=bold ctermfg=DarkGrey guifg=Grey guibg=Grey90

" colors
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
set tabstop=4 " tab as 4 spaces in vim in stead of 8
set shiftwidth=4 
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
let g:go_auto_sameids = 1

" swap files
set directory^=$HOME/.vim/swap//

