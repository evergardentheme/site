return function(_, _)
  return h({
    h.main({
      h.header({
        h.h1("evergarden"),
        h.p({
          [[
          evergarden is a colorscheme inspired by lush forests, enchanted groves, and the
          calm of nature. It was also inspired by the lively art of ]],
          h.em([[The Legend of Zelda: The Minish Cap]]),
          [[. It's designed to be easy on the eyes, elegant, and just plain nice to look
          at - whether you're coding, writing, or just staring at your terminal for fun
          (we won't judge). ]],
        }),
        h.p([[
by the way, you can try out the colors in your terminal by running: ]]),
        h.pre({
          h.code({
            h.span({ h.raw([[&#36; ]]) }),
            h.span({ style = "color: var(--skye);", [[curl ]] }),
            h.span({ style = "color: var(--subtext1);", [[-L ]] }),
            h.span({ style = "color: var(--text);", [[evergarden.moe]] }),
          }),
        }),
      }),
      maivi.mod("components.palette"),
      h.footer({
        h.div({
          [[this site is built with ]],
          h.a({
            href = "https://codeberg.org/comfysage/maivi",
            target = "_blank",
            "maivi",
          }),
          [[ <3]],
        }),
        h.div({
          [[& powered by ]],
          h.a({
            href = "https://ebil.club",
            target = "_blank",
            "ebil.club",
          }),
          [[ >:3]],
        }),
      }),
    }),
    h.div({
      id = "drawer",
      h.div({
        id = "drawer-bar",
        h.div({
          class = "drawer-toggle",
          h.label({
            noselect = true,
            ["for"] = "ports-toggle",
            "ports",
          }),
          h.input({
            type = "checkbox",
            name = "ports",
            id = "ports-toggle",
          }),
        }),
        h.span({
          id = "ports-callout",
          [[ <- look at our cute ports ! ]],
        }),
        h.div({
          class = "links",
          h.a({ href = "https://codeberg.org/evergarden", "codeberg" }),
          h.a({ href = "https://github.com/everviolet", "github" }),
          h.a({
            href = "https://codeberg.org/evergarden/.profile",
            "resources",
          }),
          h.a({ href = "https://robinwobin.dev/redirect/discord", "discord" }),
          h.a({
            href = "https://bsky.app/profile/did:plc:yyfc3u72l35gztckwgnw2g6c",
            "bluesky",
          }),
        }),
      }),
      h.section({
        id = "ports-drawer",
        class = "drawer",
        maivi.mod("components.ports"),
      }),
    }),
    h.div({ class = "dim-overlay" }),
  })
end
