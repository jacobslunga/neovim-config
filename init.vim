"[[
" ___       _ _
"|_ _|_ __ (_) |_
" | || '_ \| | __|
" | || | | | | |_
"|___|_| |_|_|\__|
"]]

set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set langmenu=en_US
" set guicursor=a:blinkon100
set clipboard^=unnamed,unnamedplus
syntax on

au ColorScheme * hi Normal ctermbg=none guibg=none

call plug#begin()

Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ap/vim-css-color'
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'jparise/vim-graphql'
Plug 'EdenEast/nightfox.nvim'
Plug 'rose-pine/neovim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'Mofiqul/dracula.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'morgsmccauley/vim-react-native-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/eslint.nvim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}

call plug#end()

lua << EOF
require('lualine').setup()
vim.opt.termguicolors = true
require('nvim-tree').setup()

require('nvim-treesitter.configs').setup {
	-- A list of parser names, or "all"
	ensure_installed = { "javascript", "typescript", "c", "lua", "rust" },
	sync_install = false,   
	auto_install = true,

	highlight = {
		enable = true,

		disable = { "c", "rust" },
		disable = function(lang, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return true
			end
			end,

			additional_vim_regex_highlighting = false,
			},
}

EOF

autocmd VimEnter * NvimTreeFocus

set encoding=UTF-8

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : '<CR>'

nnoremap <C-a> <Cmd>BufferPrevious<CR>
nnoremap <C-s> <Cmd>BufferNext<CR>
nnoremap <C-f> :NvimTreeFocus<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>
nnoremap <C-t> :NvimTreeToggle<CR>

colorscheme rose-pine
" colorscheme duskfox
" colorscheme gruvbox
" colorscheme tokyonight-night
" colorscheme moonlight
" colorscheme gruvbox-baby
