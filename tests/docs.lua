local Docs = require("lazy.docs")

local M = {}

function M.update()
  local config = Docs.extract("lua/ts-comments/config.lua", "\nM.options = ({.-\n})")
  config = config:gsub("%s*debug = false.\n", "\n")
  Docs.save({
    config = config,
  })
end

M.update()

return M
