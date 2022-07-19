local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'chrisbra/csv.vim'
    use 'christoomey/vim-tmux-navigator'
    use 'junegunn/fzf.vim'
    use {
            'junnplus/nvim-lsp-setup',
            requires = {
                'neovim/nvim-lspconfig',
                'williamboman/nvim-lsp-installer',
            }
        }
    use {
            'phpactor/phpactor',
            ft = 'php',
            tag = '*',
            run = 'composer install --no-dev -o'
        }
    use 'moll/vim-bbye'
    use 'simeji/winresizer'
    use 'simnalamburt/vim-mundo'
end)

-- use the system clipboard
vim.o.clipboard = "unnamedplus"

-- no swap file
vim.o.swapfile = false

-- save undo-trees in files
vim.opt.undofile = true
vim.opt.undodir = "$XDG_CONFIG_HOME/nvim/undo"
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- set line number
vim.opt.number = true
-- vim.wo.relativenumber = true

-- use 4 spaces instead of tab
-- copy indent from current line when starting a new line
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- allow unsaved hidden buffers
vim.opt.hidden = true

-- set leader to space
vim.api.nvim_set_keymap("n", " ", "<nop>", {noremap = true})
vim.g.mapleader = " "

-- match tmux h split
vim.api.nvim_set_keymap("n", "<C-w>h", "<C-w>s", {noremap = true})

-- configure csv

vim.cmd("augroup filetype_csv")
vim.cmd("autocmd!")
vim.cmd("autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!")
vim.cmd("autocmd BufWritePre *.csv :%UnArrangeColumn")
vim.cmd("augroup END")

-- configure winresizer
vim.g['winresizer_start_key'] = "<leader>w"

-- setup native lsp
require('nvim-lsp-setup').setup({
    -- nvim-lsp-installer
    -- https://github.com/williamboman/nvim-lsp-installer#configuration
    installer = {},
    -- Default mappings
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gt = 'lua vim.lsp.buf.type_definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- K = 'lua vim.lsp.buf.hover()',
    -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
    -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
    -- [']d'] = 'lua vim.diagnostic.goto_next()',
    default_mappings = true,
    -- Custom mappings, will overwrite the default mappings for the same key
    -- Example mappings for telescope pickers:
    -- gd = 'lua require"telescope.builtin".lsp_definitions()',
    -- gi = 'lua require"telescope.builtin".lsp_implementations()',
    -- gr = 'lua require"telescope.builtin".lsp_references()',
    mappings = {},
    -- Global on_attach
    on_attach = function(client, bufnr)
        require('nvim-lsp-setup.utils').format_on_save(client)
    end,
    -- Global capabilities
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- Configuration of LSP servers 
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -- pylsp = {},
        -- rust_analyzer = {
        --     settings = {
        --         ['rust-analyzer'] = {
        --             cargo = {
        --                 loadOutDirsFromCheck = true,
        --             },
        --             procMacro = {
        --                 enable = true,
        --             },
        --         },
        --     },
        -- },
    },
})
