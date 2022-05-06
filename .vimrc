set nocompatible              " required
filetype off                  " required

set encoding=utf-8
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
set showcmd
set updatetime=100
set tabstop=4
set shiftwidth=4
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" hybrid line
"
:set number
set noswapfile

" highlights
"
:highlight SignColumn ctermbg=222222
hi SpellBad ctermbg=237

"my maps
"
nmap oo o<ESC>k
nmap OO O<ESC>j

nmap U a<CR><ESC>
nmap 11 z=1<CR><CR>

nnoremap <LEFT> <nop>
nnoremap <RIGHT> <nop>
nnoremap <UP> <nop>
nnoremap <DOWN> <nop>

nnoremap <LEFT> <nop>
nnoremap <RIGHT> <nop>
nnoremap <UP> <nop>
nnoremap <DOWN> <nop>

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number

" My plugins
"
Plugin 'tabnine/YouCompleteMe'

Plugin 'michaelmure/mdr'
Plugin 'skanehira/preview-markdown.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/goyo.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'nathanalderson/yang.vim'



" YCM setup
"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/simple_ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu

" make YCM compatible with UltiSnips (using <Ctrl-N>, <Ctrl-P>)
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" commands mappings
nnoremap <F1> :pclose<CR>:silent YcmCompleter GetDoc<CR>
nnoremap <S-F1> :pclose<CR>
nnoremap <C-F1> :YcmCompleter GetType<CR>
nnoremap <F9> :YcmCompleter GoTo<CR>
nnoremap <S-F9> :YcmCompleter GoToReferences<CR>
nnoremap <F10> :YcmCompleter FixIt<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ycm_use_clangd = 1
let &t_Co=256

" air-line
let g:airline_powerline_fonts = 1

"let g:airline_theme='bubblegum'
"let g:airline_theme='cool'
let g:airline_theme='soda'


" Highlights

highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=6
highlight GitGutterDelete ctermfg=red


" gitgutter symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = '~'

"Check if NERDTree is open or active
function! IsNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a
" modifiable
" " file, and we're not in vimdiff
function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
