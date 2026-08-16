return function(props, _)
  return h.div({
    class = "colorbox copy",
    style = ("background-color: %s;"):format(props.hex),
    h.label(props.hex),
  })
end
