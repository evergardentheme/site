set shell := ["/bin/sh", "-c"]

export MAIVI_PORT := "3000"

[env("MAIVI_BASE_URL", "https://evergarden.moe")]
run: (build)
  @just maivi

[env("MAIVI_LOG", "warn")]
[env("MAIVI_BASE_URL", "https://evergarden.moe")]
build: (whiskers)
  @just maivi build

[env("MAIVI_LOG", "debug")]
[env("MAIVI_REV", "dev")]
dev: (whiskers)
  @just maivi dev

[env("MAIVI_LOG", "debug")]
gen: (whiskers)
  @just maivi build

[private]
maivi *args:
  mkdir -p data
  maivi {{ args }}

whiskers:
  whiskers palette.tera
  whiskers styles.tera
  whiskers index.txt.tera -f winter

compile: build
  #!/usr/bin/env bash
  [[ -d dist ]] && rm -r dist
  mkdir -p dist/
  find -L build static -type f | while read line; do
    rel="${line#*/}"
    mkdir -p "dist/$(dirname "$rel")"
    ln -sv "$(realpath "$line")" "dist/$rel"
  done

push: (compile)
  ebil push --user evergarden dist/
