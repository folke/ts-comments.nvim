describe("Default options are sane", function()
  local Config = require("ts-comments.config")
  local Comments = require("ts-comments.comments")
  require("nvim-treesitter.parsers")

  for lang, spec in pairs(Config.options.lang) do
    it("for " .. lang, function()
      local fts = vim.treesitter.language.get_filetypes(lang)
      if #fts == 0 then
        fts = { lang }
      end
      local css = {}
      local all_same = true
      for _, ft in ipairs(fts) do
        local css_default = Comments.resolve(ft, { ts = false, spec = "" })
        local css_config = Comments.resolve(ft, { ts = false })
        css = css_config

        if not vim.deep_equal(css_default, css_config) then
          all_same = false
          break
        end
      end
      assert(not all_same, "should not be default commentstring `" .. vim.inspect(css) .. "`")
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
