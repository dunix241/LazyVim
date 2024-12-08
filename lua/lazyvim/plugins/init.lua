local k = require("lazyvim.keymaps").get_keymaps()

if vim.fn.has("nvim-0.9.0") == 0 then
  vim.api.nvim_echo({
    { "LazyVim requires Neovim >= 0.9.0\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd([[quit]])
  return {}
end

require("lazyvim.config").init()

-- Terminal Mappings
local function term_nav(dir)
  ---@param self snacks.terminal
  return function(self)
    return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end

return {
  { "dunix241/lazy.nvim", branch = "feat/main" },
  {
    "dunix241/LazyVim",
    branch = "customizable-keymaps",
    priority = 10000,
    lazy = false,
    opts = {},
    cond = true,
    version = "*",
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = function()
      ---@type snacks.Config
      return {
        bigfile = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = false }, -- we set this in options.lua
        terminal = {
          win = {
            keys = {
              nav_h = { k.window_left, term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
              nav_j = { k.window_lower, term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
              nav_k = { k.window_upper, term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
              nav_l = { k.window_right, term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
            },
          },
        },
        toggle = { map = LazyVim.safe_keymap_set },
        words = { enabled = true },
      }
    end,
    -- stylua: ignore
    keys = {
      { k.snacks_toggle_scratch_buffer,  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { k.snacks_select_scratch_buffer,  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { k.snacks_notification_history, function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { k.dismiss_all_notifications, function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    },
    config = function(_, opts)
      local notify = vim.notify
      require("snacks").setup(opts)
      -- HACK: restore vim.notify after snacks setup and let noice.nvim take over
      -- this is needed to have early notifications show up in noice history
      if LazyVim.has("noice.nvim") then
        vim.notify = notify
      end
    end,
  },
}
