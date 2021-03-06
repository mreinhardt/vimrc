" Mike Reinhardt .vimrc
" Requires https://github.com/junegunn/vim-plug


set t_Co=256
set t_ut=  " ensure tmux colors work correctly
set background=dark
colorscheme lapis256
" lapis overrides
  highlight ColorColumn ctermfg=125 ctermbg=020
  highlight CursorLine ctermbg=018
" transparent bg
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE


" Plugins
call plug#begin()
Plug 'mreinhardt/vimrc'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'kien/ctrlp.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ag.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'sukima/xmledit'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-markdown'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-highlight'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/CSSMinister'
Plug 'junegunn/vader.vim'
call plug#end()


let mapleader = "\<Space>"
set relativenumber

" Airline
let g:airline_theme='behelit'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline#extensions#virtualenv#enabled=1

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Cycle selection expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Make YCM work with soft tabs and be compatible with UltiSnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" YCM
nnoremap <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "'"

" UltiSnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
nnoremap <Leader>es :split ~/.vim/ultisnips<CR>
nnoremap <Leader>ue :UltiSnipsEdit<CR>

" Syntastic
set statusline+="%#warningmsg#"
set statusline+="%{SyntasticStatuslineFlag()}"
set statusline+="%*"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

nmap <silent> e[ :lprev<CR>
nmap <silent> e] :lnext<CR>

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" Filetypes
filetype indent off
au BufRead,BufNewFile *.sls set filetype=yaml
au BufRead,BufNewFile *.erb set filetype=eruby.html

