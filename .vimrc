"Plugins
call plug#begin('~/.vim/plugged')

" JavaScript support
Plug 'pangloss/vim-javascript'
" TypeScript syntax
Plug 'leafgarland/typescript-vim'
" JS and JSX syntax
Plug 'maxmellon/vim-jsx-pretty'
" GraphQL syntax
Plug 'jparise/vim-graphql'
" Autocomplete
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }

"Firestore Rules
Plug 'delphinus/vim-firestore'

"One Dark Theme
Plug 'joshdick/onedark.vim'

"language features
Plug 'sheerun/vim-polyglot'

" Git integration
Plug 'tpope/vim-fugitive'

" Bracket closer
Plug 'jiangmiao/auto-pairs'

" File Tree
Plug 'preservim/nerdtree'

" File Finders
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Icons
Plug 'ryanoasis/vim-devicons'

Plug 'xabikos/vscode-react'


call plug#end()

set encoding=utf-8

set hidden

set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

set signcolumn=number

set mouse=a " Enable Mouse mode in all modes

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col-1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim
" to format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Numbers
set number
"set ruler

set autoindent
set cindent
set smartindent

set foldmethod=syntax
set foldlevel=99

nmap z za


set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

autocmd BufWritePre * :%s/\s\+$//e

set ignorecase
set smartcase
set incsearch

set laststatus=2

au BufRead,BufNewFile *.mp setlocal spell
au BufRead,BufNewFile *.mp.erb setlocal spell
au BufRead,BufNewFile *.feature setlocal spell

set backspace=indent,eol,start

"+++ Shortcuts +++
"Open Buffer
nnoremap <silent><leader>l :Buffers<CR>
"Vertically split screen
nnoremap <silent><leader>\ :vs<CR>
"Split screen
nnoremap <silent><leader>/ :split<CR>

"Faster saving and editing
nnoremap <silent><leader>s :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>

"Open Vim config file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>
"Source Vim config files and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

"Toggle relative line numbers
nnoremap <leader>rn :set relativenumber!<cr>

" Extra <CR> is for disabling /"
nnoremap <silent><leader>e :Exp<CR><CR>

" Easier movement between split windows CTRL + {h, j, k, l}
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Creating new windows
nnoremap <c-v> <c-w>v
nnoremap <c-c> <c-w>c

" Autocomplete CoC extensions
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-ultisnips' ]
" Add CoC prettier if installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
" Add CoC ESLint if installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Format
command! -nargs=0 Prettier :CocCommand prettier.formatFile

xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  "setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" make error texts have a red color
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
highlight CocFloating ctermfg=Black guifg=#000000
"highlight CocErrorFloat ctermfg=Black guifg=#000000
"highlight CocWarningFloat ctermfg=Black guifg=#000000

syntax on
colorscheme onedark

augroup ReactFileTypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

"Changing cursor


"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar


"set how i want folding
set foldmethod=indent

"get autocomplete suggestions from ctrl-spcae
inoremap <C-@> <C-p>

" show what cmd is currently typed
set showcmd

" prevent key timeouts
set notimeout nottimeout
