local M = {}
local k = require("lazyvim.keymaps").get_keymaps()

function M.filter_keymaps(actions)
  local filtered = {}
  for _, action in ipairs(actions) do
    if action[1] and action[1] ~= "" then
      table.insert(filtered, action)
    end
  end
  return filtered
end

---@type LazyKeysLspSpec[]|nil
M._keys = {}

---@alias LazyKeysLspSpec LazyKeysSpec|{has?:string|string[], enabled?:fun():boolean}
---@alias LazyKeysLsp LazyKeys|{has?:string|string[], enabled?:fun():boolean}

---@deprecated
---@return LazyKeysLspSpec[]
function M.get()
  LazyVim.warn({
    'Adding LSP keymaps via `require("lazyvim.plugins.lsp.keymaps").get()` is deprecated.',
    "Please set keymaps via the `keys` field in the LSP server config.",
    [[
```lua
{
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ['*'] = {
        keys = {
          { k.lang_go_to_definition, "<cmd>lua vim.lsp.buf.definition()<CR>", has = "definition"},
        },
      },
    },
  },
}
```]],
  }, { stacktrace = true })
  vim.schedule(function()
    if #M._keys > 0 then
      M.set({}, M._keys)
      M._keys = {}
    end
  end)
  return M._keys
end

---@param filter vim.lsp.get_clients.Filter
---@param spec LazyKeysLspSpec[]
function M.set(filter, spec)
  local Keys = require("lazy.core.handler.keys")
  for _, keys in pairs(Keys.resolve(spec)) do
    ---@cast keys LazyKeysLsp
    local filters = {} ---@type vim.lsp.get_clients.Filter[]
    if keys.has then
      local methods = type(keys.has) == "string" and { keys.has } or keys.has --[[@as string[] ]]
      for _, method in ipairs(methods) do
        method = method:find("/") and method or ("textDocument/" .. method)
        filters[#filters + 1] = vim.tbl_extend("force", vim.deepcopy(filter), { method = method })
      end
    else
      filters[#filters + 1] = filter
    end

    for _, f in ipairs(filters) do
      local opts = Keys.opts(keys)
      ---@cast opts snacks.keymap.set.Opts
      opts.lsp = f
      opts.enabled = keys.enabled
      LazyVim.keymap_set(keys.mode or "n", keys.lhs, keys.rhs, opts, Snacks.keymap.set)
    end
  end
end

return M
