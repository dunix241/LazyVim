local M = {}

---@class LazyVimKeymaps
---@field aerial_toggle string? "Aerial (Symbols) (default: <leader>cs)"
---@field ansible_run_playbook_role string? "Run playbook/role (Ansible) (default: <leader>ta)"
---@field buf_delete string? "Delete Buffer (default: <leader>bd)"
---@field buf_delete_and_close string? "Delete Buffer and Window (default: <leader>bD)"
---@field buf_delete_invisible string? "Delete Invisible Buffers (default: <leader>bi)"
---@field buf_delete_other string? "Delete Other Buffers (default: <leader>bo)"
---@field buf_next string? "Next Buffer (default: <S-l>)"
---@field buf_next_alt string? "Next Buffer (default: ]b)"
---@field buf_prev string? "Prev Buffer (default: <S-h>)"
---@field buf_prev_alt string? "Prev Buffer (default: [b)"
---@field buf_switch_to_other string? "Switch to Other Buffer (default: <leader>bb)"
---@field buf_switch_to_other_alt string? "Switch to Other Buffer (default: <leader>`)"
---@field buffer_keymaps string? "Buffer Keymaps (default: <leader>?)"
---@field buffer_prefix string? "Buffer (default: <leader>b)"
---@field bufferline_delete_buffers_to_the_left string? "Delete Buffers to the Left (default: <leader>bl)"
---@field bufferline_delete_buffers_to_the_right string? "Delete Buffers to the Right (default: <leader>br)"
---@field bufferline_delete_non_pinned_buffers string? "Delete Non-Pinned Buffers (default: <leader>bP)"
---@field bufferline_move_buffer_next string? "Move Buffer Next (default: ]B)"
---@field bufferline_move_buffer_prev string? "Move Buffer Prev (default: [B)"
---@field bufferline_next_buffer string? "Next Buffer (default: <S-l>)"
---@field bufferline_next_buffer_alt string? "Next Buffer (default: ]b)"
---@field bufferline_pick string? "Pick Buffer (default: <leader>bj)"
---@field bufferline_prev_buffer string? "Prev Buffer (default: <S-h>)"
---@field bufferline_prev_buffer_alt string? "Prev Buffer (default: [b)"
---@field bufferline_toggle_pin string? "Toggle Pin (default: <leader>bp)"
---@field chezmoi_key string? "Chezmoi (default: c)"
---@field chezmoi_pick_chezmoi string? "Pick Chezmoi (default: <leader>sz)"
---@field chezmoi_select string? "Select (Chezmoi) (default: <CR>)"
---@field clangd_switch_source_header string? "Switch Source/Header (C/C++) (default: <leader>ch)"
---@field clear_search_diff_update_and_redraw string? "Clear Search/Redraw (default: <leader>ur)"
---@field clojure_jump_next_evaluation_output string? "Next Evaluation Output (Clojure) (default: ]c)"
---@field clojure_jump_prev_evaluation_output string? "Prev Evaluation Output (Clojure) (default: [c)"
---@field cmp_abort string? "Abort (cmp) (default: <C-CR>)"
---@field cmp_complete string? "Complete (cmp) (default: <C-Space>)"
---@field cmp_confirm_auto_select string? "Confirm (auto-select) (default: <CR>)"
---@field cmp_confirm_replace string? "Confirm (replace) (default: <S-CR>)"
---@field cmp_confirm_select string? "Confirm (select) (default: <C-y>)"
---@field cmp_scroll_docs_backward string? "Scroll Docs Backward (default: <C-b>)"
---@field cmp_scroll_docs_forward string? "Scroll Docs Forward (default: <C-f>)"
---@field cmp_select_and_accept string? "Select & Accept (default: <C-y>)"
---@field cmp_select_next_item string? "Select Next Item (default: <C-n>)"
---@field cmp_select_prev_item string? "Select Prev Item (default: <C-p>)"
---@field cmp_snippet_forward_ai_accept string? "Snippet Forward / Accept AI (default: <tab>)"
---@field code_prefix string? "Code (default: <leader>c)"
---@field comment_add_above string? "Add Comment Above (default: gcO)"
---@field comment_add_below string? "Add Comment Below (default: gco)"
---@field conform_format string? "Format Buffer (Conform) (default: <leader>cF)"
---@field copilotchat_clear string? "Clear (CopilotChat) (default: <leader>ax)"
---@field copilotchat_diagnostic_help string? "Diagnostic Help (CopilotChat) (default: <leader>ad)"
---@field copilotchat_prefix string? "CopilotChat (default: <leader>a)"
---@field copilotchat_prompt_actions string? "Prompt Actions (CopilotChat) (default: <leader>ap)"
---@field copilotchat_quick_chat string? "Quick Chat (CopilotChat) (default: <leader>aq)"
---@field copilotchat_submit_prompt string? "Submit Prompt (CopilotChat) (default: <c-s>)"
---@field copilotchat_toggle string? "Toggle (CopilotChat) (default: <leader>aa)"
---@field dap_breakpoint_condition string? "Breakpoint Condition (default: <leader>dB)"
---@field dap_continue string? "Run/Continue (default: <leader>dc)"
---@field dap_down string? "Down (DAP) (default: <leader>dj)"
---@field dap_eval_dap_ui string? "Eval (DAP UI) (default: <leader>de)"
---@field dap_go_to_line_no_execute string? "Go to Line (No Execute) (default: <leader>dg)"
---@field dap_pause string? "Pause (default: <leader>dP)"
---@field dap_prefix string? "Debug (default: <leader>d)"
---@field dap_run_last string? "Run Last (default: <leader>dl)"
---@field dap_run_to_cursor string? "Run to Cursor (default: <leader>dC)"
---@field dap_run_with_args string? "Run with Args (default: <leader>da)"
---@field dap_session string? "Session (default: <leader>ds)"
---@field dap_step_into string? "Step Into (default: <leader>di)"
---@field dap_step_out string? "Step Out (default: <leader>do)"
---@field dap_step_over string? "Step Over (default: <leader>dO)"
---@field dap_terminate string? "Terminate (default: <leader>dt)"
---@field dap_toggle_breakpoint string? "Toggle Breakpoint (default: <leader>db)"
---@field dap_toggle_dap_ui string? "Dap UI (default: <leader>du)"
---@field dap_toggle_repl string? "Toggle REPL (default: <leader>dr)"
---@field dap_up string? "Up (DAP) (default: <leader>dk)"
---@field dap_widgets string? "Widgets (default: <leader>dw)"
---@field dashboard_config string? "Config (default: c)"
---@field dashboard_find_file string? "Find File (default: f)"
---@field dashboard_find_text string? "Find Text (default: g)"
---@field dashboard_lazy string? "Lazy (default: l)"
---@field dashboard_lazy_extras string? "Lazy Extras (default: x)"
---@field dashboard_new_file string? "New File (default: n)"
---@field dashboard_projects string? "Projects (default: P)"
---@field dashboard_quit string? "Quit (default: q)"
---@field dashboard_recent_files string? "Recent Files (default: r)"
---@field dashboard_restore_session string? "Restore Session (default: s)"
---@field debug_prefix string? "Debug (default: <leader>d)"
---@field diagnostic_line_diagnostics string? "Line Diagnostics (default: <leader>cd)"
---@field diagnostic_next_diagnostic string? "Next Diagnostic (default: ]d)"
---@field diagnostic_next_error string? "Next Error (default: ]e)"
---@field diagnostic_next_warning string? "Next Warning (default: ]w)"
---@field diagnostic_prev_diagnostic string? "Prev Diagnostic (default: [d)"
---@field diagnostic_prev_error string? "Prev Error (default: [e)"
---@field diagnostic_prev_warning string? "Prev Warning (default: [w)"
---@field diagnostics_quickfix_prefix string? "Diagnostics/Quickfix (default: <leader>x)"
---@field dial_decrement string? "Decrement (default: <C-x>)"
---@field dial_decrement_g string? "Decrement (g) (default: g<C-x>)"
---@field dial_increment string? "Increment (default: <C-a>)"
---@field dial_increment_g string? "Increment (g) (default: g<C-a>)"
---@field dismiss_all_notifications string? "Dismiss All Notifications (default: <leader>un)"
---@field edgy_select_window string? "Edgy Select Window (default: <leader>uE)"
---@field edgy_toggle string? "Toggle Edgy (default: <leader>ue)"
---@field elixir_from_pipe string? "From Pipe (Elixir) (default: <leader>cP)"
---@field elixir_to_pipe string? "To Pipe (Elixir) (default: <leader>cp)"
---@field file_find_prefix string? "File find (default: <leader>f)"
---@field flash_insert string? "Flash (Insert) (default: <c-s>)"
---@field flash_jump string? "Flash (default: s)"
---@field flash_normal string? "Flash (Normal) (default: s)"
---@field flash_remote string? "Remote Flash (default: r)"
---@field flash_toggle string? "Toggle Flash Search (default: <c-s>)"
---@field flash_treesitter string? "Flash Treesitter (default: S)"
---@field flash_treesitter_search string? "Treesitter Search (default: R)"
---@field format string? "Format (default: <leader>cf)"
---@field git_prefix string? "Git (default: <leader>g)"
---@field gitsigns_blame_buffer string? "Blame Buffer (default: <leader>ghB)"
---@field gitsigns_blame_line string? "Blame Line (default: <leader>ghb)"
---@field gitsigns_diff_commit string? "Diff Commit (default: <leader>ghD)"
---@field gitsigns_diff_index string? "Diff Index (default: <leader>ghd)"
---@field gitsigns_first_hunk string? "First Hunk (default: [H)"
---@field gitsigns_last_hunk string? "Last Hunk (default: ]H)"
---@field gitsigns_next_hunk string? "Next Hunk (default: ]h)"
---@field gitsigns_prev_hunk string? "Prev Hunk (default: [h)"
---@field gitsigns_preview_hunk_inline string? "Preview Hunk Inline (default: <leader>ghp)"
---@field gitsigns_reset_buffer string? "Reset Buffer (default: <leader>ghR)"
---@field gitsigns_reset_hunk string? "Reset Hunk (default: <leader>ghr)"
---@field gitsigns_select_hunk string? "Select hunk text object (gitsigns) (default: ih)"
---@field gitsigns_stage_buffer string? "Stage Buffer (default: <leader>ghS)"
---@field gitsigns_stage_hunk string? "Stage Hunk (default: <leader>ghs)"
---@field gitsigns_toggle_signs string? "Toggle Signs (default: <leader>uG)"
---@field gitsigns_undo_stage_hunk string? "Undo Stage Hunk (default: <leader>ghu)"
---@field grugfar_open string? "Search & Replace (Grug Far) (default: <leader>sr)"
---@field harpoon_file string? "Harpoon File (default: <leader>H)"
---@field harpoon_quick_menu string? "Harpoon Quick Menu (default: <leader>h)"
---@field harpoon_to_file_prefix string? "Harpoon to file (default: <leader>)"
---@field hunks_prefix string? "Hunks (default: <leader>gh)"
---@field illuminate_next string? "Next Reference (default: ]])"
---@field illuminate_prev string? "Prev Reference (default: [[)"
---@field increname_rename string? "Incremental Rename (default: <leader>cr)"
---@field indentblankline_toggle string? "Toggle Indent Lines (default: <leader>ug)"
---@field inspect_pos string? "Inspect Pos (default: <leader>ui)"
---@field inspect_tree string? "Inspect Tree (default: <leader>uI)"
---@field keywordprg string? "Keywordprg (default: <leader>K)"
---@field kulala_close string? "Close (Kulala) (default: <leader>Rq)"
---@field kulala_copy_as_curl string? "Copy as cURL (default: <leader>Rc)"
---@field kulala_download_graphql_schema string? "Download GraphQL Schema (default: <leader>Rg)"
---@field kulala_inspect string? "Inspect (Kulala) (default: <leader>Ri)"
---@field kulala_jump_to_next_request string? "Next Request (Kulala) (default: <leader>Rn)"
---@field kulala_jump_to_previous_request string? "Prev Request (Kulala) (default: <leader>Rp)"
---@field kulala_open_scratchpad string? "Open Scratchpad (Kulala) (default: <leader>Rb)"
---@field kulala_paste_from_curl string? "Paste from curl (default: <leader>RC)"
---@field kulala_prefix string? "Kulala (default: <leader>R)"
---@field kulala_replay string? "Replay (Kulala) (default: <leader>Rr)"
---@field kulala_send_request string? "Send Request (Kulala) (default: <leader>Rs)"
---@field kulala_set_env string? "Set Environment (Kulala) (default: <leader>Re)"
---@field kulala_show_stats string? "Show Stats (Kulala) (default: <leader>RS)"
---@field kulala_toggle_view string? "Toggle Headers/Body (default: <leader>Rt)"
---@field lang_add_missing_imports string? "Add Missing Imports (default: <leader>cM)"
---@field lang_code_action string? "Code Action (default: <leader>ca)"
---@field lang_cycle_next_reference string? "Cycle Next Reference (default: <a-n>)"
---@field lang_cycle_prev_reference string? "Cycle Prev Reference (default: <a-p>)"
---@field lang_extract_constant string? "Extract Constant (default: <leader>cxc)"
---@field lang_extract_method string? "Extract Method (default: <leader>cxm)"
---@field lang_extract_prefix string? "Lang extract (default: <leader>cx)"
---@field lang_extract_variable string? "Extract Variable (default: <leader>cxv)"
---@field lang_file_references string? "File References (default: gR)"
---@field lang_fix_all_diagnostics string? "Fix All Diagnostics (default: <leader>cD)"
---@field lang_go_to_declaration string? "Goto Declaration (default: gD)"
---@field lang_go_to_definition string? "Goto Definition (default: gd)"
---@field lang_go_to_implementation string? "Goto Implementation (default: gI)"
---@field lang_go_to_subjects string? "Goto Subjects (default: gS)"
---@field lang_go_to_super string? "Goto Super (default: gs)"
---@field lang_go_to_type_definition string? "Goto T[y]pe Definition (default: gy)"
---@field lang_hover string? "Hover (default: K)"
---@field lang_insert_signature_help string? "Signature Help (default: <c-k>)"
---@field lang_lsp_info string? "Lsp Info (default: <leader>cl)"
---@field lang_mason string? "Mason (default: <leader>cm)"
---@field lang_next_reference string? "Next Reference (default: ]])"
---@field lang_organize_imports string? "Organize Imports (default: <leader>co)"
---@field lang_prev_reference string? "Prev Reference (default: [[)"
---@field lang_references string? "References (default: gr)"
---@field lang_refresh_codelens string? "Refresh CodeLens (default: <leader>cC)"
---@field lang_remove_unused_imports string? "Remove Unused Imports (default: <leader>cu)"
---@field lang_rename string? "Rename (default: <leader>cr)"
---@field lang_rename_file string? "Rename File (default: <leader>cR)"
---@field lang_run_codelens string? "Run CodeLens (default: <leader>cc)"
---@field lang_select_lang_version string? "Select Language Version (default: <leader>cV)"
---@field lang_signature_help string? "Signature Help (default: gK)"
---@field lang_source_action string? "Source Action (default: <leader>cA)"
---@field lazy string? "Lazy (default: <leader>l)"
---@field lazygit_blame_line string? "Git Blame Line (default: <leader>gb)"
---@field lazygit_browse string? "Git Browse (open) (default: <leader>gB)"
---@field lazygit_browse_copy string? "Git Browse (copy) (default: <leader>gY)"
---@field lazygit_current_file_history string? "Git Current File History (default: <leader>gf)"
---@field lazygit_git_log_cwd string? "Git Log (cwd) (default: <leader>gL)"
---@field lazygit_git_log_root string? "Git Log (default: <leader>gl)"
---@field lazygit_toggle_cwd string? "Lazygit (cwd) (default: <leader>gG)"
---@field lazygit_toggle_root string? "Lazygit (Root Dir) (default: <leader>gg)"
---@field lazyvim_changelog string? "LazyVim Changelog (default: <leader>L)"
---@field lean_abbreviations_leader string? "Lean Abbreviations (default: \\)"
---@field leap_from_windows string? "Leap from Windows (default: gs)"
---@field leap_next string? "Leap Forward to (default: s)"
---@field leap_prev string? "Leap Backward to (default: S)"
---@field location_list string? "Location List (default: <leader>xl)"
---@field markdown_preview_toggle string? "Toggle Preview (Markdown) (default: <leader>cp)"
---@field markdown_render_markdown_toggle string? "Toggle Render (Markdown) (default: <leader>um)"
---@field minianimae_toggle string? "Minianimae toggle (Mini) (default: <leader>ua)"
---@field minidiff_toggle_overlay string? "Toggle Diff Overlay (default: <leader>go)"
---@field minifiles_open_current_file_dir string? "Open Current File Dir (default: <leader>fm)"
---@field minifiles_open_cwd string? "Open CWD (default: <leader>fM)"
---@field minipairs_toggle string? "Toggle Auto Pairs (default: <leader>up)"
---@field minisurround_add string? "Add Surrounding (default: gsa)"
---@field minisurround_delete string? "Delete Surrounding (default: gsd)"
---@field minisurround_find string? "Find Surrounding (default: gsf)"
---@field minisurround_find_left string? "Find Surrounding Left (default: gsF)"
---@field minisurround_highlight string? "Highlight Surrounding (default: gsh)"
---@field minisurround_prefix string? "Minisurround (default: gs)"
---@field minisurround_replace string? "Replace Surrounding (default: gsr)"
---@field minisurround_update_n_lines string? "Update Surrounding N Lines (default: gsn)"
---@field move_down string? "Move Down (default: <A-j>)"
---@field move_up string? "Move Up (default: <A-k>)"
---@field neogen_generate_annotation string? "Generate Annotation (default: <leader>cn)"
---@field neotree_toggle_buffers string? "Buffers (Neo-tree) (default: <leader>be)"
---@field neotree_toggle_cwd string? "Explorer (cwd) (default: <leader>fE)"
---@field neotree_toggle_cwd_alt string? "Explorer (cwd) (default: <leader>E)"
---@field neotree_toggle_git_status string? "Git Status (Neo-tree) (default: <leader>ge)"
---@field neotree_toggle_root string? "Explorer (Root Dir) (default: <leader>fe)"
---@field neotree_toggle_root_alt string? "Explorer (Root Dir) (default: <leader>e)"
---@field neotree_win_close_node string? "Close Node (Neo-tree) (default: h)"
---@field neotree_win_copy_path_to_clipboard string? "Copy Path (Neo-tree) (default: Y)"
---@field neotree_win_open string? "Open (Neo-tree) (default: l)"
---@field neotree_win_open_with_system_application string? "Open With (Neo-tree) (default: O)"
---@field neotree_win_toggle_preview string? "Toggle Preview (Neo-tree) (default: P)"
---@field new_file string? "New File (default: <leader>fn)"
---@field next_quickfix string? "Next Quickfix (default: ]q)"
---@field noice_all string? "Noice All (default: <leader>sna)"
---@field noice_dismiss string? "Dismiss All (default: <leader>snd)"
---@field noice_history string? "Noice History (default: <leader>snh)"
---@field noice_last_message string? "Noice Last Message (default: <leader>snl)"
---@field noice_pick string? "Noice Picker (default: <leader>snt)"
---@field noice_prefix string? "Noice (default: <leader>sn)"
---@field noice_redirect_cmdline string? "Redirect Cmdline (default: <S-Enter>)"
---@field noice_scroll_backward string? "Scroll Backward (default: <c-b>)"
---@field noice_scroll_forward string? "Scroll Forward (default: <c-f>)"
---@field notification_history string? "Notification History (default: <leader>n)"
---@field octo_assignee string? "Assignee (Octo) (default: <localleader>a)"
---@field octo_comment_code string? "Comment/Code (Octo) (default: <localleader>c)"
---@field octo_go_to_issue string? "Goto Issue (Octo) (default: <localleader>g)"
---@field octo_insert_at string? "Insert @ (Octo) (default: @)"
---@field octo_insert_hashtag string? "Insert # (Octo) (default: #)"
---@field octo_issue string? "Issue (Octo) (default: <localleader>i)"
---@field octo_issue_list string? "List Issues (Octo) (default: <leader>gi)"
---@field octo_issue_search string? "Search Issues (Octo) (default: <leader>gI)"
---@field octo_label string? "Label (Octo) (default: <localleader>l)"
---@field octo_pr string? "PR (Octo) (default: <localleader>p)"
---@field octo_pr_list string? "List PRs (Octo) (default: <leader>gp)"
---@field octo_pr_search string? "Search PRs (Octo) (default: <leader>gP)"
---@field octo_react string? "React (Octo) (default: <localleader>r)"
---@field octo_rebase string? "Rebase (Octo) (default: <localleader>pr)"
---@field octo_repo_list string? "List Repos (Octo) (default: <leader>gr)"
---@field octo_review string? "Review (Octo) (default: <localleader>v)"
---@field octo_search string? "Search (Octo) (default: <leader>gS)"
---@field octo_squash string? "Squash (Octo) (default: <localleader>ps)"
---@field outline_down_and_jump string? "Down and Jump (Outline) (default: <down>)"
---@field outline_up_and_jump string? "Up and Jump (Outline) (default: <up>)"
---@field overseer_prefix string? "Overseer (default: <leader>o)"
---@field overseer_run string? "Run task (default: <leader>oo)"
---@field overseer_task_action string? "Task action (default: <leader>ot)"
---@field overseer_toggle string? "Task list (default: <leader>ow)"
---@field persistence_restore_last_session string? "Restore Last Session (default: <leader>ql)"
---@field persistence_restore_session string? "Restore Session (default: <leader>qs)"
---@field persistence_select_session string? "Select Session (default: <leader>qS)"
---@field persistence_skip_current_session string? "Skip Current Session (default: <leader>qd)"
---@field picker_close string? "Close Picker (default: q)"
---@field picker_colorscheme_preview string? "Colorscheme Preview (default: <leader>uC)"
---@field picker_command_history string? "Command History (default: <leader>:)"
---@field picker_cycle_history_next string? "Cycle History Next (default: <C-Down>)"
---@field picker_cycle_history_prev string? "Cycle History Prev (default: <C-Up>)"
---@field picker_find_buffers string? "Buffers (default: <leader>fb)"
---@field picker_find_buffers_all string? "Buffers (all) (default: <leader>fB)"
---@field picker_find_config_file string? "Find Config File (default: <leader>fc)"
---@field picker_find_files_cwd string? "Find Files (cwd) (default: <leader>fF)"
---@field picker_find_files_no_ignore string? "Find Files (no ignore) (default: <a-i>)"
---@field picker_find_files_root string? "Find Files (Root Dir) (default: <leader><space>)"
---@field picker_find_files_root_alt string? "Find Files (Root Dir) (default: <leader>ff)"
---@field picker_find_files_with_hidden string? "Find Files (hidden) (default: <a-h>)"
---@field picker_find_git_files string? "Find Files (git-files) (default: <leader>fg)"
---@field picker_find_projects string? "Projects (default: <leader>fp)"
---@field picker_find_recent_files string? "Recent (default: <leader>fr)"
---@field picker_find_recent_files_cwd string? "Recent (cwd) (default: <leader>fR)"
---@field picker_git_commits string? "Commits (default: <leader>gc)"
---@field picker_git_commits_alt string? "Commits (default: <leader>gl)"
---@field picker_git_diff string? "Git Diff (files) (default: <leader>gd)"
---@field picker_git_stash string? "Git Stash (default: <leader>gS)"
---@field picker_git_status string? "Status (default: <leader>gs)"
---@field picker_go_to_symbol string? "Go to Symbol (default: <leader>ss)"
---@field picker_go_to_symbol_workspace string? "Go to Symbol (Workspace) (default: <leader>sS)"
---@field picker_grep_root string? "Grep (Root Dir) (default: <leader>/)"
---@field picker_open_with_trouble string? "Open with Trouble (default: <c-t>)"
---@field picker_open_with_trouble_alt string? "Open with Trouble (Alt) (default: <a-t>)"
---@field picker_preview_scrolling_down string? "Preview Scroll Down (default: <C-f>)"
---@field picker_preview_scrolling_up string? "Preview Scroll Up (default: <C-b>)"
---@field picker_search_autocommands string? "Auto Commands (default: <leader>sa)"
---@field picker_search_buffer string? "Buffer Lines (default: <leader>sb)"
---@field picker_search_command_history string? "Command History (default: <leader>sc)"
---@field picker_search_commands string? "Commands (default: <leader>sC)"
---@field picker_search_document_diagnostics string? "Document Diagnostics (default: <leader>sd)"
---@field picker_search_grep_cwd string? "Grep (cwd) (default: <leader>sG)"
---@field picker_search_grep_root string? "Grep (Root Dir) (default: <leader>sg)"
---@field picker_search_help_pages string? "Help Pages (default: <leader>sh)"
---@field picker_search_highlight_groups string? "Highlight Groups (default: <leader>sH)"
---@field picker_search_history string? "Search History (default: <leader>s/)"
---@field picker_search_jumplist string? "Jumplist (default: <leader>sj)"
---@field picker_search_keymaps string? "Key Maps (default: <leader>sk)"
---@field picker_search_loclist string? "Location List (default: <leader>sl)"
---@field picker_search_man_pages string? "Man Pages (default: <leader>sM)"
---@field picker_search_marks string? "Marks (default: <leader>sm)"
---@field picker_search_options string? "Options (default: <leader>so)"
---@field picker_search_quickfix string? "Quickfix List (default: <leader>sq)"
---@field picker_search_resume string? "Resume (default: <leader>sR)"
---@field picker_search_selection_cwd string? "Selection (cwd) (default: <leader>sW)"
---@field picker_search_selection_root string? "Selection (Root Dir) (default: <leader>sw)"
---@field picker_search_word_cwd string? "Word (cwd) (default: <leader>sW)"
---@field picker_search_word_root string? "Word (Root Dir) (default: <leader>sw)"
---@field picker_search_workspace_diagnostics string? "Workspace Diagnostics (default: <leader>sD)"
---@field picker_switch_buffer string? "Switch Buffer (default: <leader>,)"
---@field previous_quickfix string? "Previous Quickfix (default: [q)"
---@field profiler_prefix string? "Profiler (default: <leader>dp)"
---@field python_debug_class string? "Debug Class (Python) (default: <leader>dPc)"
---@field python_debug_method string? "Debug Method (Python) (default: <leader>dPt)"
---@field python_select_virtual_env string? "Select VirtualEnv (default: <leader>cv)"
---@field quickfix_list string? "Quickfix List (default: <leader>xq)"
---@field quit_all string? "Quit All (default: <leader>qq)"
---@field quit_buffer string? "Close buffer (default: q)"
---@field quit_session_prefix string? "Quit session (default: <leader>q)"
---@field r_send string? "Send (R) (default: <Enter>)"
---@field r_send_all string? "Send All (R) (default: <localleader>a)"
---@field r_send_between_marks string? "Send Between Marks (R) (default: <localleader>b)"
---@field r_send_chunks string? "Send Chunks (R) (default: <localleader>c)"
---@field r_send_functions string? "Send Functions (R) (default: <localleader>f)"
---@field r_send_general string? "Send General (R) (default: <localleader>r)"
---@field r_send_goto string? "Goto (R) (default: <localleader>g)"
---@field r_send_install string? "Install (R) (default: <localleader>i)"
---@field r_send_knit string? "Knit (R) (default: <localleader>k)"
---@field r_send_paragraph string? "Send Paragraph (R) (default: <localleader>p)"
---@field r_send_quarto string? "Send Quarto (R) (default: <localleader>q)"
---@field r_send_split_or_send string? "Split or Send (R) (default: <localleader>s)"
---@field r_send_terminal string? "Terminal (R) (default: <localleader>t)"
---@field r_send_view string? "View (R) (default: <localleader>v)"
---@field refactoring_debug_cleanup string? "Debug Cleanup (default: <leader>rc)"
---@field refactoring_debug_print string? "Debug Print (default: <leader>rP)"
---@field refactoring_debug_print_variable string? "Debug Print Variable (default: <leader>rp)"
---@field refactoring_extract_function string? "Extract Function (default: <leader>rf)"
---@field refactoring_extract_function_to_file string? "Extract Function to File (default: <leader>rF)"
---@field refactoring_extract_variable string? "Extract Variable (default: <leader>rx)"
---@field refactoring_inline_variable string? "Inline Variable (default: <leader>ri)"
---@field refactoring_prefix string? "Refactoring (default: <leader>r)"
---@field refactoring_refactor string? "Refactor (default: <leader>rs)"
---@field rust_code_action string? "Code Action (Rust) (default: <leader>cR)"
---@field rust_debuggables string? "Debuggables (Rust) (default: <leader>dr)"
---@field rust_show_crate_documentation string? "Show Crate Docs (Rust) (default: K)"
---@field save_file string? "Save File (default: <C-s>)"
---@field scala_metals_commands string? "Metals Commands (Scala) (default: <leader>me)"
---@field scala_metals_compile_cascade string? "Compile Cascade (Scala) (default: <leader>mc)"
---@field scala_metals_hover_worksheet string? "Hover Worksheet (Scala) (default: <leader>mh)"
---@field search_prefix string? "Search (default: <leader>s)"
---@field size_decrease_height string? "Decrease Height (default: <C-Down>)"
---@field size_decrease_width string? "Decrease Width (default: <C-Left>)"
---@field size_increase_height string? "Increase Height (default: <C-Up>)"
---@field size_increase_width string? "Increase Width (default: <C-Right>)"
---@field snacks_debug_run string? "Run Lua (default: <localleader>r)"
---@field snacks_profiler_scratch_buffer string? "Profiler Scratch Buffer (default: <leader>dps)"
---@field snacks_select_scratch_buffer string? "Select Scratch Buffer (default: <leader>S)"
---@field snacks_toggle_scratch_buffer string? "Toggle Scratch Buffer (default: <leader>.)"
---@field snippet_jump_next string? "Jump Next Snippet (default: <Tab>)"
---@field snippet_jump_prev string? "Jump Prev Snippet (default: <S-Tab>)"
---@field sql_toggle_dbui string? "Toggle DBUI (default: <leader>D)"
---@field tab_close_other_tabs string? "Close Other Tabs (default: <leader><tab>o)"
---@field tab_close_tab string? "Close Tab (default: <leader><tab>d)"
---@field tab_first_tab string? "First Tab (default: <leader><tab>f)"
---@field tab_last_tab string? "Last Tab (default: <leader><tab>l)"
---@field tab_new_tab string? "New Tab (default: <leader><tab><tab>)"
---@field tab_next_tab string? "Next Tab (default: <leader><tab>])"
---@field tab_previous_tab string? "Previous Tab (default: <leader><tab>[)"
---@field tabs_prefix string? "Tabs (default: <leader><tab>)"
---@field terminal_enter_normal_mode string? "Exit terminal to normal mode (default: <esc><esc>)"
---@field terminal_hide_terminal string? "Hide Terminal (default: <C-/>)"
---@field terminal_hide_terminal_alt string? "Hide Terminal (default: <c-_>)"
---@field terminal_toggle_cwd string? "Terminal (cwd) (default: <leader>fT)"
---@field terminal_toggle_root string? "Terminal (Root Dir) (default: <leader>ft)"
---@field terminal_toggle_root_alt_1 string? "Terminal (Root Dir) (default: <c-/>)"
---@field terminal_toggle_root_alt_2 string? "Terminal (Root Dir) (default: <c-_>)"
---@field test_attach string? "Attach to Test (Neotest) (default: <leader>ta)"
---@field test_debug_nearest string? "Debug Nearest (default: <leader>td)"
---@field test_prefix string? "Test (default: <leader>t)"
---@field test_run_all_test_files string? "Run All Test Files (Neotest) (default: <leader>tT)"
---@field test_run_file string? "Run File (Neotest) (default: <leader>tt)"
---@field test_run_last string? "Run Last (Neotest) (default: <leader>tl)"
---@field test_run_nearest string? "Run Nearest (Neotest) (default: <leader>tr)"
---@field test_show_output string? "Show Output (Neotest) (default: <leader>to)"
---@field test_stop string? "Stop (Neotest) (default: <leader>tS)"
---@field test_toggle_output_panel string? "Toggle Output Panel (Neotest) (default: <leader>tO)"
---@field test_toggle_summary string? "Toggle Summary (Neotest) (default: <leader>ts)"
---@field test_toggle_watch string? "Toggle Watch (Neotest) (default: <leader>tw)"
---@field tex_prefix string? "Vimtex (default: <localLeader>l)"
---@field tex_vimtex_docs string? "Vimtex Docs (default: <Leader>K)"
---@field todo_fix_fixme_telescope string? "Todo/Fix/Fixme (default: <leader>sT)"
---@field todo_fix_fixme_trouble string? "Todo/Fix/Fixme (Trouble) (default: <leader>xT)"
---@field todo_next_todo string? "Next Todo Comment (default: ]t)"
---@field todo_prev_todo string? "Previous Todo Comment (default: [t)"
---@field todo_telescope string? "Todo (default: <leader>st)"
---@field todo_trouble string? "Todo (Trouble) (default: <leader>xt)"
---@field toggle_animate string? "Toggle Animate (default: <leader>ua)"
---@field toggle_auto_format_buffer string? "Toggle Auto format buffer (default: <leader>uf)"
---@field toggle_auto_format_global string? "Toggle Auto format global (default: <leader>uF)"
---@field toggle_background string? "Toggle Background (default: <leader>ub)"
---@field toggle_conceallevel string? "Toggle Conceallevel (default: <leader>uc)"
---@field toggle_diagnostics string? "Toggle Diagnostics (default: <leader>ud)"
---@field toggle_dim string? "Toggle Dim (default: <leader>uD)"
---@field toggle_indent string? "Toggle Indent (default: <leader>ug)"
---@field toggle_inlay_hints string? "Toggle Inlay hints (default: <leader>uh)"
---@field toggle_number string? "Toggle Number (default: <leader>ul)"
---@field toggle_profiler string? "Toggle Profiler (default: <leader>dpp)"
---@field toggle_profiler_highlights string? "Toggle Profiler highlights (default: <leader>dph)"
---@field toggle_relativenumber string? "Toggle Relativenumber (default: <leader>uL)"
---@field toggle_scroll string? "Toggle Scroll (default: <leader>uS)"
---@field toggle_show_tabline string? "Toggle Show tabline (default: <leader>uA)"
---@field toggle_spelling string? "Toggle Spelling (default: <leader>us)"
---@field toggle_treesitter string? "Toggle Treesitter (default: <leader>uT)"
---@field toggle_wrap string? "Toggle Wrap (default: <leader>uw)"
---@field trouble_diagnostics_buffer_toggle string? "Buffer Diagnostics (Trouble) (default: <leader>xX)"
---@field trouble_diagnostics_toggle string? "Diagnostics (Trouble) (default: <leader>xx)"
---@field trouble_loclist_toggle string? "Location List (Trouble) (default: <leader>xL)"
---@field trouble_lsp_toggle string? "LSP Symbols (Trouble) (default: <leader>cS)"
---@field trouble_next_trouble string? "Next Trouble (default: ]q)"
---@field trouble_previous_trouble string? "Previous Trouble (default: [q)"
---@field trouble_qflist_toggle string? "Quickfix List (Trouble) (default: <leader>xQ)"
---@field trouble_symbols_toggle string? "Symbols (Trouble) (default: <leader>cs)"
---@field ts_decrement_selection string? "Treesitter: Decrement selection (default: <BS>)"
---@field ts_increment_selection string? "Treesitter: Increment selection (default: <C-Space>)"
---@field ts_ne_class_outer string? "Treesitter: Ne class outer (default: ]C)"
---@field ts_ne_function_outer string? "Treesitter: Ne function outer (default: ]F)"
---@field ts_ne_parameter_inner string? "Treesitter: Ne parameter inner (default: ]A)"
---@field ts_ns_class_outer string? "Treesitter: Ns class outer (default: ]c)"
---@field ts_ns_function_outer string? "Treesitter: Ns function outer (default: ]f)"
---@field ts_ns_parameter_inner string? "Treesitter: Ns parameter inner (default: ]a)"
---@field ts_pe_class_outer string? "Treesitter: Pe class outer (default: [C)"
---@field ts_pe_function_outer string? "Treesitter: Pe function outer (default: [F)"
---@field ts_pe_parameter_inner string? "Treesitter: Pe parameter inner (default: [A)"
---@field ts_ps_class_outer string? "Treesitter: Ps class outer (default: [c)"
---@field ts_ps_function_outer string? "Treesitter: Ps function outer (default: [f)"
---@field ts_ps_parameter_inner string? "Treesitter: Ps parameter inner (default: [a)"
---@field tscontext_toggle string? "Toggle Treesitter Context (default: <leader>ut)"
---@field typescript_go_to_source_definition string? "Goto Source Definition (TS) (default: gD)"
---@field ui_prefix string? "Ui (default: <leader>u)"
---@field vscode_find string? "Find (VSCode-style) (default: <leader><space>)"
---@field vscode_find_in_files string? "Find in Files (VSCode-style) (default: <leader>/)"
---@field vscode_go_to_symbol string? "Go to Symbol (VSCode-style) (default: <leader>ss)"
---@field window_delete_window string? "Delete Window (default: <leader>wd)"
---@field window_hydra_mode string? "Switch to window hydra mode (default: <c-w><space>)"
---@field window_left string? "Go to Left Window (default: <C-h>)"
---@field window_lower string? "Go to Lower Window (default: <C-j>)"
---@field window_right string? "Go to Right Window (default: <C-l>)"
---@field window_split_window_below string? "Split Window Below (default: <leader>-)"
---@field window_split_window_right string? "Split Window Right (default: <leader>|)"
---@field window_toggle_maximize_window string? "Toggle Maximize Window (default: <leader>wm)"
---@field window_toggle_maximize_window_alt string? "Toggle Maximize Window (default: <leader>uZ)"
---@field window_toggle_zen string? "Toggle Zen Mode (default: <leader>uz)"
---@field window_upper string? "Go to Upper Window (default: <C-k>)"
---@field windows_prefix string? "Windows (default: <leader>w)"
---@field yanky_cycle_backward_yank_history string? "Cycle Backward Through Yank History (default: ]y)"
---@field yanky_cycle_forward_yank_history string? "Cycle Forward Through Yank History (default: [y)"
---@field yanky_put_after_filter string? "Put After Applying a Filter (default: =p)"
---@field yanky_put_and_indent_left string? "Put and Indent Left (default: <p)"
---@field yanky_put_and_indent_right string? "Put and Indent Right (default: >p)"
---@field yanky_put_before_filter string? "Put Before Applying a Filter (default: =P)"
---@field yanky_put_before_indent_left string? "Put Before and Indent Left (default: <P)"
---@field yanky_put_before_indent_right string? "Put Before and Indent Right (default: >P)"
---@field yanky_put_indent_after_cursor_linewise string? "Put Indent After Cursor (default: ]p)"
---@field yanky_put_indent_after_cursor_linewise_alt string? "Put Indent After Cursor (Alt) (default: ]P)"
---@field yanky_put_indent_before_cursor_linewise string? "Put Indent Before Cursor (default: [p)"
---@field yanky_put_indent_before_cursor_linewise_alt string? "Put Indent Before Cursor (Alt) (default: [P)"
---@field yanky_put_text_after_cursor string? "Put Text After Cursor (default: p)"
---@field yanky_put_text_after_selection string? "Put After Selection (default: gp)"
---@field yanky_put_text_before_cursor string? "Put Text Before Cursor (default: P)"
---@field yanky_put_text_before_selection string? "Put Before Selection (default: gP)"
---@field yanky_yank string? "Yank Text (default: y)"
---@field yanky_yank_history string? "Yank History (default: <leader>p)"
local keymaps = nil

