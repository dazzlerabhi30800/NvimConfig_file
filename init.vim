:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set wrap
:set termguicolors
:set linespace=3
:set guicursor=i:block
:set linespace=5
set showmatch
syntax on
:set autoindent
":set cc=80
:set smartindent

call plug#begin('~/.config/nvim/plugged') 

Plug 'https://github.com/vim-airline/vim-airline'

Plug 'https://github.com/preservim/nerdtree' 

Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' "Nerd Tree

Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight' "Nerd tree syntax highlight

Plug 'https://github.com/ryanoasis/vim-devicons' "devIcons

Plug 'https://github.com/morhetz/gruvbox' "Gruvbox theme

Plug 'https://github.com/joshdick/onedark.vim' "One Dark theme


Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' "indent line


Plug 'https://github.com/neoclide/coc.nvim' 

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)

Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme

Plug 'https://github.com/christoomey/vim-tmux-navigator' "tmux navigator

Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

Plug 'https://github.com/neoclide/coc-snippets'
Plug 'https://github.com/neoclide/coc-prettier' "prettier extension

Plug 'https://github.com/mattn/emmet-vim' "emmet plugin

Plug 'https://github.com/preservim/nerdcommenter' "nerd commenter


Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal

Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation

Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim

Plug 'https://github.com/norcalli/nvim-colorizer.lua' "Colorizer

" Language Syntax Support
Plug 'yuezk/vim-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql' "graphql syntax highlighting



set encoding=UTF-8

call plug#end()


"Setting up nerd Tree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

let g:NERDTreeIgnore = ['^node_modules$']

nmap <F8> :TagbarToggle<CR>

"configure palenight theme
colorscheme onedark
syntax on
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
let g:airline_theme='onedark'
let g:onedark_termcolors=256
let g:onedark_termcolors=16

"Configure neoformat

"NeoScroll

"configure indent line

"Colorizer setup
lua require'colorizer'.setup()

"Save the file using Ctrl + s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a


"speeding up vim
:set timeoutlen=3000        " speed vim up
:set ttimeoutlen=100          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
":set ttyfast                " Rendering
:set tw=2000
:set lazyredraw



" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction


" if hidden is not set, TextEdit might fail.
:set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
:set updatetime=300

" don't give |ins-completion-menu| messages.
:set shortmess+=c

" always show signcolumns
:set signcolumn=yes

:set secure

"Setting the font
":set guifont=Iosevka:7
:set guifont=Iosevka\ Fixed\ Extended:h7

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


"JS syntax highlighting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1



" Splits and tabbed files
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\


"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
autocmd FileType css setl iskeyword+=-
"For scss file
autocmd FileType scss setl iskeyword+=@-@
"For html file

"Fixing the copy paste command
"set clipboard^=unnamed,unnamedplus
"inoremap <C-S-v> <Esc>"+p`]a
"set clipboard+=unnamedplus
"set clipboard=unnamedplus


command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"configuring emmet
let g:user_emmet_leader_key=','


" Increases the font size with `amount`
function! Zoom(amount) abort
  call ZoomSet(matchstr(&guifont, '\d\+$') + a:amount)
endfunc

" Sets the font size to `font_size`
function ZoomSet(font_size) abort
  let &guifont = substitute(&guifont, '\d\+$', a:font_size, '')
endfunc

noremap <silent> <C-+> :call Zoom(v:count1)<CR>
noremap <silent> <C--> :call Zoom(-v:count1)<CR>
noremap <silent> <C-0> :call ZoomSet(11)<CR>

"NEOVIDE SETTINGS

"Cursor in neovide
let g:neovide_cursor_vfx_mode = "railgun"

"Setting the refresh rate of editor
let g:neovide_refresh_rate=60

"Setting the line-height
let g:neovide_line_height=10


"Moving the line in upwared direction

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv






