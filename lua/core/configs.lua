vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.encoding = "utf-8"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.optnoswapfile = true
vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 7
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/bash"

-- Mouse
vim.opt.mouse = ""
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true

-- XkbSwitch
vim.g.XkbSwitchEnabled = 1

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Shorter messages
vim.opt.shortmess:append("c")

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.colorcolumn = "79"

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"css", "tsx", "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "tex"},
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ",
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

-- Disable LSP semantic highlight
vim.api.nvim_set_hl(0, '@lsp.type.function', {})
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
