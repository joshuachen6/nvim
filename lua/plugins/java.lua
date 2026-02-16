return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- 1. Find your SDKMAN paths
      local sdkman_java_path = os.getenv("HOME") .. "/.sdkman/candidates/java/"
      local java_21_home = vim.fn.glob(sdkman_java_path .. "21*", true, true)[1]
      local java_8_home = vim.fn.glob(sdkman_java_path .. "8*", true, true)[1]

      -- 2. Set Java 21 to RUN the server
      -- The Mason 'jdtls' wrapper script automatically respects JAVA_HOME.
      -- This is safer than building the 'cmd' table manually.
      if java_21_home then
        vim.env.JAVA_HOME = java_21_home
      end

      -- 3. Configure runtimes for Java 8 development
      -- We merge your runtimes into the existing settings
      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-1.8",
                path = java_8_home,
                default = true,
              },
              {
                name = "JavaSE-21",
                path = java_21_home,
              },
            },
          },
        },
      })

      -- 4. Return the ORIGINAL opts table
      -- This ensures 'full_cmd' and other LazyVim internals stay alive.
      return opts
    end,
  },
}
