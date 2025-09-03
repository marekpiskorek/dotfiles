-- https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/11
function _G.ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^marek') and not name:match('nvim-tree') then
      -- overwrite the cache
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
