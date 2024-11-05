local k = require("lazyvim.keymaps").get_keymaps()

vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})
return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { k.kulala_prefix, "", desc = "+Rest", ft = "http" },
      {
        k.kulala_open_scratchpad,
        "<cmd>lua require('kulala').scratchpad()<cr>",
        desc = "Open scratchpad",
        ft = "http",
      },
      { k.kulala_copy_as_curl, "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL", ft = "http" },
      { k.kulala_paste_from_curl, "<cmd>lua require('kulala').from_curl()<cr>", desc = "Paste from curl", ft = "http" },
      {
        k.kulala_download_graphql_schema,
        "<cmd>lua require('kulala').download_graphql_schema()<cr>",
        desc = "Download GraphQL schema",
        ft = "http",
      },
      { k.kulala_inspect, "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect current request", ft = "http" },
      {
        k.kulala_jump_to_next_request,
        "<cmd>lua require('kulala').jump_next()<cr>",
        desc = "Jump to next request",
        ft = "http",
      },
      {
        k.kulala_jump_to_previous_request,
        "<cmd>lua require('kulala').jump_prev()<cr>",
        desc = "Jump to previous request",
        ft = "http",
      },
      { k.kulala_close, "<cmd>lua require('kulala').close()<cr>", desc = "Close window", ft = "http" },
      { k.kulala_replay, "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request", ft = "http" },
      { k.kulala_send_request, "<cmd>lua require('kulala').run()<cr>", desc = "Send the request", ft = "http" },
      { k.kulala_show_stats, "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats", ft = "http" },
      {
        k.kulala_toggle_view,
        "<cmd>lua require('kulala').toggle_view()<cr>",
        desc = "Toggle headers/body",
        ft = "http",
      },
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "http", "graphql" },
    },
  },
}
