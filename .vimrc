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
