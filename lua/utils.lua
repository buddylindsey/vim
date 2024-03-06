local M = {}

function M.check_app_exist(command, text)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()

    if result ~= nil and result:find(text) then
        return true
    else
        return false
    end
end

-- Add window for random commands
function open_command_in_float(cmd)
    -- Calculate the floating window size and position
    local width = math.floor(vim.o.columns * 0.6)
    local height = math.floor(vim.o.lines * 0.6)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a buffer for the floating window
    local buf = vim.api.nvim_create_buf(false, true)

    -- Define the floating window options
    local opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        border = "rounded",
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_call(buf, function()
        vim.cmd(cmd)
    end)
end

return M
