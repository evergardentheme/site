local palette = require("data.palette")
local colorbox = maivi.mod("components.colorbox")

---@param color string
---@param i integer
---@return string?
local function colorFor(color, i)
  local variant = palette[i]
  if not variant then
    maivi.print("nope")
    return
  end
  local colors = variant.colors or {}
  for _, c in ipairs(colors) do
    if c.name == color then
      return c.hex
    end
  end
end

return function(props, _)
  local color = props.color

  return h.div({
    class = "swatch",
    h.div({
      class = "bg",
      style = ("color: var(--%s); background-color: var(--%s);"):format(
        color,
        color
      ),
    }),
    h.div({
      class = "overlay",
      h.span(color),
      h.div({
        class = "variants",
        h(Iter.lst(palette)
          :map(function(i, variant)
            return h.div({
              h.span(variant.name),
              colorbox({
                hex = colorFor(color, i),
              }),
            })
          end)
          :to()),
      }),
    }),
  })
end
