local utils = require("utils")

if not utils.check_app_exist("node --version", "v") then
    print("Node.js is required for Copilot")
    return
end

