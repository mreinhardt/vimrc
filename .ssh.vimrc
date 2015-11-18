" get latest vim daily first
" sudo add-apt-repository ppa:pkg-vim/vim-daily
" sudo apt-get update && sudo apt-get upgrade

" ensure global vimrc loaded
execute "source /etc/vim/vimrc"

" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug
" Requires https://github.com/powerline/powerline

set t_Co=256
set t_ut=  " ensure tmux colors work correctly
set background=dark
colorscheme lapis256
" lapis overrides
  highlight ColorColumn ctermfg=125 ctermbg=238
  highlight CursorLine ctermbg=236


" Plugins
call plug#begin()
Plug 'eiginn/netrw'
Plug 'mreinhardt/vimrc'
"Plug 'sjl/vitality.vim'
Plug 'terryma/vim-expand-region'
"Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-repeat'
"Plug 'vim-scripts/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
"Plug 'svermeulen/vim-easyclip'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
call plug#end()


" Disable arrow keys... get vimmy!
noremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Powerline
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Cycle selection expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

