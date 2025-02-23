local k = require("lazyvim.keymaps").get_keymaps()

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

  -- Snacks utils
  {
    "snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
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
    },
    -- stylua: ignore
    keys = {
      { k.toggle_scratch_buffer,  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { k.select_scratch_buffer,  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { k.profiler_scratch_buffer, function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Buffer" },
    },
  },

  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
      { k.persistence_restore_session, function() require("persistence").load() end, desc = "Restore Session" },
      { k.persistence_select_session, function() require("persistence").select() end,desc = "Select Session" },
      { k.persistence_restore_last_session, function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { k.persistence_skip_current_session, function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
}
