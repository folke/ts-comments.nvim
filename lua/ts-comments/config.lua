--# selene: allow(mixed_table)
local M = {}

M._get_option = vim.filetype.get_option

---@class TSCommentsOptions
---@field lang table<string, string|string[]|table<string,string>>
M.options = {
  lang = {
    astro = "<!-- %s -->",
    axaml = "<!-- %s -->",
    blueprint = "// %s",
    c = "// %s",
    c_sharp = "// %s",
    clojure = { ";; %s", "; %s" },
    cpp = "// %s",
    cs_project = "<!-- %s -->",
    css = "/* %s */",
    cue = "// %s",
    fsharp = "// %s",
    fsharp_project = "<!-- %s -->",
    gleam = "// %s",
    glimmer = "{{! %s }}",
    handlebars = "{{! %s }}",
    hcl = "# %s",
    html = "<!-- %s -->",
    ini = "; %s",
    javascript = {
      "// %s", -- default commentstring when no treesitter node matches
      "/* %s */",
      call_expression = "// %s", -- specific commentstring for call_expression
      jsx_attribute = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      spread_element = "// %s",
      statement_block = "// %s",
    },
    lua = { "-- %s", "--- %s" }, -- langs can have multiple commentstrings
    ocaml = "(* %s *)",
    php = "// %s",
    rego = "# %s",
    rescript = "// %s",
    ruby = "# %s",
    rust = { "// %s", "/* %s */", "/// %s" },
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
    xaml = "<!-- %s -->",
    xml = "<!-- %s -->",
  },
}

---@param opts? TSCommentsOptions
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.filetype.get_option = function(filetype, option)
    if option ~= "commentstring" then
      return M._get_option(filetype, option)
    end
    return require("ts-comments.comments").get(filetype)
  end
end

return M
