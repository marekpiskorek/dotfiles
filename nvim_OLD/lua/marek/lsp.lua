local servers = {
	dockerls = {},
	html = {},
	gopls = {},
	jsonls = {},
	pyright = {},
	terraformls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	-- copilot = {},
}
