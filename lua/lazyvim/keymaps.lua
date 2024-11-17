local M = {}

---@class LazyVimKeymaps
local keymaps = nil

-- Comments are intentionally left in for keymap context acknowledgment
-- and easier navigation with '%' (matching parenthesis jump)

---@class LazyVimKeymaps
M.default_keymaps = {
  -- global = {
  --   window = {
  window_left = "<C-h>",
  window_lower = "<C-j>",
  window_upper = "<C-k>",
  window_right = "<C-l>",
  -- },
  -- resize_window = {
  size_increase_height = "<C-Up>",
  size_decrease_height = "<C-Down>",
  size_decrease_width = "<C-Left>",
  size_increase_width = "<C-Right>",
  -- },
  -- move_lines = {
  move_down = "<A-j>",
  move_up = "<A-k>",
  -- },
  -- buffers = {
  buf_prev = "<S-h>",
  buf_next = "<S-l>",
  buf_prev_alt = "[b",
  buf_next_alt = "]b",
  buf_switch_to_other = "<leader>bb",
  buf_switch_to_other_alt = "<leader>`",
  buf_delete = "<leader>bd",
  buf_delete_other = "<leader>bo",
  buf_delete_and_close = "<leader>bD",
  -- },
  clear_search_diff_update_and_redraw = "<leader>ur",
  save_file = "<C-s>",
  keywordprg = "<leader>K",
  -- commenting = {
  comment_add_below = "gco",
  comment_add_above = "gcO",
  -- },
  lazy = "<leader>l",
  new_file = "<leader>fn",
  location_list = "<leader>xl",
  quickfix_list = "<leader>xq",
  previous_quickfix = "[q",
  next_quickfix = "]q",
  format = "<leader>cf",
  -- diagnostics = {
  diagnostic_line_diagnostics = "<leader>cd",
  diagnostic_next_diagnostic = "]d",
  diagnostic_prev_diagnostic = "[d",
  diagnostic_next_error = "]e",
  diagnostic_prev_error = "[e",
  diagnostic_next_warning = "]w",
  diagnostic_prev_warning = "[w",
  -- },
  -- toggle_options = {
  toggle_auto_format_buffer = "<leader>uf",
  toggle_auto_format_global = "<leader>uF",
  toggle_spelling = "<leader>us",
  toggle_wrap = "<leader>uw",
  toggle_relativenumber = "<leader>uL",
  toggle_diagnostics = "<leader>ud",
  toggle_number = "<leader>ul",
  toggle_conceallevel = "<leader>uc",
  toggle_treesitter = "<leader>uT",
  toggle_background = "<leader>ub",
  toggle_inlay_hints = "<leader>uh",
  -- },
  -- lazygit = {
  lazygit_toggle_root = "<leader>gg",
  lazygit_toggle_cwd = "<leader>gG",
  lazygit_blame_line = "<leader>gb",
  lazygit_browse = "<leader>gB",
  lazygit_current_file_history = "<leader>gf",
  lazygit_git_log_root = "<leader>gl",
  lazygit_git_log_cwd = "<leader>gL",
  -- },
  quit_all = "<leader>qq",
  inspect_pos = "<leader>ui",
  inspect_tree = "<leader>uI",
  lazyvim_changelog = "<leader>L",
  -- terminal = {
  --   floating_terminal = {
  terminal_toggle_root = "<leader>ft",
  terminal_toggle_cwd = "<leader>fT",
  terminal_toggle_root_alt_1 = "<c-/>",
  terminal_toggle_root_alt_2 = "<c-_>",
  -- },
  terminal_enter_normal_mode = "<esc><esc>",
  terminal_hide_terminal = "<C-/>",
  terminal_hide_terminal_alt = "<c-_>",
  -- },
  -- windows = {
  window_prefix = "<leader>w",
  window_split_window_below = "<leader>-",
  window_split_window_right = "<leader>|",
  window_delete_window = "<leader>wd",
  window_toggle_maximize_window = "<leader>wm",
  -- },
  -- tabs = {
  tab_last_tab = "<leader><tab>l",
  tab_close_other_tabs = "<leader><tab>o",
  tab_first_tab = "<leader><tab>f",
  tab_new_tab = "<leader><tab><tab>",
  tab_next_tab = "<leader><tab>]",
  tab_close_tab = "<leader><tab>d",
  tab_previous_tab = "<leader><tab>[",
  --   },
  -- },
  quit_buffer = "q",
  -- coding = {
  --   cmp = {
  cmp_scroll_docs_backward = "<C-b>",
  cmp_scroll_docs_forward = "<C-f>",
  cmp_select_next_item = "<C-n>",
  cmp_select_prev_item = "<C-p>",
  cmp_complete = "<C-Space>",
  cmp_confirm_auto_select = "<CR>",
  cmp_confirm_select = "<C-y>",
  cmp_confirm_replace = "<S-CR>",
  cmp_abort = "<C-CR>",
  cmp_snippet_forward_ai_accept = "<tab>",
  -- snippet = {
  snippet_jump_next = "<Tab>",
  snippet_jump_prev = "<S-Tab>",
  --     },
  --   },
  -- },
  -- editor = {
  -- neo_tree = {
  neotree_toggle_root = "<leader>fe",
  neotree_toggle_cwd = "<leader>fE",
  neotree_toggle_root_alt = "<leader>e",
  neotree_toggle_cwd_alt = "<leader>E",
  neotree_toggle_git_status = "<leader>ge",
  neotree_toggle_buffers = "<leader>be",
  -- window = {
  neotree_win_open = "l",
  neotree_win_close_node = "h",
  neotree_win_copy_path_to_clipboard = "Y",
  neotree_win_open_with_system_application = "O",
  neotree_win_toggle_preview = "P",
  --   },
  -- },
  -- grug_far = {
  grugfar_open = "<leader>sr",
  -- },
  -- flash = {
  flash_jump = "s",
  flash_treesitter = "S",
  flash_remote = "r",
  flash_treesitter_search = "R",
  flash_toggle = "<c-s>",
  -- },
  -- which_key = {
  --   group = {
  tabs_prefix = "<leader><tab>",
  code_prefix = "<leader>c",
  file_find_prefix = "<leader>f",
  git_prefix = "<leader>g",
  hunks_prefix = "<leader>gh",
  quit_session_prefix = "<leader>q",
  search_prefix = "<leader>s",
  ui_prefix = "<leader>u",
  diagnostics_quickfix_prefix = "<leader>x",
  buffer_prefix = "<leader>b",
  windows_prefix = "<leader>w",
  -- },
  buffer_keymaps = "<leader>?",
  window_hydra_mode = "<c-w><space>",
  -- },
  -- gitsigns = {
  gitsigns_next_hunk = "]h",
  gitsigns_prev_hunk = "[h",
  gitsigns_last_hunk = "]H",
  gitsigns_first_hunk = "[H",
  gitsigns_stage_hunk = "<leader>ghs",
  gitsigns_reset_hunk = "<leader>ghr",
  gitsigns_stage_buffer = "<leader>ghS",
  gitsigns_undo_stage_hunk = "<leader>ghu",
  gitsigns_reset_buffer = "<leader>ghR",
  gitsigns_preview_hunk_inline = "<leader>ghp",
  gitsigns_blame_line = "<leader>ghb",
  gitsigns_blame_buffer = "<leader>ghB",
  gitsigns_diff_index = "<leader>ghd",
  gitsigns_diff_commit = "<leader>ghD",
  gitsigns_select_hunk = "ih",
  -- },
  -- trouble = {
  trouble_diagnostics_toggle = "<leader>xx",
  trouble_diagnostics_buffer_toggle = "<leader>xX",
  trouble_symbols_toggle = "<leader>cs",
  trouble_lsp_toggle = "<leader>cS",
  trouble_loclist_toggle = "<leader>xL",
  trouble_qflist_toggle = "<leader>xQ",
  trouble_previous_trouble = "[q",
  trouble_next_trouble = "]q",
  -- },
  -- todo_comments = {
  todo_next_todo = "]t",
  todo_prev_todo = "[t",
  todo_trouble = "<leader>xt",
  todo_fix_fixme_trouble = "<leader>xT",
  todo_telescope = "<leader>st",
  todo_fix_fixme_telescope = "<leader>sT",
  --   },
  -- },
  -- formatting = {
  --   conform = {
  conform_format = "<leader>cF",
  --   },
  -- },
  -- treesitter = {
  ts_increment_selection = "<C-Space>",
  ts_decrement_selection = "<BS>",
  -- textobjects = {
  -- goto_next_start = {
  ts_ns_function_outer = "]f",
  ts_ns_class_outer = "]c",
  ts_ns_parameter_inner = "]a",
  -- },
  -- goto_next_end = {
  ts_ne_function_outer = "]F",
  ts_ne_class_outer = "]C",
  ts_ne_parameter_inner = "]A",
  -- },
  -- goto_previous_start = {
  ts_ps_function_outer = "[f",
  ts_ps_class_outer = "[c",
  ts_ps_parameter_inner = "[a",
  -- },
  -- goto_previous_end = {
  ts_pe_function_outer = "[F",
  ts_pe_class_outer = "[C",
  ts_pe_parameter_inner = "[A",
  --     },
  --   },
  -- },
  -- ui = {
  -- nvim_notify/notifier = {
  dismiss_all_notifications = "<leader>un",
  -- },
  -- bufferline = {
  bufferline_toggle_pin = "<leader>bp",
  bufferline_delete_non_pinned_buffers = "<leader>bP",
  bufferline_delete_buffers_to_the_right = "<leader>br",
  bufferline_delete_buffers_to_the_left = "<leader>bl",
  bufferline_prev_buffer = "<S-h>",
  bufferline_next_buffer = "<S-l>",
  bufferline_prev_buffer_alt = "[b",
  bufferline_next_buffer_alt = "]b",
  bufferline_move_buffer_prev = "[B",
  bufferline_move_buffer_next = "]B",
  -- },
  -- indent_blankline = {
  indentblankline_toggle = "<leader>ug",
  -- },
  -- noice = {
  noice_prefix = "<leader>sn",
  noice_redirect_cmdline = "<S-Enter>",
  noice_last_message = "<leader>snl",
  noice_history = "<leader>snh",
  noice_all = "<leader>sna",
  noice_dismiss = "<leader>snd",
  noice_pick = "<leader>snt",
  noice_scroll_forward = "<c-f>",
  noice_scroll_backward = "<c-b>",
  -- },
  -- dashboard = {
  dashboard_find_file = "f",
  dashboard_new_file = "n",
  dashboard_recent_files = "r",
  dashboard_find_text = "g",
  dashboard_config = "c",
  dashboard_restore_session = "s",
  dashboard_lazy_extras = "x",
  dashboard_lazy = "l",
  dashboard_quit = "q",
  dashboard_projects = "p",
  -- },
  -- },
  -- util = {
  -- persistence = {
  persistence_restore_session = "<leader>qs",
  persistence_select_session = "<leader>qS",
  persistence_restore_last_session = "<leader>ql",
  persistence_skip_current_session = "<leader>qd",
  -- },
  -- mini_pairs = {
  minipairs_toggle = "<leader>up",
  -- },
  -- },
  -- extras = {
  --   coding = {
  --     copilot_chat = {
  copilotchat_submit_prompt = "<c-s>",
  copilotchat_prefix = "<leader>a",
  copilotchat_toggle = "<leader>aa",
  copilotchat_clear = "<leader>ax",
  copilotchat_quick_chat = "<leader>aq",
  copilotchat_diagnostic_help = "<leader>ad",
  copilotchat_prompt_actions = "<leader>ap",
  -- },
  -- mini_surround = {
  minisurround_prefix = "gs",
  minisurround_add = "gsa",
  minisurround_delete = "gsd",
  minisurround_find = "gsf",
  minisurround_find_left = "gsF",
  minisurround_highlight = "gsh",
  minisurround_replace = "gsr",
  minisurround_update_n_lines = "gsn",
  -- },
  -- neogen = {
  neogen_generate_annotation = "<leader>cn",
  -- },
  -- yanky = {
  yanky_yank_history = "<leader>p",
  yanky_yank = "y",
  yanky_put_text_after_cursor = "p",
  yanky_put_text_before_cursor = "P",
  yanky_put_text_after_selection = "gp",
  yanky_put_text_before_selection = "gP",
  yanky_cycle_forward_yank_history = "[y",
  yanky_cycle_backward_yank_history = "]y",
  yanky_put_indent_after_cursor_linewise = "]p",
  yanky_put_indent_before_cursor_linewise = "[p",
  yanky_put_indent_after_cursor_linewise_alt = "]P",
  yanky_put_indent_before_cursor_linewise_alt = "[P",
  yanky_put_and_indent_right = ">p",
  yanky_put_and_indent_left = "<p",
  yanky_put_before_indent_right = ">P",
  yanky_put_before_indent_left = "<P",
  yanky_put_after_filter = "=p",
  yanky_put_before_filter = "=P",
  --   },
  -- },
  -- dap = {
  --   core = {
  --     nvim_dap = {
  dap_prefix = "<leader>d",
  dap_breakpoint_condition = "<leader>dB",
  dap_toggle_breakpoint = "<leader>db",
  dap_continue = "<leader>dc",
  dap_run_with_args = "<leader>da",
  dap_run_to_cursor = "<leader>dC",
  dap_go_to_line_no_execute = "<leader>dg",
  dap_step_into = "<leader>di",
  dap_down = "<leader>dj",
  dap_up = "<leader>dk",
  dap_run_last = "<leader>dl",
  dap_step_out = "<leader>do",
  dap_step_over = "<leader>dO",
  dap_pause = "<leader>dp",
  dap_toggle_repl = "<leader>dr",
  dap_session = "<leader>ds",
  dap_terminate = "<leader>dt",
  dap_widgets = "<leader>dw",
  -- },
  -- nvim_dap_ui = {
  dap_toggle_dap_ui = "<leader>du",
  dap_eval_dap_ui = "<leader>de",
  --     },
  --   },
  -- },
  -- editor = {
  --   aerial = {
  aerial_toggle = "<leader>cs",
  -- },
  -- dial = {
  dial_increment = "<C-a>",
  dial_decrement = "<C-x>",
  dial_increment_g = "g<C-a>",
  dial_decrement_g = "g<C-x>",
  -- },
  -- harpoon2 = {
  harpoon_file = "<leader>H",
  harpoon_quick_menu = "<leader>h",
  harpoon_to_file_prefix = "<leader>",
  -- },
  -- vim_illuminate = {
  illuminate_next = "]]",
  illuminate_prev = "[[",
  -- },
  -- inc_rename = {
  increname_rename = "<leader>cr",
  -- },
  -- leap = {
  leap_next = "s",
  leap_prev = "S",
  leap_from_windows = "gs",
  -- },
  -- mini_diff = {
  minidiff_toggle_overlay = "<leader>go",
  -- },
  -- mini_files = {
  minifiles_open_current_file_dir = "<leader>fm",
  minifiles_open_cwd = "<leader>fM",
  -- },
  -- outline = {
  outline_up_and_jump = "<up>",
  outline_down_and_jump = "<down>",
  -- },
  -- overseer = {
  overseer_prefix = "<leader>o",
  overseer_toggle = "<leader>ow",
  overseer_quick_action = "<leader>oq",
  overseer_run = "<leader>oo",
  overseer_info = "<leader>oi",
  overseer_build = "<leader>ob",
  overseer_task_action = "<leader>ot",
  overseer_clear_cache = "<leader>oc",
  -- },
  -- refactoring = {
  refactoring_prefix = "<leader>r",
  refactoring_refactor = "<leader>rs",
  refactoring_inline_variable = "<leader>ri",
  refactoring_extract_block = "<leader>rb",
  refactoring_extract_block_to_file = "<leader>rf",
  refactoring_debug_print = "<leader>rP",
  refactoring_debug_print_variable = "<leader>rp",
  refactoring_debug_cleanup = "<leader>rc",
  refactoring_extract_function = "<leader>rf",
  refactoring_extract_function_to_file = "<leader>rF",
  refactoring_extract_variable = "<leader>rx",
  -- },
  -- picker = {
  picker_switch_buffer = "<leader>,",
  picker_grep_root = "<leader>/",
  picker_command_history = "<leader>:",
  picker_find_files_root = "<leader><space>",
  picker_find_buffers = "<leader>fb",
  picker_find_config_file = "<leader>fc",
  picker_find_files_root_alt = "<leader>ff",
  picker_find_files_cwd = "<leader>fF",
  picker_find_git_files = "<leader>fg",
  picker_find_recent_files = "<leader>fr",
  picker_find_recent_files_cwd = "<leader>fR",
  picker_find_projects = "<leader>fp",
  picker_git_commits = "<leader>gc",
  picker_git_status = "<leader>gs",
  picker_search_registers = '<leader>s"',
  picker_search_autocommands = "<leader>sa",
  picker_search_buffer = "<leader>sb",
  picker_search_command_history = "<leader>sc",
  picker_search_commands = "<leader>sC",
  picker_search_document_diagnostics = "<leader>sd",
  picker_search_workspace_diagnostics = "<leader>sD",
  picker_search_grep_root = "<leader>sg",
  picker_search_grep_cwd = "<leader>sG",
  picker_search_help_pages = "<leader>sh",
  picker_search_highlight_groups = "<leader>sH",
  picker_search_jumplist = "<leader>sj",
  picker_search_keymaps = "<leader>sk",
  picker_search_loclist = "<leader>sl",
  picker_search_man_pages = "<leader>sM",
  picker_search_marks = "<leader>sm",
  picker_search_options = "<leader>so",
  picker_search_resume = "<leader>sR",
  picker_search_quickfix = "<leader>sq",
  picker_search_word_root = "<leader>sw",
  picker_search_word_cwd = "<leader>sW",
  picker_search_selection_root = "<leader>sw",
  picker_search_selection_cwd = "<leader>sW",
  picker_colorscheme_preview = "<leader>uC",
  picker_go_to_symbol = "<leader>ss",
  picker_go_to_symbol_workspace = "<leader>sS",
  -- actions = {
  picker_open_with_trouble = "<c-t>",
  picker_open_with_trouble_alt = "<a-t>",
  picker_find_files_no_ignore = "<a-i>",
  picker_find_files_with_hidden = "<a-h>",
  picker_cycle_history_next = "<C-Down>",
  picker_cycle_history_prev = "<C-Up>",
  picker_preview_scrolling_down = "<C-f>",
  picker_preview_scrolling_up = "<C-b>",
  picker_close = "q",
  -- },
  -- flash = {
  flash_normal = "s",
  flash_insert = "<c-s>",
  --     },
  --   },
  -- },
  -- test = {
  --   core = {
  test_prefix = "<leader>t",
  test_run_file = "<leader>tt",
  test_run_all_test_files = "<leader>tT",
  test_run_nearest = "<leader>tr",
  test_run_last = "<leader>tl",
  test_toggle_summary = "<leader>ts",
  test_show_output = "<leader>to",
  test_toggle_output_panel = "<leader>tO",
  test_stop = "<leader>tS",
  test_toggle_watch = "<leader>tw",
  test_debug_nearest = "<leader>td",
  --   },
  -- },
  -- lang = {
  lang_lsp_info = "<leader>cl",
  lang_mason = "<leader>cm",
  lang_go_to_definition = "gd",
  lang_go_to_declaration = "gD",
  lang_references = "gr",
  lang_file_references = "gR",
  lang_go_to_implementation = "gI",
  lang_go_to_type_definition = "gy",
  lang_go_to_super = "gs",
  lang_go_to_subjects = "gS",
  lang_hover = "K",
  lang_signature_help = "gK",
  lang_insert_signature_help = "<c-k>",
  lang_code_action = "<leader>ca",
  lang_run_codelens = "<leader>cc",
  lang_refresh_codelens = "<leader>cC",
  lang_rename_file = "<leader>cR",
  lang_rename = "<leader>cr",
  lang_source_action = "<leader>cA",
  lang_next_reference = "]]",
  lang_prev_reference = "[[",
  lang_cycle_next_reference = "<a-n>",
  lang_cycle_prev_reference = "<a-p>",
  lang_organize_imports = "<leader>co",
  lang_add_missing_imports = "<leader>cM",
  lang_remove_unused_imports = "<leader>cu",
  lang_fix_all_diagnostics = "<leader>cD",
  lang_select_lang_version = "<leader>cV",
  -- extract = {
  lang_extract_prefix = "<leader>cx",
  lang_extract_method = "<leader>cxm",
  lang_extract_variable = "<leader>cxv",
  lang_extract_constant = "<leader>cxc",
  -- },
  -- ansible = {
  ansible_run_playbook_role = "<leader>ta",
  -- },
  -- clangd = {
  clangd_switch_source_header = "<leader>cs",
  -- },
  -- clojure = {
  clojure_jump_prev_evaluation_output = "[c",
  clojure_jump_next_evaluation_output = "]c",
  -- },
  -- elixir = {
  elixir_to_pipe = "<leader>cp",
  elixir_from_pipe = "<leader>cP",
  -- },
  -- lean = {
  lean_abbreviations_leader = "\\",
  -- },
  -- markdown = {
  markdown_preview_toggle = "<leader>cp",
  markdown_render_markdown_toggle = "<leader>um",
  -- },
  -- python = {
  python_debug_method = "<leader>dPt",
  python_debug_class = "<leader>dPc",
  python_select_virtual_env = "<leader>cv",
  -- },
  -- r = {
  r_send = "<Enter>",
  r_send_all = "<localleader>a",
  r_send_between_marks = "<localleader>b",
  r_send_chunks = "<localleader>c",
  r_send_functions = "<localleader>f",
  r_send_goto = "<localleader>g",
  r_send_install = "<localleader>i",
  r_send_knit = "<localleader>k",
  r_send_paragraph = "<localleader>p",
  r_send_quarto = "<localleader>q",
  r_send_general = "<localleader>r",
  r_send_split_or_send = "<localleader>s",
  r_send_terminal = "<localleader>t",
  r_send_view = "<localleader>v",
  -- },
  -- rust = {
  rust_code_action = "<leader>cR",
  rust_debuggables = "<leader>dr",
  rust_show_crate_documentation = "K",
  -- },
  -- scala = {
  scala_metals_commands = "<leader>me",
  scala_metals_compile_cascade = "<leader>mc",
  scala_metals_hover_worksheet = "<leader>mh",
  -- },
  -- sql = {
  sql_toggle_dbui = "<leader>D",
  -- },
  -- tex = {
  tex_prefix = "<localLeader>l",
  tex_vimtex_docs = "<Leader>K",
  -- },
  -- typescript = {
  typescript_go_to_source_definition = "gD",
  --   },
  -- },
  -- ui = {
  --   edgy = {
  edgy_toggle = "<leader>ue",
  edgy_select_window = "<leader>uE",
  -- },
  -- mini_animate = {
  minianimae_toggle = "<leader>ua",
  -- },
  -- treesitter_context = {
  tscontext_toggle = "<leader>ut",
  --   },
  -- },
  -- util = {
  --   chezmoi = {
  chezmoi_pick_chezmoi = "<leader>sz",
  chezmoi_select = "<CR>",
  chezmoi_key = "c",
  -- },
  -- octo = {
  octo_issue_list = "<leader>gi",
  octo_issue_search = "<leader>gI",
  octo_pr_list = "<leader>gp",
  octo_pr_search = "<leader>gP",
  octo_repo_list = "<leader>gr",
  octo_search = "<leader>gS",
  octo_assignee = "<leader>a",
  octo_comment_code = "<leader>c",
  octo_label = "<leader>l",
  octo_issue = "<leader>i",
  octo_react = "<leader>r",
  octo_pr = "<leader>p",
  octo_review = "<leader>v",
  octo_insert_at = "@",
  octo_insert_hashtag = "#",
  -- },
  -- rest = {
  --   kulala = {
  kulala_prefix = "<leader>R",
  kulala_open_scratchpad = "<leader>Rb",
  kulala_copy_as_curl = "<leader>Rc",
  kulala_paste_from_curl = "<leader>RC",
  kulala_download_graphql_schema = "<leader>Rg",
  kulala_inspect = "<leader>Ri",
  kulala_jump_to_next_request = "<leader>Rn",
  kulala_jump_to_previous_request = "<leader>Rp",
  kulala_close = "<leader>Rq",
  kulala_replay = "<leader>Rr",
  kulala_send_request = "<leader>Rs",
  kulala_show_stats = "<leader>RS",
  kulala_toggle_view = "<leader>Rt",
  --   },
  -- },
  -- },
  -- vscode = {
  vscode_find = "<leader><space>",
  vscode_find_in_files = "<leader>/",
  vscode_go_to_symbol = "<leader>ss",
  --   },
  -- },
}

local function flattenTable(inputTable)
  local outputTable = {}
  local stack = { inputTable }

  while #stack > 0 do
    local currentTable = table.remove(stack)
    for key, value in pairs(currentTable) do
      if type(value) == "table" then
        table.insert(stack, value)
      else
        outputTable[key] = value
      end
    end
  end

  return outputTable
end

---@return LazyVimKeymaps
M.get_keymaps = function()
  if keymaps == nil then
    keymaps =
      vim.tbl_deep_extend("force", {}, flattenTable(M.default_keymaps), flattenTable(vim.g.lazyvim_keymaps or {}))
    vim.g.lazyvim_keymaps = keymaps -- update global for later retrieval
  end
  return keymaps
end

return M
