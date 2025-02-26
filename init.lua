local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})
Plug('https://github.com/rafi/awesome-vim-colorschemes')
Plug('https://github.com/vim-airline/vim-airline')
Plug('https://github.com/terryma/vim-multiple-cursors')

vim.call('plug#end')

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.statuscolumn = "%s %l %r "
vim.o.autoindent = true
vim.o.tabstop = 6
vim.o.shiftwidth = 6
vim.o.smarttab = true
vim.o.mouse = 'c'
vim.o.signcolumn = 'yes'
vim.o.encoding = "utf-8"
vim.g.rust_recommended_style = false

-- extensions
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)')
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)')

vim.keymap.set('n', 'gd', '<cmd>vsplit<cr> <Plug>(coc-definition)')
vim.keymap.set('n', 'gt', '<Plug>(coc-definition)')
vim.keymap.set('n', 'gy', '<Plug>(coc-typedefinition)')
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation')
vim.keymap.set('n', 'gr', '<Plug>(coc-references')

vim.keymap.set('n', 'gr', '<cmd>:call ShowDocumentation()<cr>')

vim.keymap.set('n', 'rn', '<Plug>(coc-rename)')

vim.keymap.set("i", "<ENTER>", [[coc#pum#visible() ? coc#pum#confirm() : "<enter>"]], opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

local opts = {silent = true, nowait = true}
vim.keymap.set("n", "fi", "<Plug>(coc-fix-current)", opts)

require'nvim-treesitter.configs'.setup {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  }
}

vim.cmd('colorscheme dogrun')
vim.cmd("call coc#rpc#stop()")
