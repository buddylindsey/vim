local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("telescope is not installed")
	return
end

local keymap = vim.keymap

local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fm', builtin.marks, {})

local wk = require('which-key')
wk.add({
  { "<leader>f", group = "Find" },
  { "<leader>fb", builtin.buffers, desc = "Buffers" },
  { "<leader>ff", builtin.find_files, desc = "Find Files" },
  { "<leader>fg", builtin.live_grep, desc = "Grep" },
  { "<leader>fh", builtin.help_tag, desc = "Help Tags" },
  { "<leader>fm", builtin.marks, desc = "Marks" },
}, { prefix = "<leader>" })

function check_ripgrep()
  local handle = io.popen("rg --version")
  local result = handle:read("*a")
  handle:close()

  if result ~= nil and result:find("ripgrep") then
  else
    print("ripgrep is not installed or not found in PATH.")
  end
end

check_ripgrep()

telescope.load_extension('file_browser')

vim.keymap.set(
  'n',
  '<leader>p',
  ':Telescope file_browser<CR>',
  { noremap = true, silent = true}
)
