local ports = require("@self/data/ports")

return maivi.component(function(_, _)
  return h.ul({
    role = "list",
    class = "ports",
    h(maivi.iter.lst(ports)
      :map(function(_, port)
        return h.li({
          class = "port",
          h.span({
            h.h3({
              h.a({
                href = "https://codeberg.org/evergarden/" .. port.repo,
                port.name or port.repo,
              }),
            }),
            h.p({
              class = "desc",
              port.desc,
            }),
          }),
        })
      end)
      :to()),
  })
end)
