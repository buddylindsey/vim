local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print("gitsigns is not installed")
	return
end

gitsigns.setup({
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  current_line_blame = true -- Toggle with `:Gitsigns toggle_current_line_blame`
})
