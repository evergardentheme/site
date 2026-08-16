local palette = require("data.palette")
local swatch = maivi.mod("components.swatch")

return function(_, _)
  local variant = palette[1]

  return h.div({
    class = "palette-colors",

    h(Iter.tbl(variant.colors)
      :map(function(_, v)
        return swatch({ color = v.name })
      end)
      :to()),
  })
end
