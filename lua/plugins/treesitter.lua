return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "matlab" }, -- Auto-downloads the grammar
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
}
