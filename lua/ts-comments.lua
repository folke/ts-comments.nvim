local M = {}

local defaults = {
  ---@type table<string, string|table<string,string>>
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
    php = "// %s",
    rego = "# %s",
    rescript = "// %s",
    sql = "-- %s",
    svelte = "<!-- %s -->",
    terraform = "# %s",
    tsx = {
      _ = "// %s",
      call_expression = "// %s",
      comment = "// %s",
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
defaults.lang.javascript = vim.deepcopy(defaults.lang.tsx)

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", defaults, opts or {})

  local get_option = vim.filetype.get_option
  vim.filetype.get_option = function(filetype, option)
    if option ~= "commentstring" then
      return get_option(filetype, option)
    end
    local lang = vim.treesitter.language.get_lang(filetype) or filetype

    local ret = opts.lang[lang]
    if type(ret) == "table" then
      local ok, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
      while ok and node do
        if ret[node:type()] then
          ret = ret[node:type()]
          break
        end
        node = node:parent()
      end
      if type(ret) == "table" then
        ret = ret._
      end
    end
    return ret or get_option(filetype, option)
  end
end

return M
