--# selene: allow(mixed_table)
local M = {}

local get_option = vim.filetype.get_option

---@class TSCommentsOptions
---@field lang table<string, string|string[]|table<string,string>>
local options = {
  lang = {
    astro = "<!-- %s -->",
    c = "// %s",
    cpp = "// %s",
    css = "/* %s */",
    gleam = "// %s",
    glimmer = "{{! %s }}",
    graphql = "# %s",
    handlebars = "{{! %s }}",
    hcl = "# %s",
    html = "<!-- %s -->",
    ini = "; %s",
    lua = { "-- %s", "--- %s" }, -- langs can have multiple commentstrings
    php = "// %s",
    rego = "# %s",
    rescript = "// %s",
    sql = "-- %s",
    svelte = "<!-- %s -->",
    terraform = "# %s",
    tsx = {
      "// %s", -- default commentstring when no treesitter node matches
      "/* %s */",
      call_expression = "// %s", -- specific commentstring for call_expression
      jsx_attribute = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      spread_element = "// %s",
      statement_block = "// %s",
    },
    twig = "{# %s #}",
    typescript = "// %s",
    vim = '" %s',
    vue = "<!-- %s -->",
  },
}
---@diagnostic disable-next-line: param-type-mismatch
options.lang.javascript = vim.deepcopy(options.lang.tsx)

-- Resolves the possible commentstrings for a given filetype in the current line
---@param ft string
---@return string[]
local function resolve(ft)
  local lang = vim.treesitter.language.get_lang(ft) or ft
  local spec = options.lang[lang]
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
    local cursor = vim.api.nvim_win_get_cursor(0)
    local indent = line:match("^%s*()")
    local ok, node = pcall(vim.treesitter.get_node, {
      ignore_injections = false, -- include injected languages
      -- set position to the first non whitespace character
      pos = { vim.fn.line(".") - 1, indent and (indent - 1) or cursor[2] },
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
  add(get_option(ft, "commentstring")) -- always include the commentstring from the buffer
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

function M.setup(opts)
  options = vim.tbl_deep_extend("force", options, opts or {})

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.filetype.get_option = function(filetype, option)
    if option ~= "commentstring" then
      return get_option(filetype, option)
    end
    return M.get(filetype)
  end
end

return M
