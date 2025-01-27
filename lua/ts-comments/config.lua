--# selene: allow(mixed_table)
local M = {}

M._get_option = vim.filetype.get_option

---@alias TSCommentsSpec string|string[]|table<string,string|string[]>

---@class TSCommentsOptions
---@field lang table<string, TSCommentsSpec>
M.options = {
  lang = {
    astro = "<!-- %s -->",
    axaml = "<!-- %s -->",
    bicep = "// %s",
    blueprint = "// %s",
    c = "// %s",
    c_sharp = "// %s",
    clojure = { ";; %s", "; %s" },
    cpp = "// %s",
    cs_project = "<!-- %s -->",
    cue = "// %s",
    fsharp = "// %s",
    fsharp_project = "<!-- %s -->",
    gleam = "// %s",
    glimmer = "{{! %s }}",
    graphql = "# %s",
    handlebars = "{{! %s }}",
    hcl = "# %s",
    html = "<!-- %s -->",
    hyprlang = "# %s",
    ini = "; %s",
    ipynb = "# %s",
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
    just = "# %s",
    php = "// %s",
    proto = { "// %s", "/* %s */" },
    rego = "# %s",
    rescript = "// %s",
    rust = { "// %s", "/* %s */" },
    scss = { "// %s", "/* %s */" },
    sql = "-- %s",
    styled = "/* %s */",
    svelte = "<!-- %s -->",
    templ = {
      "// %s",
      component_block = "<!-- %s -->",
    },
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
    typescript = { "// %s", "/* %s */" }, -- langs can have multiple commentstrings
    vue = "<!-- %s -->",
    xaml = "<!-- %s -->",
  },
}

---@param opts? TSCommentsOptions
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.options, opts or {})

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.filetype.get_option = function(filetype, option)
    if filetype == "comment" then
      filetype = vim.bo.filetype
    end
    if option ~= "commentstring" then
      return M._get_option(filetype, option)
    end
    return require("ts-comments.comments").get(filetype)
  end
end

return M
