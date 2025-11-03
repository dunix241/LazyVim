local k = require("lazyvim.keymaps").get_keymaps()

return {

  -- search/replace in multiple files
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = { "GrugFar", "GrugFarWithin" },
    keys = {
      {
        k.grugfar_open,
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "x" },
        desc = "Search and Replace",
      },
    },
  },

  -- Flash enhances the built-in search functionality by showing labels
  -- at the end of each match, letting you quickly jump to a specific
  -- location.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { k.flash_jump, mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { k.flash_treesitter, mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { k.flash_remote, mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { k.flash_treesitter_search, mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { k.flash_toggle, mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      -- Simulate nvim-treesitter incremental selection
      { "<c-space>", mode = { "n", "o", "x" },
        function()
          require("flash").treesitter({
            actions = {
              ["<c-space>"] = "next",
              ["<BS>"] = "prev"
            }
          }) 
        end, desc = "Treesitter Incremental Selection" },
    },
  },

  -- which-key helps you remember key bindings by showing a popup
  -- with the active keybindings of the command you started typing.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "helix",
      defaults = {},
      spec = {
        {
          mode = { "n", "x" },
          { k.tabs_prefix, group = "tabs" },
          { k.code_prefix, group = "code" },
          { k.debug_prefix, group = "debug" },
          { k.profiler_prefix, group = "profiler" },
          { k.file_find_prefix, group = "file/find" },
          { k.git_prefix, group = "git" },
          { k.hunks_prefix, group = "hunks" },
          { k.quit_session_prefix, group = "quit/session" },
          { k.search_prefix, group = "search" },
          { k.ui_prefix, group = "ui" },
          { k.diagnostics_quickfix_prefix, group = "diagnostics/quickfix" },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { k.minisurround_prefix, group = "surround" },
          { "z", group = "fold" },
          k.buffer_prefix == "" and {} or {
            k.buffer_prefix,
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          k.windows_prefix == "" and {} or {
            k.windows_prefix,
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
          -- better descriptions
          { "gx", desc = "Open with system app" },
        },
      },
    },
    keys = {
      {
        k.buffer_keymaps,
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Keymaps (which-key)",
      },
      {
        k.window_hydra_mode,
        function()
          require("which-key").show({ keys = "<c-w>", loop = true })
        end,
        desc = "Window Hydra Mode (which-key)",
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      if not vim.tbl_isempty(opts.defaults) then
        LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
        wk.register(opts.defaults)
      end
    end,
  },

  -- git signs highlights text that has changed since the list
  -- git commit, and also lets you interactively stage & unstage
  -- hunks in a commit.
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          LazyVim.keymap_set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
        end

        -- stylua: ignore start
        map("n", k.gitsigns_next_hunk, function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", k.gitsigns_prev_hunk, function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", k.gitsigns_last_hunk, function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", k.gitsigns_first_hunk, function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "x" }, k.gitsigns_stage_hunk, ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "x" }, k.gitsigns_reset_hunk, ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", k.gitsigns_stage_buffer, gs.stage_buffer, "Stage Buffer")
        map("n", k.gitsigns_undo_stage_hunk, gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", k.gitsigns_reset_buffer, gs.reset_buffer, "Reset Buffer")
        map("n", k.gitsigns_preview_hunk_inline, gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", k.gitsigns_blame_line, function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", k.gitsigns_blame_buffer, function() gs.blame() end, "Blame Buffer")
        map("n", k.gitsigns_diff_index, gs.diffthis, "Diff This")
        map("n", k.gitsigns_diff_commit, function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, k.gitsigns_select_hunk, ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "gitsigns.nvim",
    opts = function()
      Snacks.toggle({
        name = "Git Signs",
        get = function()
          return require("gitsigns.config").config.signcolumn
        end,
        set = function(state)
          require("gitsigns").toggle_signs(state)
        end,
      }):map(k.gitsigns_toggle_signs)
    end,
  },

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
    keys = {
      { k.trouble_diagnostics_toggle, "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      {
        k.trouble_diagnostics_buffer_toggle,
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      { k.trouble_symbols_toggle, "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
      {
        k.trouble_lsp_toggle,
        "<cmd>Trouble lsp toggle<cr>",
        desc = "LSP references/definitions/... (Trouble)",
      },
      { k.trouble_loclist_toggle, "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { k.trouble_qflist_toggle, "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
      {
        k.trouble_previous_trouble,
        function()
          if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous Trouble/Quickfix Item",
      },
      {
        k.trouble_next_trouble,
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next Trouble/Quickfix Item",
      },
    },
  },

  -- Finds and lists all of the TODO, HACK, BUG, etc comment
  -- in your project and loads them into a browsable list.
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    opts = {},
    -- stylua: ignore
    keys = {
      { k.todo_next_todo, function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { k.todo_prev_todo, function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { k.todo_trouble, "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { k.todo_fix_fixme_trouble, "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { k.todo_telescope, "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { k.todo_fix_fixme_telescope, "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
}
