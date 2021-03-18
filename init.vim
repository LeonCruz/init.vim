call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale', { 'do' : 'pip install black pylint isort jedi pynvim' }
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'neoclide/coc-solargraph', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-test/vim-test'
Plug 'rakr/vim-one'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
call plug#end()

"Configuração dos arquivos
set number
set relativenumber
set encoding=UTF-8
set noswapfile
set linebreak
set clipboard=unnamedplus

"Configuração do tema
colorscheme one
set background=dark
set termguicolors
let g:airline_theme='one'

"Configuração do NERDTree
map <C-a> :NERDTreeToggle<CR>

let NERDTreeShowHidden = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

"Tecla tab para o emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Configuração do analisador de código - ALE
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

let g:ale_linters = {
  \ 'ruby': ['rubocop'],
  \ 'python': ['pylint'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
\}

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'python': ['isort', 'black'],
  \ 'ruby': ['rubocop'],
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
\}

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

map <leader>gd <Plug>(coc-definition)
map <leader>gr <Plug>(coc-references)

" Configurações do ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|deps\|_build\|.elixir_ls\|__pycache__\|venv\|.venv\|vendor\'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1


" Manter o cursor do terminal como underline
" au VimLeave * set guicursor=a:hor10-blinkon0

" Configuração do vim-test
let test#strategy = "neovim"
let g:test#preserve_screen = 1

" MEUS ATALHOS

" Definição da tecla leader.
let mapleader = " "

" Reapeamento da tecla ESC
inoremap ii <Esc>
inoremap <Esc> <Nop>
vnoremap ii <Esc>
vnoremap <Esc> <Nop>

" Execução de testes
map <leader>t :TestNearest<CR>
map <leader>f :TestFile<CR>
map <leader>s :TestSuite<CR>

" Terminal
nmap <leader>T :belowright split term://zsh<CR>
nmap <leader>" :tabnew term://zsh<CR>
tmap ii  <C-\><C-n>

"
function! JumpDefinition()
  call CocActionAsync("jumpDefinition", "belowright vsplit")
endfunction

nmap <leader>GT :call JumpDefinition()<CR>
