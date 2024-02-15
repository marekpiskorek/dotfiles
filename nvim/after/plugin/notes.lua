local global_note = require("global-note")
local get_project_name = function()
  local result = vim.system({
    "git",
    "rev-parse",
    "--show-toplevel",
  }, {
    text = true,
  }):wait()

  if result.stderr ~= "" then
    vim.notify(result.stderr, vim.log.levels.WARN)
    return nil
  end

  local project_directory = result.stdout:gsub("\n", "")

  local project_name = vim.fs.basename(project_directory)
  if project_name == nil then
    vim.notify("Unable to get the project name", vim.log.levels.WARN)
    return nil
  end

  return project_name
end

global_note.setup({
  additional_presets = {
    project_local = {
      command_name = "ProjectNote",

      filename = function()
        return get_project_name() .. ".md"
      end,

      title = "Project note",
    },
  }
})

vim.keymap.set("n", "<leader>n", function()
  global_note.toggle_note("project_local")
end, {
  desc = "Toggle project note",
})

require("global-note").setup(
{
  directory=
}
)
