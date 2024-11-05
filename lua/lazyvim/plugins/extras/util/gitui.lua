local k = require("lazyvim.keymaps").get_keymaps()

return {

  -- Ensure GitUI tool is installed
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "gitui" } },
    keys = {
      {
        k.lazygit_toggle_cwd,
        function()
          Snacks.terminal({ "gitui" })
        end,
        desc = "GitUi (cwd)",
      },
      {
        k.lazygit_toggle_root,
        function()
          Snacks.terminal({ "gitui" }, { cwd = LazyVim.root.get() })
        end,
        desc = "GitUi (Root Dir)",
      },
    },
    init = function()
      -- delete lazygit keymap for file history
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimKeymaps",
        once = true,
        callback = function()
          pcall(vim.keymap.del, "n", "<leader>gf")
          pcall(vim.keymap.del, "n", "<leader>gl")
        end,
      })
    end,
  },
}
