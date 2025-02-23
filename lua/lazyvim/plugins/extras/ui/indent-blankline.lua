local k = require("lazyvim.keymaps").get_keymaps()

return {
  -- disable snacks indent when indent-blankline is enabled
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = function()
      Snacks.toggle({
        name = "Indention Guides",
        get = function()
          return require("ibl.config").get_config(0).enabled
        end,
        set = function(state)
          require("ibl").setup_buffer(0, { enabled = state })
        end,
      }):map(k.indentblankline_toggle)

      return {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { show_start = false, show_end = false },
        exclude = {
          filetypes = {
            "Trouble",
            "alpha",
            "dashboard",
            "help",
            "lazy",
            "mason",
            "neo-tree",
            "notify",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "snacks_win",
            "toggleterm",
            "trouble",
          },
        },
      }
    end,
    main = "ibl",
  },
}
