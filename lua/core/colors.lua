vim.opt.termguicolors = true

function set_color(color)
    color = color or "retrobox"
    vim.cmd.colorscheme(color)
end

set_color()

