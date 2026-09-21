return maivi.component(function(props, _)
  return h.button({
    class = "colorbox copy",
    style = ("background-color: %s;"):format(props.hex),
    h.label(props.hex),
  })
end)
