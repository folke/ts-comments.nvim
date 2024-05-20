# 🚀 ts-comments.nvim

Super simple plugin to enhance Neovim's native comments:

- Easily override the comment string for a given **treesitter** language
- Supports different comment strings for different **treesitter** node types

# ⚡️ Requirements

- Neovim >= 0.10.0

# 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "folke/ts-comments.nvim",
  opts = {}
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
```

# ⚙️ Configuration

Default configuration:

```lua
{
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

```

# 🔗 Related

- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
