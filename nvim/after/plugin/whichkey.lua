local wk = require("which-key")
local show = wk.show
wk.show = function(keys, opts)
		-- Ignore whichkey help in Telescope and Harpoon prompts
    if vim.bo.filetype == "TelescopePrompt" or vim.bo.filetype == "harpoon" then
        local map = "<c-r>"
        local key = vim.api.nvim_replace_termcodes(map, true, false, true)
        vim.api.nvim_feedkeys(key, "i", true)
    end
    show(keys, opts)
end
wk.setup()
