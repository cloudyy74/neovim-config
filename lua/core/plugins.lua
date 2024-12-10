local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git" local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
        lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
            {"\nPress any key to exit..."} }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
local map = vim.keymap.set
local fn = vim.fn

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        }
    }, {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" }
    },
    opts = function()
      local cmp = require("cmp")
      local conf = {
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
        },
        snippet = {
          expand = function(args)
            -- Comes from vsnip
            fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- None of this made sense to me when first looking into this since there
          -- is no vim docs, but you can't have select = true here _unless_ you are
          -- also using the snippet stuff. So keep in mind that if you remove
          -- snippets you need to remove this select
          ["<CR>"] = cmp.mapping.confirm({ select = true })
        })
      }
      return conf
    end
    }, {"williamboman/mason.nvim"},
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}, 
    {'mhartington/oceanic-next'}, {'glepnir/zephyr-nvim'},
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    {'windwp/nvim-autopairs'}, {'terrortylor/nvim-comment'}, {'pocco81/auto-save.nvim'},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
    {'hrsh7th/cmp-nvim-lsp-signature-help'}, {
        'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lsp-progress').setup() end
    }, {'hrsh7th/vim-vsnip'}, {'hrsh7th/vim-vsnip-integ'},
    {
        'itchyny/lightline.vim',
    }, {'akinsho/toggleterm.nvim', version = "*", config = true},

{
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
}, {'lervag/vimtex',
     lazy = false,
     init = function()
         vim.g.tex_flavor = "latex"
         vim.g.vimtex_view_general_viewer = "okular"
     end

}, {'lyokha/vim-xkbswitch'}, {'talha-akram/noctis.nvim'}, {'sainnhe/sonokai'},
{
    "mfussenegger/nvim-dap"
},
{
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap"
    },
    opts = {
        handlers = {},
    }
},
{
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
   end
},
{
    "nvim-neotest/nvim-nio"
},
-- {
--     'sheerun/vim-polyglot',
--     lazy = false,
-- },
{
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate"
}
});
