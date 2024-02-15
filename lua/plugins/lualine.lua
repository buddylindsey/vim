local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("lualine is not instaled")
    return
end

lualine.setup {
    options = {
        theme = "auto",
        section_separators = {"", ""},
        component_separators = {"", ""},
        icons_enabled = true,
        refresh = {
            statusline = 500,
            tabline = 500,
            winbar = 500,
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}
