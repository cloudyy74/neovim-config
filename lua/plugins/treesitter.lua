require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "make", "java", "kotlin", "sql",
                       "lua", "haskell", "html", "css",  
                       "go",  "python", "cpp", "c", "dockerfile", "latex",
                       "tsx", "javascript", "rust", "scala" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