---@type LazyVimKeymaps
M.default_keymaps = {
  window_left = "<C-h>", -- Go to Left Window
  window_lower = "<C-j>", -- Go to Lower Window
  window_upper = "<C-k>", -- Go to Upper Window
  window_right = "<C-l>", -- Go to Right Window
  size_increase_height = "<C-Up>", -- Increase Height
  size_decrease_height = "<C-Down>", -- Decrease Height
  size_decrease_width = "<C-Left>", -- Decrease Width
  size_increase_width = "<C-Right>", -- Increase Width
  move_down = "<A-j>", -- Move Down
  move_up = "<A-k>", -- Move Up
  buf_prev = "<S-h>", -- Prev Buffer
  buf_next = "<S-l>", -- Next Buffer
  buf_prev_alt = "[b", -- Prev Buffer
  buf_next_alt = "]b", -- Next Buffer
  buf_switch_to_other = "<leader>bb", -- Switch to Other Buffer
  buf_switch_to_other_alt = "<leader>`", -- Switch to Other Buffer
  buf_delete = "<leader>bd", -- Delete Buffer
  buf_delete_invisible = "<leader>bi", -- Delete Invisible Buffers
  buf_delete_other = "<leader>bo", -- Delete Other Buffers
  buf_delete_and_close = "<leader>bD", -- Delete Buffer and Window
  clear_search_diff_update_and_redraw = "<leader>ur", -- Clear Search/Redraw
  save_file = "<C-s>", -- Save File
  keywordprg = "<leader>K", -- Keywordprg
  comment_add_below = "gco", -- Add Comment Below
  comment_add_above = "gcO", -- Add Comment Above
  lazy = "<leader>l", -- Lazy
  new_file = "<leader>fn", -- New File
  location_list = "<leader>xl", -- Location List
  quickfix_list = "<leader>xq", -- Quickfix List
  previous_quickfix = "[q", -- Previous Quickfix
  next_quickfix = "]q", -- Next Quickfix
  format = "<leader>cf", -- Format
  diagnostic_line_diagnostics = "<leader>cd", -- Line Diagnostics
  diagnostic_next_diagnostic = "]d", -- Next Diagnostic
  diagnostic_prev_diagnostic = "[d", -- Prev Diagnostic
  diagnostic_next_error = "]e", -- Next Error
  diagnostic_prev_error = "[e", -- Prev Error
  diagnostic_next_warning = "]w", -- Next Warning
  diagnostic_prev_warning = "[w", -- Prev Warning
  toggle_auto_format_buffer = "<leader>uf", -- Toggle Auto format buffer
  toggle_auto_format_global = "<leader>uF", -- Toggle Auto format global
  toggle_spelling = "<leader>us", -- Toggle Spelling
  toggle_wrap = "<leader>uw", -- Toggle Wrap
  toggle_relativenumber = "<leader>uL", -- Toggle Relativenumber
  toggle_diagnostics = "<leader>ud", -- Toggle Diagnostics
  toggle_number = "<leader>ul", -- Toggle Number
  toggle_conceallevel = "<leader>uc", -- Toggle Conceallevel
  toggle_show_tabline = "<leader>uA", -- Toggle Show tabline
  toggle_treesitter = "<leader>uT", -- Toggle Treesitter
  toggle_background = "<leader>ub", -- Toggle Background
  toggle_inlay_hints = "<leader>uh", -- Toggle Inlay hints
  toggle_dim = "<leader>uD", -- Toggle Dim
  toggle_animate = "<leader>ua", -- Toggle Animate
  toggle_indent = "<leader>ug", -- Toggle Indent
  toggle_scroll = "<leader>uS", -- Toggle Scroll
  toggle_profiler = "<leader>dpp", -- Toggle Profiler
  toggle_profiler_highlights = "<leader>dph", -- Toggle Profiler highlights
  lazygit_toggle_root = "<leader>gg", -- Lazygit (Root Dir)
  lazygit_toggle_cwd = "<leader>gG", -- Lazygit (cwd)
  lazygit_blame_line = "<leader>gb", -- Git Blame Line
  lazygit_browse = "<leader>gB", -- Git Browse (open)
  lazygit_browse_copy = "<leader>gY", -- Git Browse (copy)
  lazygit_current_file_history = "<leader>gf", -- Git Current File History
  lazygit_git_log_root = "<leader>gl", -- Git Log
  lazygit_git_log_cwd = "<leader>gL", -- Git Log (cwd)
  quit_all = "<leader>qq", -- Quit All
  inspect_pos = "<leader>ui", -- Inspect Pos
  inspect_tree = "<leader>uI", -- Inspect Tree
  lazyvim_changelog = "<leader>L", -- LazyVim Changelog
  terminal_toggle_root = "<leader>ft", -- Terminal (Root Dir)
  terminal_toggle_cwd = "<leader>fT", -- Terminal (cwd)
  terminal_toggle_root_alt_1 = "<c-/>", -- Terminal (Root Dir)
  terminal_toggle_root_alt_2 = "<c-_>", -- Terminal (Root Dir)
  terminal_enter_normal_mode = "<esc><esc>", -- Exit terminal to normal mode
  terminal_hide_terminal = "<C-/>", -- Hide Terminal
  terminal_hide_terminal_alt = "<c-_>", -- Hide Terminal
  window_split_window_below = "<leader>-", -- Split Window Below
  window_split_window_right = "<leader>|", -- Split Window Right
  window_delete_window = "<leader>wd", -- Delete Window
  window_toggle_maximize_window = "<leader>wm", -- Toggle Maximize Window
  window_toggle_maximize_window_alt = "<leader>uZ", -- Toggle Maximize Window
  window_toggle_zen = "<leader>uz", -- Toggle Zen Mode
  tab_last_tab = "<leader><tab>l", -- Last Tab
  tab_close_other_tabs = "<leader><tab>o", -- Close Other Tabs
  tab_first_tab = "<leader><tab>f", -- First Tab
  tab_new_tab = "<leader><tab><tab>", -- New Tab
  tab_next_tab = "<leader><tab>]", -- Next Tab
  tab_close_tab = "<leader><tab>d", -- Close Tab
  tab_previous_tab = "<leader><tab>[", -- Previous Tab
  quit_buffer = "q", -- Close buffer
  cmp_scroll_docs_backward = "<C-b>", -- Scroll Docs Backward
  cmp_scroll_docs_forward = "<C-f>", -- Scroll Docs Forward
  cmp_select_next_item = "<C-n>", -- Select Next Item
  cmp_select_prev_item = "<C-p>", -- Select Prev Item
  cmp_complete = "<C-Space>", -- Complete (cmp)
  cmp_confirm_auto_select = "<CR>", -- Confirm (auto-select)
  cmp_confirm_select = "<C-y>", -- Confirm (select)
  cmp_confirm_replace = "<S-CR>", -- Confirm (replace)
  cmp_abort = "<C-CR>", -- Abort (cmp)
  cmp_snippet_forward_ai_accept = "<tab>", -- Snippet Forward / Accept AI
  cmp_select_and_accept = "<C-y>", -- Select & Accept
  snippet_jump_next = "<Tab>", -- Jump Next Snippet
  snippet_jump_prev = "<S-Tab>", -- Jump Prev Snippet
  neotree_toggle_root = "<leader>fe", -- Explorer (Root Dir)
  neotree_toggle_cwd = "<leader>fE", -- Explorer (cwd)
  neotree_toggle_root_alt = "<leader>e", -- Explorer (Root Dir)
  neotree_toggle_cwd_alt = "<leader>E", -- Explorer (cwd)
  neotree_toggle_git_status = "<leader>ge", -- Git Status (Neo-tree)
  neotree_toggle_buffers = "<leader>be", -- Buffers (Neo-tree)
  neotree_win_open = "l", -- Open (Neo-tree)
  neotree_win_close_node = "h", -- Close Node (Neo-tree)
  neotree_win_copy_path_to_clipboard = "Y", -- Copy Path (Neo-tree)
  neotree_win_open_with_system_application = "O", -- Open With (Neo-tree)
  neotree_win_toggle_preview = "P", -- Toggle Preview (Neo-tree)
  grugfar_open = "<leader>sr", -- Search & Replace (Grug Far)
  flash_jump = "s", -- Flash
  flash_treesitter = "S", -- Flash Treesitter
  flash_remote = "r", -- Remote Flash
  flash_treesitter_search = "R", -- Treesitter Search
  flash_toggle = "<c-s>", -- Toggle Flash Search
  tabs_prefix = "<leader><tab>", -- Tabs
  code_prefix = "<leader>c", -- Code
  debug_prefix = "<leader>d", -- Debug
  profiler_prefix = "<leader>dp", -- Profiler
  file_find_prefix = "<leader>f", -- File find
  git_prefix = "<leader>g", -- Git
  hunks_prefix = "<leader>gh", -- Hunks
  quit_session_prefix = "<leader>q", -- Quit session
  search_prefix = "<leader>s", -- Search
  ui_prefix = "<leader>u", -- Ui
  diagnostics_quickfix_prefix = "<leader>x", -- Diagnostics/Quickfix
  buffer_prefix = "<leader>b", -- Buffer
  windows_prefix = "<leader>w", -- Windows
  buffer_keymaps = "<leader>?", -- Buffer Keymaps
  window_hydra_mode = "<c-w><space>", -- Switch to window hydra mode
  gitsigns_next_hunk = "]h", -- Next Hunk
  gitsigns_prev_hunk = "[h", -- Prev Hunk
  gitsigns_last_hunk = "]H", -- Last Hunk
  gitsigns_first_hunk = "[H", -- First Hunk
  gitsigns_stage_hunk = "<leader>ghs", -- Stage Hunk
  gitsigns_reset_hunk = "<leader>ghr", -- Reset Hunk
  gitsigns_stage_buffer = "<leader>ghS", -- Stage Buffer
  gitsigns_undo_stage_hunk = "<leader>ghu", -- Undo Stage Hunk
  gitsigns_reset_buffer = "<leader>ghR", -- Reset Buffer
  gitsigns_preview_hunk_inline = "<leader>ghp", -- Preview Hunk Inline
  gitsigns_blame_line = "<leader>ghb", -- Blame Line
  gitsigns_blame_buffer = "<leader>ghB", -- Blame Buffer
  gitsigns_diff_index = "<leader>ghd", -- Diff Index
  gitsigns_diff_commit = "<leader>ghD", -- Diff Commit
  gitsigns_select_hunk = "ih", -- Select hunk text object (gitsigns)
  gitsigns_toggle_signs = "<leader>uG", -- Toggle Signs
  trouble_diagnostics_toggle = "<leader>xx", -- Diagnostics (Trouble)
  trouble_diagnostics_buffer_toggle = "<leader>xX", -- Buffer Diagnostics (Trouble)
  trouble_symbols_toggle = "<leader>cs", -- Symbols (Trouble)
  trouble_lsp_toggle = "<leader>cS", -- LSP Symbols (Trouble)
  trouble_loclist_toggle = "<leader>xL", -- Location List (Trouble)
  trouble_qflist_toggle = "<leader>xQ", -- Quickfix List (Trouble)
  trouble_previous_trouble = "[q", -- Previous Trouble
  trouble_next_trouble = "]q", -- Next Trouble
  todo_next_todo = "]t", -- Next Todo Comment
  todo_prev_todo = "[t", -- Previous Todo Comment
  todo_trouble = "<leader>xt", -- Todo (Trouble)
  todo_fix_fixme_trouble = "<leader>xT", -- Todo/Fix/Fixme (Trouble)
  todo_telescope = "<leader>st", -- Todo
  todo_fix_fixme_telescope = "<leader>sT", -- Todo/Fix/Fixme
  conform_format = "<leader>cF", -- Format Buffer (Conform)
  ts_increment_selection = "<C-Space>", -- Treesitter: Increment selection
  ts_decrement_selection = "<BS>", -- Treesitter: Decrement selection
  ts_ns_function_outer = "]f", -- Treesitter: Ns function outer
  ts_ns_class_outer = "]c", -- Treesitter: Ns class outer
  ts_ns_parameter_inner = "]a", -- Treesitter: Ns parameter inner
  ts_ne_function_outer = "]F", -- Treesitter: Ne function outer
  ts_ne_class_outer = "]C", -- Treesitter: Ne class outer
  ts_ne_parameter_inner = "]A", -- Treesitter: Ne parameter inner
  ts_ps_function_outer = "[f", -- Treesitter: Ps function outer
  ts_ps_class_outer = "[c", -- Treesitter: Ps class outer
  ts_ps_parameter_inner = "[a", -- Treesitter: Ps parameter inner
  ts_pe_function_outer = "[F", -- Treesitter: Pe function outer
  ts_pe_class_outer = "[C", -- Treesitter: Pe class outer
  ts_pe_parameter_inner = "[A", -- Treesitter: Pe parameter inner
  snacks_toggle_scratch_buffer = "<leader>.", -- Toggle Scratch Buffer
  snacks_select_scratch_buffer = "<leader>S", -- Select Scratch Buffer
  snacks_profiler_scratch_buffer = "<leader>dps", -- Profiler Scratch Buffer
  notification_history = "<leader>n", -- Notification History
  dismiss_all_notifications = "<leader>un", -- Dismiss All Notifications
  snacks_debug_run = "<localleader>r", -- Run Lua
  bufferline_toggle_pin = "<leader>bp", -- Toggle Pin
  bufferline_delete_non_pinned_buffers = "<leader>bP", -- Delete Non-Pinned Buffers
  bufferline_delete_buffers_to_the_right = "<leader>br", -- Delete Buffers to the Right
  bufferline_delete_buffers_to_the_left = "<leader>bl", -- Delete Buffers to the Left
  bufferline_prev_buffer = "<S-h>", -- Prev Buffer
  bufferline_next_buffer = "<S-l>", -- Next Buffer
  bufferline_prev_buffer_alt = "[b", -- Prev Buffer
  bufferline_next_buffer_alt = "]b", -- Next Buffer
  bufferline_move_buffer_prev = "[B", -- Move Buffer Prev
  bufferline_move_buffer_next = "]B", -- Move Buffer Next
  bufferline_pick = "<leader>bj", -- Pick Buffer
  indentblankline_toggle = "<leader>ug", -- Toggle Indent Lines
  noice_prefix = "<leader>sn", -- Noice
  noice_redirect_cmdline = "<S-Enter>", -- Redirect Cmdline
  noice_last_message = "<leader>snl", -- Noice Last Message
  noice_history = "<leader>snh", -- Noice History
  noice_all = "<leader>sna", -- Noice All
  noice_dismiss = "<leader>snd", -- Dismiss All
  noice_pick = "<leader>snt", -- Noice Picker
  noice_scroll_forward = "<c-f>", -- Scroll Forward
  noice_scroll_backward = "<c-b>", -- Scroll Backward
  dashboard_find_file = "f", -- Find File
  dashboard_new_file = "n", -- New File
  dashboard_recent_files = "r", -- Recent Files
  dashboard_find_text = "g", -- Find Text
  dashboard_config = "c", -- Config
  dashboard_restore_session = "s", -- Restore Session
  dashboard_lazy_extras = "x", -- Lazy Extras
  dashboard_lazy = "l", -- Lazy
  dashboard_quit = "q", -- Quit
  dashboard_projects = "P", -- Projects
  persistence_restore_session = "<leader>qs", -- Restore Session
  persistence_select_session = "<leader>qS", -- Select Session
  persistence_restore_last_session = "<leader>ql", -- Restore Last Session
  persistence_skip_current_session = "<leader>qd", -- Skip Current Session
  minipairs_toggle = "<leader>up", -- Toggle Auto Pairs
  copilotchat_submit_prompt = "<c-s>", -- Submit Prompt (CopilotChat)
  copilotchat_prefix = "<leader>a", -- CopilotChat
  copilotchat_toggle = "<leader>aa", -- Toggle (CopilotChat)
  copilotchat_clear = "<leader>ax", -- Clear (CopilotChat)
  copilotchat_quick_chat = "<leader>aq", -- Quick Chat (CopilotChat)
  copilotchat_diagnostic_help = "<leader>ad", -- Diagnostic Help (CopilotChat)
  copilotchat_prompt_actions = "<leader>ap", -- Prompt Actions (CopilotChat)
  minisurround_prefix = "gs", -- Minisurround
  minisurround_add = "gsa", -- Add Surrounding
  minisurround_delete = "gsd", -- Delete Surrounding
  minisurround_find = "gsf", -- Find Surrounding
  minisurround_find_left = "gsF", -- Find Surrounding Left
  minisurround_highlight = "gsh", -- Highlight Surrounding
  minisurround_replace = "gsr", -- Replace Surrounding
  minisurround_update_n_lines = "gsn", -- Update Surrounding N Lines
  neogen_generate_annotation = "<leader>cn", -- Generate Annotation
  yanky_yank_history = "<leader>p", -- Yank History
  yanky_yank = "y", -- Yank Text
  yanky_put_text_after_cursor = "p", -- Put Text After Cursor
  yanky_put_text_before_cursor = "P", -- Put Text Before Cursor
  yanky_put_text_after_selection = "gp", -- Put After Selection
  yanky_put_text_before_selection = "gP", -- Put Before Selection
  yanky_cycle_forward_yank_history = "[y", -- Cycle Forward Through Yank History
  yanky_cycle_backward_yank_history = "]y", -- Cycle Backward Through Yank History
  yanky_put_indent_after_cursor_linewise = "]p", -- Put Indent After Cursor
  yanky_put_indent_before_cursor_linewise = "[p", -- Put Indent Before Cursor
  yanky_put_indent_after_cursor_linewise_alt = "]P", -- Put Indent After Cursor (Alt)
  yanky_put_indent_before_cursor_linewise_alt = "[P", -- Put Indent Before Cursor (Alt)
  yanky_put_and_indent_right = ">p", -- Put and Indent Right
  yanky_put_and_indent_left = "<p", -- Put and Indent Left
  yanky_put_before_indent_right = ">P", -- Put Before and Indent Right
  yanky_put_before_indent_left = "<P", -- Put Before and Indent Left
  yanky_put_after_filter = "=p", -- Put After Applying a Filter
  yanky_put_before_filter = "=P", -- Put Before Applying a Filter
  dap_prefix = "<leader>d", -- Debug
  dap_breakpoint_condition = "<leader>dB", -- Breakpoint Condition
  dap_toggle_breakpoint = "<leader>db", -- Toggle Breakpoint
  dap_continue = "<leader>dc", -- Run/Continue
  dap_run_with_args = "<leader>da", -- Run with Args
  dap_run_to_cursor = "<leader>dC", -- Run to Cursor
  dap_go_to_line_no_execute = "<leader>dg", -- Go to Line (No Execute)
  dap_step_into = "<leader>di", -- Step Into
  dap_down = "<leader>dj", -- Down (DAP)
  dap_up = "<leader>dk", -- Up (DAP)
  dap_run_last = "<leader>dl", -- Run Last
  dap_step_out = "<leader>do", -- Step Out
  dap_step_over = "<leader>dO", -- Step Over
  dap_pause = "<leader>dP", -- Pause
  dap_toggle_repl = "<leader>dr", -- Toggle REPL
  dap_session = "<leader>ds", -- Session
  dap_terminate = "<leader>dt", -- Terminate
  dap_widgets = "<leader>dw", -- Widgets
  dap_toggle_dap_ui = "<leader>du", -- Dap UI
  dap_eval_dap_ui = "<leader>de", -- Eval (DAP UI)
  aerial_toggle = "<leader>cs", -- Aerial (Symbols)
  dial_increment = "<C-a>", -- Increment
  dial_decrement = "<C-x>", -- Decrement
  dial_increment_g = "g<C-a>", -- Increment (g)
  dial_decrement_g = "g<C-x>", -- Decrement (g)
  harpoon_file = "<leader>H", -- Harpoon File
  harpoon_quick_menu = "<leader>h", -- Harpoon Quick Menu
  harpoon_to_file_prefix = "<leader>", -- Harpoon to file
  illuminate_next = "]]", -- Next Reference
  illuminate_prev = "[[", -- Prev Reference
  increname_rename = "<leader>cr", -- Incremental Rename
  leap_next = "s", -- Leap Forward to
  leap_prev = "S", -- Leap Backward to
  leap_from_windows = "gs", -- Leap from Windows
  minidiff_toggle_overlay = "<leader>go", -- Toggle Diff Overlay
  minifiles_open_current_file_dir = "<leader>fm", -- Open Current File Dir
  minifiles_open_cwd = "<leader>fM", -- Open CWD
  outline_up_and_jump = "<up>", -- Up and Jump (Outline)
  outline_down_and_jump = "<down>", -- Down and Jump (Outline)
  overseer_prefix = "<leader>o", -- Overseer
  overseer_toggle = "<leader>ow", -- Task list
  overseer_run = "<leader>oo", -- Run task
  overseer_task_action = "<leader>ot", -- Task action
  refactoring_prefix = "<leader>r", -- Refactoring
  refactoring_refactor = "<leader>rs", -- Refactor
  refactoring_inline_variable = "<leader>ri", -- Inline Variable
  refactoring_debug_print = "<leader>rP", -- Debug Print
  refactoring_debug_print_variable = "<leader>rp", -- Debug Print Variable
  refactoring_debug_cleanup = "<leader>rc", -- Debug Cleanup
  refactoring_extract_function = "<leader>rf", -- Extract Function
  refactoring_extract_function_to_file = "<leader>rF", -- Extract Function to File
  refactoring_extract_variable = "<leader>rx", -- Extract Variable
  picker_switch_buffer = "<leader>,", -- Switch Buffer
  picker_grep_root = "<leader>/", -- Grep (Root Dir)
  picker_command_history = "<leader>:", -- Command History
  picker_find_files_root = "<leader><space>", -- Find Files (Root Dir)
  picker_find_buffers = "<leader>fb", -- Buffers
  picker_find_buffers_all = "<leader>fB", -- Buffers (all)
  picker_find_config_file = "<leader>fc", -- Find Config File
  picker_find_files_root_alt = "<leader>ff", -- Find Files (Root Dir)
  picker_find_files_cwd = "<leader>fF", -- Find Files (cwd)
  picker_find_git_files = "<leader>fg", -- Find Files (git-files)
  picker_find_recent_files = "<leader>fr", -- Recent
  picker_find_recent_files_cwd = "<leader>fR", -- Recent (cwd)
  picker_find_projects = "<leader>fp", -- Projects
  picker_git_commits = "<leader>gc", -- Commits
  picker_git_diff = "<leader>gd", -- Git Diff (files)
  picker_git_commits_alt = "<leader>gl", -- Commits
  picker_git_status = "<leader>gs", -- Status
  picker_git_stash = "<leader>gS", -- Git Stash
  picker_search_registers = '<leader>s"', -- Search Registers
  picker_search_history = "<leader>s/", -- Search History
  picker_search_autocommands = "<leader>sa", -- Auto Commands
  picker_search_buffer = "<leader>sb", -- Buffer Lines
  picker_search_command_history = "<leader>sc", -- Command History
  picker_search_commands = "<leader>sC", -- Commands
  picker_search_document_diagnostics = "<leader>sd", -- Document Diagnostics
  picker_search_workspace_diagnostics = "<leader>sD", -- Workspace Diagnostics
  picker_search_grep_root = "<leader>sg", -- Grep (Root Dir)
  picker_search_grep_cwd = "<leader>sG", -- Grep (cwd)
  picker_search_help_pages = "<leader>sh", -- Help Pages
  picker_search_highlight_groups = "<leader>sH", -- Highlight Groups
  picker_search_jumplist = "<leader>sj", -- Jumplist
  picker_search_keymaps = "<leader>sk", -- Key Maps
  picker_search_loclist = "<leader>sl", -- Location List
  picker_search_man_pages = "<leader>sM", -- Man Pages
  picker_search_marks = "<leader>sm", -- Marks
  picker_search_options = "<leader>so", -- Options
  picker_search_resume = "<leader>sR", -- Resume
  picker_search_quickfix = "<leader>sq", -- Quickfix List
  picker_search_word_root = "<leader>sw", -- Word (Root Dir)
  picker_search_word_cwd = "<leader>sW", -- Word (cwd)
  picker_search_selection_root = "<leader>sw", -- Selection (Root Dir)
  picker_search_selection_cwd = "<leader>sW", -- Selection (cwd)
  picker_colorscheme_preview = "<leader>uC", -- Colorscheme Preview
  picker_go_to_symbol = "<leader>ss", -- Go to Symbol
  picker_go_to_symbol_workspace = "<leader>sS", -- Go to Symbol (Workspace)
  picker_open_with_trouble = "<c-t>", -- Open with Trouble
  picker_open_with_trouble_alt = "<a-t>", -- Open with Trouble (Alt)
  picker_find_files_no_ignore = "<a-i>", -- Find Files (no ignore)
  picker_find_files_with_hidden = "<a-h>", -- Find Files (hidden)
  picker_cycle_history_next = "<C-Down>", -- Cycle History Next
  picker_cycle_history_prev = "<C-Up>", -- Cycle History Prev
  picker_preview_scrolling_down = "<C-f>", -- Preview Scroll Down
  picker_preview_scrolling_up = "<C-b>", -- Preview Scroll Up
  picker_close = "q", -- Close Picker
  flash_normal = "s", -- Flash (Normal)
  flash_insert = "<c-s>", -- Flash (Insert)
  test_prefix = "<leader>t", -- Test
  test_attach = "<leader>ta", -- Attach to Test (Neotest)
  test_run_file = "<leader>tt", -- Run File (Neotest)
  test_run_all_test_files = "<leader>tT", -- Run All Test Files (Neotest)
  test_run_nearest = "<leader>tr", -- Run Nearest (Neotest)
  test_run_last = "<leader>tl", -- Run Last (Neotest)
  test_toggle_summary = "<leader>ts", -- Toggle Summary (Neotest)
  test_show_output = "<leader>to", -- Show Output (Neotest)
  test_toggle_output_panel = "<leader>tO", -- Toggle Output Panel (Neotest)
  test_stop = "<leader>tS", -- Stop (Neotest)
  test_toggle_watch = "<leader>tw", -- Toggle Watch (Neotest)
  test_debug_nearest = "<leader>td", -- Debug Nearest
  lang_lsp_info = "<leader>cl", -- Lsp Info
  lang_mason = "<leader>cm", -- Mason
  lang_go_to_definition = "gd", -- Goto Definition
  lang_go_to_declaration = "gD", -- Goto Declaration
  lang_references = "gr", -- References
  lang_file_references = "gR", -- File References
  lang_go_to_implementation = "gI", -- Goto Implementation
  lang_go_to_type_definition = "gy", -- Goto T[y]pe Definition
  lang_go_to_super = "gs", -- Goto Super
  lang_go_to_subjects = "gS", -- Goto Subjects
  lang_hover = "K", -- Hover
  lang_signature_help = "gK", -- Signature Help
  lang_insert_signature_help = "<c-k>", -- Signature Help
  lang_code_action = "<leader>ca", -- Code Action
  lang_run_codelens = "<leader>cc", -- Run CodeLens
  lang_refresh_codelens = "<leader>cC", -- Refresh CodeLens
  lang_rename_file = "<leader>cR", -- Rename File
  lang_rename = "<leader>cr", -- Rename
  lang_source_action = "<leader>cA", -- Source Action
  lang_next_reference = "]]", -- Next Reference
  lang_prev_reference = "[[", -- Prev Reference
  lang_cycle_next_reference = "<a-n>", -- Cycle Next Reference
  lang_cycle_prev_reference = "<a-p>", -- Cycle Prev Reference
  lang_organize_imports = "<leader>co", -- Organize Imports
  lang_add_missing_imports = "<leader>cM", -- Add Missing Imports
  lang_remove_unused_imports = "<leader>cu", -- Remove Unused Imports
  lang_fix_all_diagnostics = "<leader>cD", -- Fix All Diagnostics
  lang_select_lang_version = "<leader>cV", -- Select Language Version
  lang_extract_prefix = "<leader>cx", -- Lang extract
  lang_extract_method = "<leader>cxm", -- Extract Method
  lang_extract_variable = "<leader>cxv", -- Extract Variable
  lang_extract_constant = "<leader>cxc", -- Extract Constant
  ansible_run_playbook_role = "<leader>ta", -- Run playbook/role (Ansible)
  clangd_switch_source_header = "<leader>ch", -- Switch Source/Header (C/C++)
  clojure_jump_prev_evaluation_output = "[c", -- Prev Evaluation Output (Clojure)
  clojure_jump_next_evaluation_output = "]c", -- Next Evaluation Output (Clojure)
  elixir_to_pipe = "<leader>cp", -- To Pipe (Elixir)
  elixir_from_pipe = "<leader>cP", -- From Pipe (Elixir)
  lean_abbreviations_leader = "\\", -- Lean Abbreviations
  markdown_preview_toggle = "<leader>cp", -- Toggle Preview (Markdown)
  markdown_render_markdown_toggle = "<leader>um", -- Toggle Render (Markdown)
  python_debug_method = "<leader>dPt", -- Debug Method (Python)
  python_debug_class = "<leader>dPc", -- Debug Class (Python)
  python_select_virtual_env = "<leader>cv", -- Select VirtualEnv
  r_send = "<Enter>", -- Send (R)
  r_send_all = "<localleader>a", -- Send All (R)
  r_send_between_marks = "<localleader>b", -- Send Between Marks (R)
  r_send_chunks = "<localleader>c", -- Send Chunks (R)
  r_send_functions = "<localleader>f", -- Send Functions (R)
  r_send_goto = "<localleader>g", -- Goto (R)
  r_send_install = "<localleader>i", -- Install (R)
  r_send_knit = "<localleader>k", -- Knit (R)
  r_send_paragraph = "<localleader>p", -- Send Paragraph (R)
  r_send_quarto = "<localleader>q", -- Send Quarto (R)
  r_send_general = "<localleader>r", -- Send General (R)
  r_send_split_or_send = "<localleader>s", -- Split or Send (R)
  r_send_terminal = "<localleader>t", -- Terminal (R)
  r_send_view = "<localleader>v", -- View (R)
  rust_code_action = "<leader>cR", -- Code Action (Rust)
  rust_debuggables = "<leader>dr", -- Debuggables (Rust)
  rust_show_crate_documentation = "K", -- Show Crate Docs (Rust)
  scala_metals_commands = "<leader>me", -- Metals Commands (Scala)
  scala_metals_compile_cascade = "<leader>mc", -- Compile Cascade (Scala)
  scala_metals_hover_worksheet = "<leader>mh", -- Hover Worksheet (Scala)
  sql_toggle_dbui = "<leader>D", -- Toggle DBUI
  tex_prefix = "<localLeader>l", -- Vimtex
  tex_vimtex_docs = "<Leader>K", -- Vimtex Docs
  typescript_go_to_source_definition = "gD", -- Goto Source Definition (TS)
  edgy_toggle = "<leader>ue", -- Toggle Edgy
  edgy_select_window = "<leader>uE", -- Edgy Select Window
  minianimae_toggle = "<leader>ua", -- Minianimae toggle (Mini)
  tscontext_toggle = "<leader>ut", -- Toggle Treesitter Context
  chezmoi_pick_chezmoi = "<leader>sz", -- Pick Chezmoi
  chezmoi_select = "<CR>", -- Select (Chezmoi)
  chezmoi_key = "c", -- Chezmoi
  octo_issue_list = "<leader>gi", -- List Issues (Octo)
  octo_issue_search = "<leader>gI", -- Search Issues (Octo)
  octo_pr_list = "<leader>gp", -- List PRs (Octo)
  octo_pr_search = "<leader>gP", -- Search PRs (Octo)
  octo_repo_list = "<leader>gr", -- List Repos (Octo)
  octo_search = "<leader>gS", -- Search (Octo)
  octo_assignee = "<localleader>a", -- Assignee (Octo)
  octo_comment_code = "<localleader>c", -- Comment/Code (Octo)
  octo_label = "<localleader>l", -- Label (Octo)
  octo_issue = "<localleader>i", -- Issue (Octo)
  octo_react = "<localleader>r", -- React (Octo)
  octo_pr = "<localleader>p", -- PR (Octo)
  octo_rebase = "<localleader>pr", -- Rebase (Octo)
  octo_squash = "<localleader>ps", -- Squash (Octo)
  octo_review = "<localleader>v", -- Review (Octo)
  octo_go_to_issue = "<localleader>g", -- Goto Issue (Octo)
  octo_insert_at = "@", -- Insert @ (Octo)
  octo_insert_hashtag = "#", -- Insert # (Octo)
  kulala_prefix = "<leader>R", -- Kulala
  kulala_open_scratchpad = "<leader>Rb", -- Open Scratchpad (Kulala)
  kulala_copy_as_curl = "<leader>Rc", -- Copy as cURL
  kulala_paste_from_curl = "<leader>RC", -- Paste from curl
  kulala_set_env = "<leader>Re", -- Set Environment (Kulala)
  kulala_download_graphql_schema = "<leader>Rg", -- Download GraphQL Schema
  kulala_inspect = "<leader>Ri", -- Inspect (Kulala)
  kulala_jump_to_next_request = "<leader>Rn", -- Next Request (Kulala)
  kulala_jump_to_previous_request = "<leader>Rp", -- Prev Request (Kulala)
  kulala_close = "<leader>Rq", -- Close (Kulala)
  kulala_replay = "<leader>Rr", -- Replay (Kulala)
  kulala_send_request = "<leader>Rs", -- Send Request (Kulala)
  kulala_show_stats = "<leader>RS", -- Show Stats (Kulala)
  kulala_toggle_view = "<leader>Rt", -- Toggle Headers/Body
  vscode_find = "<leader><space>", -- Find (VSCode-style)
  vscode_find_in_files = "<leader>/", -- Find in Files (VSCode-style)
  vscode_go_to_symbol = "<leader>ss", -- Go to Symbol (VSCode-style)
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

---@param overrides? LazyVimKeymaps
function M.setup(overrides)
  vim.g.lazyvim_keymaps = overrides or {}
end

return M
