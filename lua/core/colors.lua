vim.opt.termguicolors = true

function set_color(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
end

set_color()

