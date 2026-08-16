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
  ~/dev/maivi/zig-out/bin/maivi {{ args }} |& hl -P --config=hl.toml

whiskers:
  whiskers palette.tera
  whiskers styles.tera
  whiskers index.txt.tera -f winter

compile: build
  mkdir -p .rewritten/
  cp -r build/* .rewritten/
  cp -r static/* .rewritten/

push: (compile)
  ebil push
