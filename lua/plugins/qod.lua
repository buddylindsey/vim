local function  read_file(path)
    local file = io.open(path, "r")
    if not file then return nil end

    local content = file:read "*a"
    file:close()
    return content
end

local function insertQodText()
  local file_path = os.getenv("HOME") .. "/.qod"
  local qod = read_file(file_path)
  if not qod then
    print("No quote of the day found")
    return
  end
  local text_to_insert = qod
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local new_line = line:sub(1, col) .. text_to_insert .. line:sub(col + 1)
  vim.api.nvim_set_current_line(new_line)
  vim.api.nvim_win_set_cursor(0, {row, col + #text_to_insert})
end

vim.api.nvim_create_user_command('Qod', insertQodText, {})

