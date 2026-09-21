local palette = require("@self/data/palette")
local swatch = require("@self/components/swatch")

return maivi.component(function(_, _)
  local variant = palette[1]

  return h.div({
    class = "palette-colors",

    h(maivi.iter.tbl(variant.colors)
      :map(function(_, v)
        return swatch({ color = v.name })
      end)
      :to()),
  })
end)
