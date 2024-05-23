describe("Default options are sane", function()
  local Config = require("ts-comments.config")
  require("nvim-treesitter.parsers")

  for lang, spec in pairs(Config.options.lang) do
    it("for " .. lang, function()
      local fts = vim.treesitter.language.get_filetypes(lang)
      if #fts == 0 then
        fts = { lang }
      end
      local css = {}
      for _, ft in ipairs(fts) do
        local cs = Config._get_option(ft, "commentstring")
        if cs ~= "" then
          css[cs] = cs
        end
      end
      spec = type(spec) == "table" and spec or { spec }
      css = vim.tbl_keys(css)
      if #css == 1 and #spec == 1 then
        assert(css[1] ~= spec[1], "should not be default commentstring `" .. css[1] .. "`")
      end
    end)
  end

  it("and sorted", function()
    local Docs = require("lazy.docs")
    local config = Docs.extract("lua/ts-comments/config.lua", "\nM.options = ({.-\n})")
    local lines = vim.split(config, "\n")
    lines = vim.tbl_filter(function(line)
      return line:find("^    %w.*=")
    end, lines)
    lines = vim.tbl_map(function(line)
      return line:match("^    (.-) =.*$")
    end, lines)
    local sorted = vim.deepcopy(lines)
    table.sort(sorted)
    assert.same(lines, sorted, "config langs should be sorted")
  end)
end)
