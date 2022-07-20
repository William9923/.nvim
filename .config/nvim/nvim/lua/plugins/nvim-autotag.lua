-----------------------------------------------------------
-- Autotag configuration file
-----------------------------------------------------------

-- Plugin: nvim-autotag
-- url: https://github.com/windwp/nvim-autotag

local status_ok, autotag = pcall(require, "nvim-autotag")
if not status_ok then
  return
end

autotag.setup({})


