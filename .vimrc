" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug
" Requires https://github.com/powerline/powerline

set t_Co=256
colorscheme jellybeans

" Plugins
call plug#begin()
Plug 'mreinhardt/vimrc'
Plug 'sjl/vitality.vim'
Plug 'terryma/vim-expand-region'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'vim-scripts/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-endwise'
call plug#end()

" Powerline
source /Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

" Cycle selection expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

