return function(_)
  return h.document({
    h.html({
      lang = "en",

      h.head({
        h.meta({ charset = "UTF-8" }),
        h.meta({
          name = "viewport",
          content = "width=device-width, initial-scale=1.0",
        }),
        h.link({ rel = "icon", type = "image+xml", href = "/favicon.svg" }),
        h.link({ rel = "icon", type = "image-icon", href = "/favicon.ico" }),
        h.link({ rel = "stylesheet", href = "/styles/reset.css" }),
        h.link({ rel = "stylesheet", href = "/styles/font.css" }),
        h.link({ rel = "stylesheet", href = "/styles/colors.css" }),
        h.link({ rel = "stylesheet", href = "/styles/base.css" }),
        h.link({ rel = "stylesheet", href = "/styles/index.css" }),
        h.link({
          rel = "preconnect",
          href = "https:fonts.gstatic.com",
          crossorigin = true,
        }),
        h.title("evergarden"),
        h.meta({ name = "color-scheme", content = "dark" }),
        h.meta({ name = "darkreader-lock" }),
        h.meta({ name = "theme-color", content = "#cbe3b3" }),
        h.meta({ name = "title", content = "evergarden" }),
        h.meta({
          name = "description",
          content = "evergarden is a colorscheme inspired by lush forests, enchanted groves, and the calm of nature",
        }),
        h.meta({
          property = "og:image",
          content = "https:evergarden.moe/og.png",
        }),

        h.script({
          defer = "",
          src = "/main.js",
        }),
      }),
      h.body({
        maivi.mod("app"),
      }),
    }),
  })
end
