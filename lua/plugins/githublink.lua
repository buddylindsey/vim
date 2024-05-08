local M = {}

local function get_commit_hash()
    local handle = io.popen("git rev-parse HEAD")
    local commit_hash = handle:read("*a"):gsub("\n", "")
    handle:close()
    return commit_hash
end

local function get_relative_path(file_path)
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    return file_path:sub(#git_root + 2)
end

local function get_repo_from_remote()
    local handle = io.popen("git remote get-url origin")
    local remote_url = handle:read("*a"):gsub("\n", "")
    handle:close()
    local repo = remote_url:match("github%.com[:/](.+)%.git")
    return repo
end

function M.OpenGitHubLine()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local file_path = vim.api.nvim_buf_get_name(0)

    local commit_hash = get_commit_hash()
    local relative_path = get_relative_path(file_path)
    local repo = get_repo_from_remote()

    local url = string.format("https://github.com/%s/blob/%s/%s#L%d",
                              repo, commit_hash, relative_path, line)
    vim.fn.setreg('+', url)

    print("Copied to clipboard: " .. url)
end

vim.api.nvim_create_user_command('OpenGitHubLine', M.OpenGitHubLine, {nargs = 0})

return M
