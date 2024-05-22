local M = {}

---@param opts? TSCommentsOptions
function M.setup(opts)
  require("ts-comments.config").setup(opts)
end

return M
