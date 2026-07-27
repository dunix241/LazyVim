if LazyVim.has_extra("editor.refactoring") then
  if vim.fn.has("nvim-0.12") == 0 then
    LazyVim.error("refactoring.nvim requires Neovim 0.12 or higher", { title = "refactoring.nvim" })
    return {}
  end
end

local k = require("lazyvim.keymaps").get_keymaps()

local pick = function()
  local refactoring = require("refactoring")
  if LazyVim.pick.picker.name == "telescope" then
    return require("telescope").extensions.refactoring.refactors()
  elseif LazyVim.pick.picker.name == "fzf" then
    local fzf_lua = require("fzf-lua")
    local results = refactoring.get_refactors()

    local opts = {
      fzf_opts = {},
      fzf_colors = true,
      actions = {
        ["default"] = function(selected)
          refactoring.refactor(selected[1])
        end,
      },
    }
    fzf_lua.fzf_exec(results, opts)
  else
    refactoring.select_refactor()
  end
end

return {
  { "lewis6991/async.nvim", lazy = true },

  {
    "ThePrimeagen/refactoring.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { k.refactoring_prefix, "", desc = "+refactor", mode = { "n", "x" } },
      {
        k.refactoring_refactor,
        function()
          return require("refactoring").select_refactor()
        end,
        mode = { "n", "x" },
        desc = "Select Refactor",
      },
      {
        k.refactoring_inline_variable,
        function()
          return require("refactoring").inline_var()
        end,
        mode = { "n", "x" },
        desc = "Inline Variable",
        expr = true,
      },
      {
        k.refactoring_debug_print,
        function()
          return require("refactoring.debug").print_loc({ output_location = "below" })
        end,
        desc = "Debug Print Location",
        expr = true,
      },
      {
        k.refactoring_debug_print_variable,
        function()
          return require("refactoring.debug").print_var({ output_location = "below" }) .. "iw"
        end,
        mode = { "n", "x" },
        desc = "Debug Print Variable",
        expr = true,
      },
      {
        k.refactoring_debug_cleanup,
        function()
          return require("refactoring.debug").cleanup({ restore_view = true }) .. "ag"
        end,
        desc = "Debug Cleanup",
        expr = true,
      },
      {
        k.refactoring_extract_function,
        function()
          return require("refactoring").extract_func()
        end,
        mode = { "n", "x" },
        desc = "Extract Function",
        expr = true,
      },
      {
        k.refactoring_extract_function_to_file,
        function()
          return require("refactoring").extract_func_to_file()
        end,
        mode = { "n", "x" },
        desc = "Extract Function To File",
        expr = true,
      },
      {
        k.refactoring_extract_variable,
        function()
          return require("refactoring").extract_var()
        end,
        mode = { "n", "x" },
        desc = "Extract Variable",
        expr = true,
      },
    },
    opts = {},
  },
}
