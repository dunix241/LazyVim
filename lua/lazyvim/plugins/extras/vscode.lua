if not vim.g.vscode then
  return {}
end

local enabled = {
  "LazyVim",
  "dial.nvim",
  "flit.nvim",
  "lazy.nvim",
  "leap.nvim",
  "mini.ai",
  "mini.comment",
  "mini.move",
  "mini.pairs",
  "mini.surround",
  "nvim-treesitter",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "snacks.nvim",
  "ts-comments.nvim",
  "vim-repeat",
  "yanky.nvim",
}

local Config = require("lazy.core.config")
local vscode = require("vscode")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin)
  return vim.tbl_contains(enabled, plugin.name) or plugin.vscode
end
vim.g.snacks_animate = false

local map = LazyVim.keymap_set
local k = require("lazyvim.keymaps").get_keymaps()

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    -- VSCode-specific keymaps for search and navigation
    map("n", k.vscode_find, "<cmd>Find<cr>")
    map("n", k.vscode_find_in_files, function()
      vscode.call("workbench.action.findInFiles")
    end)
    map("n", k.vscode_go_to_symbol, function()
      vscode.call("workbench.action.gotoSymbol")
    end)

    -- Toggle VS Code integrated terminal
    for _, lhs in ipairs({ "<leader>ft", "<leader>fT", "<c-/>" }) do
      map("n", lhs, function()
        vscode.call("workbench.action.terminal.toggleTerminal")
      end)
    end

    -- Navigate VSCode tabs like lazyvim buffers
    map("n", "<S-h>", function()
      vscode.call("workbench.action.previousEditor")
    end)
    map("n", "<S-l>", function()
      vscode.call("workbench.action.nextEditor")
    end)
  end,
})

return {
  {
    "snacks.nvim",
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
    },
  },
  {
    "dunix241/LazyVim",
    config = function(_, opts)
      opts = opts or {}
      -- disable the colorscheme
      opts.colorscheme = function() end
      require("lazyvim").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
}
