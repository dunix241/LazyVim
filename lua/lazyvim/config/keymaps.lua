-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = LazyVim.safe_keymap_set
local k = require("lazyvim.keymaps").get_keymaps()

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", k.window_left, "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", k.window_lower, "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", k.window_upper, "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", k.window_right, "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", k.size_increase_height, "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", k.size_decrease_height, "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", k.size_decrease_width, "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", k.size_increase_width, "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", k.move_down, "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", k.move_up, "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", k.move_down, "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", k.move_up, "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", k.move_down, ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", k.move_up, ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", k.buf_prev, "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", k.buf_next, "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", k.buf_prev_alt, "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", k.buf_next_alt, "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", k.buf_switch_to_other, "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", k.buf_switch_to_other_alt, "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", k.buf_delete, function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", k.buf_delete_other, function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", k.buf_delete_and_close, "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  k.clear_search_diff_update_and_redraw,
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, k.save_file, "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", k.keywordprg, "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- commenting
map("n", k.comment_add_below, "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", k.comment_add_above, "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", k.lazy, "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", k.new_file, "<cmd>enew<cr>", { desc = "New File" })

-- location list
map("n", k.location_list, function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
map("n", k.quickfix_list, function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", k.previous_quickfix, vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", k.next_quickfix, vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
map({ "n", "x" }, k.format, function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", k.diagnostic_line_diagnostics, vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", k.diagnostic_next_diagnostic, diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", k.diagnostic_prev_diagnostic, diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", k.diagnostic_next_error, diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", k.diagnostic_prev_error, diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", k.diagnostic_next_warning, diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", k.diagnostic_prev_warning, diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.format.snacks_toggle():map(k.toggle_auto_format_buffer)
LazyVim.format.snacks_toggle(true):map(k.toggle_auto_format_global)
Snacks.toggle.option("spell", { name = "Spelling" }):map(k.toggle_spelling)
Snacks.toggle.option("wrap", { name = "Wrap" }):map(k.toggle_wrap)
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map(k.toggle_relativenumber)
Snacks.toggle.diagnostics():map(k.toggle_diagnostics)
Snacks.toggle.line_number():map(k.toggle_number)
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map(k.toggle_conceallevel)
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map(k.toggle_show_tabline)
Snacks.toggle.treesitter():map(k.toggle_treesitter)
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map(k.toggle_background)
Snacks.toggle.dim():map(k.toggle_dim)
Snacks.toggle.animate():map(k.toggle_animate)
Snacks.toggle.indent():map(k.toggle_indent)
Snacks.toggle.scroll():map(k.toggle_scroll)
Snacks.toggle.profiler():map(k.toggle_profiler)
Snacks.toggle.profiler_highlights():map(k.toggle_profiler_highlights)

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map(k.toggle_inlay_hints)
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", k.lazygit_toggle_root, function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
  map("n", k.lazygit_toggle_cwd, function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
end

map("n", k.lazygit_git_log_cwd, function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
map("n", k.lazygit_blame_line, function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map("n", k.lazygit_current_file_history, function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
map("n", k.lazygit_git_log_root, function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
map({ "n", "x" }, k.lazygit_browse, function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
map({"n", "x" }, k.lazygit_browse_copy, function()
  Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- quit
map("n", k.quit_all, "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", k.inspect_pos, vim.show_pos, { desc = "Inspect Pos" })
map("n", k.inspect_tree, function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })

-- LazyVim Changelog
map("n", k.lazyvim_changelog, function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
map("n", k.terminal_toggle_cwd, function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", k.terminal_toggle_root, function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, k.terminal_hide_terminal,function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, k.terminal_hide_terminal_alt,function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })

-- windows
map("n", k.window_split_window_below, "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", k.window_split_window_right, "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", k.window_delete_window, "<C-W>c", { desc = "Delete Window", remap = true })
Snacks.toggle.zoom():map(k.window_toggle_maximize_window):map(k.window_toggle_maximize_window_alt)
Snacks.toggle.zen():map(k.window_toggle_zen)

-- tabs
map("n", k.tab_last_tab, "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", k.tab_close_other_tabs, "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", k.tab_first_tab, "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", k.tab_new_tab, "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", k.tab_next_tab, "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", k.tab_close_tab, "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", k.tab_previous_tab, "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- lua
map({"n", "x"}, k.snacks_debug_run, function() Snacks.debug.run() end, { desc = "Run Lua", ft = "lua" })
