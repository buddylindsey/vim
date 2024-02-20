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

return M
