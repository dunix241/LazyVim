local k = require("lazyvim.keymaps").get_keymaps()

return {
  {
    "saghen/blink.cmp",
    enabled = false,
    optional = true,
  },

  -- Setup nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true
      local mappings = {}
      local actions = {
        { k.cmp_scroll_docs_backward, cmp.mapping.scroll_docs(-4) },
        { k.cmp_scroll_docs_forward, cmp.mapping.scroll_docs(4) },
        { k.cmp_select_next_item, cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }) },
        { k.cmp_select_prev_item, cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }) },
        { k.cmp_complete, cmp.mapping.complete() },
        { k.cmp_confirm_auto_select, LazyVim.cmp.confirm({ select, auto_select }) },
        { k.cmp_confirm_select, LazyVim.cmp.confirm({ select = true }) },
        { k.cmp_confirm_replace, LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }) }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        { k.cmp_abort, function(fallback)
            cmp.abort()
            fallback()
          end,
        },
        { k.cmp_snippet_forward_ai_accept, function(fallback)
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end,
        },
      }

      for _, action in ipairs(actions) do
        if action[1] and action[1] ~= "" then
          mappings[action[1]] = action[2]
        end
      end

      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert(mappings),
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(entry, item)
            local icons = LazyVim.config.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end,
        },
        experimental = {
          -- only show ghost text when we show ai completions
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
        sorting = defaults.sorting,
      }
    end,
    main = "lazyvim.util.cmp",
  },

  -- snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true,
        },
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
    opts = function(_, opts)
      opts.snippet = {
        expand = function(item)
          return LazyVim.cmp.expand(item.body)
        end,
      }
      if LazyVim.has("nvim-snippets") then
        table.insert(opts.sources, { name = "snippets" })
      end
    end,
  },
}
