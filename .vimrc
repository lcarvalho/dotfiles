call pathogen#infect()
syntax on
filetype plugin indent on

" Tab
set tabpagemax=999

" Tab Navigation
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-right>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" Status bar
set laststatus=2

" Space and TAB
set shiftwidth=4
set expandtab

" Highlights whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


set showmatch " Show matching brackets.
set tabstop=4 "when types <TAB> it puts 4 spaces
set incsearch
set hls
set sc "show command
set title
set ruler
set autoread
set smartindent "indent the new lines as the previous
set paste "Insert (PASTE)
set backspace=indent,eol,start
set backupdir=/tmp
set directory=/tmp

let g:vim_json_syntax_conceal = 1
let g:NERDTreeIgnore=['\~$', 'vendor', 'node_modules', '.git', '.gopath', '.sass-cache', '\.pyc$', '__pycache__', '\.egg-info$', 'bower_components', 'Godeps']
let g:NERDTreeShowHidden=1

" Flake8 on save
autocmd BufWritePost *.py call Flake8()
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

set wildignore+=*.so,*.swp,*.zip,*.pyc

" JSHint2
let jshint2_save = 1

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
let g:ctrlp_custom_ignore = '(bower_components|node_modules)$'

" Ignoring to ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,bower_components,node_modules
