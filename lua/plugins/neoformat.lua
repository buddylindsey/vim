-- local status_ok, neoformat = pcall(require, "neoformat")
-- if not status_ok then
--     print("neoformat is not installed")
--     return
-- end

-- vim.api.nvim_set_autocmd("BufWritePre", "*.py", "Neoformat isort")

-- vim.api.nvim_create_autocmd("BufWritePre", {
--    pattern = "*.py",
--    callback = function()
--        -- Run isort then black before saving Python files
--        vim.cmd("Neoformat isort")
--    end
-- })


-- Optional: Enable Neoformat to run formatters automatically on save
-- vim.g.neoformat_enabled_python = { 'isort', 'black' }

-- Optional: If you want Neoformat to attempt to format with multiple formatters
-- vim.g.neoformat_try_formatprg = 1
