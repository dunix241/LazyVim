local k = require("lazyvim.keymaps").get_keymaps()

return {
  "danymat/neogen",
  dependencies = LazyVim.has("mini.snippets") and { "mini.snippets" } or {},
  cmd = "Neogen",
  keys = {
    {
      k.neogen_generate_annotation,
      function()
        require("neogen").generate()
      end,
      desc = "Generate Annotations (Neogen)",
    },
  },
  opts = function(_, opts)
    if opts.snippet_engine ~= nil then
      return
    end

    local map = {
      ["LuaSnip"] = "luasnip",
      ["mini.snippets"] = "mini",
      ["nvim-snippy"] = "snippy",
      ["vim-vsnip"] = "vsnip",
    }

    for plugin, engine in pairs(map) do
      if LazyVim.has(plugin) then
        opts.snippet_engine = engine
        return
      end
    end

    if vim.snippet then
      opts.snippet_engine = "nvim"
    end
  end,
}
