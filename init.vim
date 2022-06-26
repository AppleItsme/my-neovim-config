lua require('plugins')
lua require('init')
set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
set ts=4 sw=4

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

inoremap <silent><expr> <c-space> coc#refresh()

let g:c_syntax_for_h = 1

vim.lsp.set_log_level("DEBUG")
