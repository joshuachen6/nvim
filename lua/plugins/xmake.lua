return {
  {
    "Mythos-404/xmake.nvim",
    version = "^3",
    lazy = true,
    event = "BufReadPost",
    config = function(_, opts)
      require("xmake").setup(opts)

      -- The plugin runs xmake non-interactively, so package install prompts
      -- can't be answered. Inject `-y` to auto-confirm them.
      local Runner = require("xmake.runner_wrapper")
      for _, key in ipairs({ "exe", "run" }) do
        local orig = Runner[key]
        Runner[key] = setmetatable({}, {
          __call = function(_, cmd, ...)
            if cmd[1] == "xmake" and cmd[2] and not vim.tbl_contains(cmd, "-y") then
              cmd = vim.list_extend({ cmd[1], cmd[2], "-y" }, cmd, 3)
            end
            return orig(cmd, ...)
          end,
          __index = orig,
        })
      end
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
}
