#!/usr/bin/env lua
-- Regenerates ---@field annotations in lua/lazyvim/keymaps.lua
-- from inline comments in M.default_keymaps.
-- Usage: lua tools/generate_keymap_fields.lua

local filepath = "lua/lazyvim/keymaps.lua"

-- Read the file and extract key → { value, desc } from default_keymaps
local defaults = {}
local in_table = false
for line in io.open(filepath):lines() do
  if line:match("^M%.default_keymaps = {$") then
    in_table = true
  elseif in_table and line:match("^}$") then
    in_table = false
  elseif in_table then
    -- Parse: key = "value", -- Description
    local key, value, desc = line:match('^%s*([%w_]+)%s*=%s*"(.-)"%s*,?%s*%-%-(.*)$')
    if not key then
      -- Parse without comment: key = "value",
      key, value = line:match('^%s*([%w_]+)%s*=%s*"(.-)"%s*,?%s*$')
    end
    if key and value then
      defaults[key] = { value = value, desc = desc and desc:match("^%s*(.-)%s*$") or nil }
    end
  end
end

-- Fallback descriptions for keys without inline comments
local fallback = {
  gitsigns_select_hunk = "Select hunk text object (gitsigns)",
  keywordprg = "Open keyword documentation",
  quit_buffer = "Close buffer",
  terminal_enter_normal_mode = "Exit terminal to normal mode",
  window_hydra_mode = "Switch to window hydra mode",
}

local keys = {}
for k, v in pairs(defaults) do
  local desc = v.desc or fallback[k]
  if desc then
    keys[#keys + 1] = "---@field " .. k .. " string? \"" .. desc .. " (default: " .. v.value .. ")\""
  else
    keys[#keys + 1] = "---@field " .. k .. " string? \"" .. v.value .. "\""
  end
end
table.sort(keys)

local content = {}
for line in io.open(filepath):lines() do
  content[#content + 1] = line
end

local start, finish
for i, line in ipairs(content) do
  if line:match("^%-%-%-@class LazyVimKeymaps$") then
    start = i
  end
  if start and line:match("^local keymaps = nil$") then
    finish = i
    break
  end
end

local out = {}
for i = 1, start do out[#out + 1] = content[i] end
for _, k in ipairs(keys) do out[#out + 1] = k end
for i = finish, #content do out[#out + 1] = content[i] end

io.open(filepath, "w"):write(table.concat(out, "\n") .. "\n")
print("Regenerated " .. #keys .. " @field annotations.")
