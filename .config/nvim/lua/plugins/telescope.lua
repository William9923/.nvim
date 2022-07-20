-----------------------------------------------------------
-- Telescope Configuration
-----------------------------------------------------------

-- Plugin: Telescope
-- url: https://github.com/nvim-telescope/telescope.nvim

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
  }
}

-- Load Extension
telescope.load_extension "file_browser"
