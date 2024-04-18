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

local function window_opts()
    local width = math.floor(vim.o.columns * 0.6)
    local height = math.floor(vim.o.lines * 0.6)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    return {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        border = "rounded",
    }
end

-- Add window for random commands
function M.open_command_in_float(cmd)
    -- Create a buffer for the floating window
    local buf = vim.api.nvim_create_buf(false, true)

    local opts = window_opts()

    local win = vim.api.nvim_open_win(buf, true, opts)

    vim.api.nvim_buf_call(buf, function()
        vim.cmd(cmd)
    end)
end

function M.open_terminal_command_in_float(cmd)
    local buf = vim.api.nvim_create_buf(false, true)
    local opts = window_opts()
    local win = vim.api.nvim_open_win(buf, true, opts)

    vim.fn.termopen(cmd, {
        on_exit = function()
            -- Automatically close the window when the command exits
            vim.api.nvim_win_close(win, true)
        end
    })
    -- Enter insert mode automatically (optional)
    vim.cmd('startinsert')
end

return M
