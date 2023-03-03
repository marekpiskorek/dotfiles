require("lualine").setup {
  options = { disabled_filetypes = { statusline = { "packer", "NvimTree" } } },
  sections = {
    lualine_b = {
      { 'branch' }, { 'diff' }, { 'diagnostics' }
    },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } }
  }
}
