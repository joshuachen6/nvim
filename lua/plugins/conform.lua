-- Extend the formatters to include clang-format
return {
  "stevearc/conform.nvim",
  opts = {
    -- Define formatters and override their arguments
    formatters = {
      clang_format = {
        exe = "clang-format", -- Specify clang-format as the executable
        args = { "-style=file:" .. vim.fn.expand("~/.config/nvim/.clang-format") }, -- Use the new method to specify the .clang-format file
      },
    },
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
  },
}
