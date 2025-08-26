return {
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
      function()
        local bufferline = require("catppuccin.groups.integrations.bufferline")
        bufferline.get = bufferline.get or bufferline.get_theme
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
