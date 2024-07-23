# 🚀 `ts-comments.nvim`

Tiny plugin to enhance Neovim's native comments:

- Easily override the comment string for a given **treesitter** language
- Supports different comment strings for different **treesitter** node types
- Relaxed rules for uncommenting
- Add proper whitespace when needed
- Supports multiple commentstrings for the same language.
  The first one is used for adding comments.
  All are used for uncommenting.

## ⚡️ Requirements

- Neovim >= 0.10.0

## 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
```

## ⚙️ Configuration

**ts-comments.nvim** uses the default Neovim `commentstring` as a fallback,
so there's no need to configure every language.

Default configuration:

<!-- config:start -->

```lua
{
  lang = {
    astro = "<!-- %s -->",
    axaml = "<!-- %s -->",
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
    kdl = "// %s",
    php = "// %s",
    rego = "# %s",
    rescript = "// %s",
    rust = { "// %s", "/* %s */" },
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
```

<!-- config:end -->

## 🔗 Related

- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
