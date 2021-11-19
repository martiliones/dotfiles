set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

filetype plugin indent on

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'kyazdani42/nvim-tree.lua'
  Plugin 'yamatsum/nvim-nonicons'
  Plugin 'kyazdani42/nvim-web-devicons'
  Plugin 'tpope/vim-fugitive'
  Plugin 'itchyny/lightline.vim'
  Plugin 'nvim-lua/plenary.nvim'
  Plugin 'nvim-telescope/telescope.nvim'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'joshdick/onedark.vim'
  Plugin 'dart-lang/dart-vim-plugin'
  Plugin 'natebosch/vim-lsc'
  Plugin 'natebosch/vim-lsc-dart'
  Plugin 'neoclide/coc.nvim'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'dense-analysis/ale'
call vundle#end()

augroup vimrc

   autocmd!

   autocmd ColorScheme * highlight Normal guibg='#121212' | highlight MatchParen guibg='#121212'

augroup END

let g:lsc_auto_map = v:true

lua require('init')

nnoremap <C-n> :NvimTreeToggle<CR>
set termguicolors

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

nmap <C-h> :Telescope find_files<CR>

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set autoindent
set smarttab

set number
set ruler
