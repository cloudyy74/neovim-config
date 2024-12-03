vim.opt.termguicolors = true

function set_color(color)
    color = color or "catppuccin-latte"
    vim.cmd.colorscheme(color)
end

set_color()

