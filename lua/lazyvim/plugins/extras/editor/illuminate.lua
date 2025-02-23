-- Automatically highlights other instances of the word under your cursor.
-- This works with LSP, Treesitter, and regexp matching to find the other
-- instances.
local k = require("lazyvim.keymaps").get_keymaps()

return {
  -- disable snacks words
  { "snacks.nvim", opts = { words = { enabled = false } } },

  {
    "RRethy/vim-illuminate",
    event = "LazyFile",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      Snacks.toggle({
        name = "Illuminate",
        get = function()
          return not require("illuminate.engine").is_paused()
        end,
        set = function(enabled)
          local m = require("illuminate")
          if enabled then
            m.resume()
          else
            m.pause()
          end
        end,
      }):map("<leader>ux")

      local function map(key, dir, buffer)
        LazyVim.keymap_set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map(k.illuminate_next, "next")
      map(k.illuminate_prev, "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map(k.illuminate_next, "next", buffer)
          map(k.illuminate_prev, "prev", buffer)
        end,
      })
    end,
    keys = {
      { k.illuminate_next, desc = "Next Reference" },
      { k.illuminate_prev, desc = "Prev Reference" },
    },
  },
}
