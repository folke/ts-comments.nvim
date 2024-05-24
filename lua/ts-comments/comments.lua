local Config = require("ts-comments.config")

local M = {}

-- Resolves the possible commentstrings for a given filetype in the current line
---@param ft string
---@return string[]
local function resolve(ft)
  local lang = vim.treesitter.language.get_lang(ft) or ft
  local spec = Config.options.lang[lang]
  local ret = {} ---@type string[]

  local have = {} ---@type table<string, boolean>
  local function add(a)
    if type(a) == "string" then
      if not have[a] and a ~= "" then
        have[a] = true
        ret[#ret + 1] = a
      end
    elseif type(a) == "table" then
      ---@diagnostic disable-next-line: no-unknown
      for _, v in ipairs(a) do
        add(v)
      end
      ---@diagnostic disable-next-line: no-unknown
      for k, v in pairs(a) do
        if type(k) == "string" then
          add(v)
        end
      end
    end
  end

  if type(spec) == "table" and not vim.islist(spec) then
    local line = vim.fn.getline(".")
    local pos = vim.api.nvim_win_get_cursor(0)
    local indent = line:match("^%s*()")
    -- nvim_win_get_cursor returns (1,0) indexed tuple
    -- treesitter.get_node expects (0,0) indexed tuple
    pos[1] = pos[1] - 1
    -- set position to the first non whitespace character
    if indent and pos[2] < indent - 1 then
      pos[2] = indent - 1
    end
    local ok, node = pcall(vim.treesitter.get_node, {
      ignore_injections = false, -- include injected languages
      pos = pos,
    })
    while ok and node do
      if spec[node:type()] then
        add(spec[node:type()]) -- found a commentstring for the current node
        break
      end
      node = node:parent()
    end
  end

  add(spec) -- always add all found patterns
  add(Config._get_option(ft, "commentstring")) -- always include the commentstring from the buffer
  return ret
end

---@param ft string
function M.get(ft)
  local patterns = resolve(ft)
  local line = vim.fn.getline(".")

  local cs = nil
  local n = math.huge
  for _, pattern in ipairs(patterns) do -- check all patterns to check if we want to uncomment
    local left, right = pattern:match("^%s*(.-)%s*%%s%s*(.-)%s*$") -- parse commentstring excluding whitespace
    if left and right then
      local l, m, r = line:match("^%s*" .. vim.pesc(left) .. "(%s*)(.-)(%s*)" .. vim.pesc(right) .. "%s*$")
      if m and #m < n then -- most commented line
        cs = vim.trim(left .. l .. "%s" .. r .. right) -- add correct whitespace to uncomment
        n = #m
      end
      if not cs then -- first pattern is the wanted commentstring
        cs = vim.trim(left .. " %s " .. right) -- add correct whitespace to comment
      end
    end
  end

  return cs
end

return M
