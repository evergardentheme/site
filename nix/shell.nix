{
  stdenv,
  mkShell,

  stylua,

  inputs, # our inputs
  self ? inputs.self,
}:
mkShell {
  # inputsFrom = [ self.packages.${stdenv.hostPlatform.system}.default ];

  packages = [
    stylua
    inputs.ebil.packages.${stdenv.hostPlatform.system}.default
    inputs.whiskers.packages.${stdenv.hostPlatform.system}.default
  ];
}
