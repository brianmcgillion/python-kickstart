{
  pkgs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [
    pkgs.stdenv.cc.cc.lib
    pkgs.libz
    pkgs.gcc-unwrapped
  ];

  languages = {
    nix = {
      enable = true;
      lsp.package = pkgs.nixd;
    };

    python = {
      enable = true;
      venv.enable = true;
      uv = {
        enable = true;
        sync = {
          enable = true;
          allExtras = true;
        };
      };
    };
  };

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    # TODO: Add aider if you want to use it
    #uv tool install aider-chat@latest
    git --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
  '';

  # TODO: Enable this when you whan to enforce standards :)
  # https://devenv.sh/git-hooks/
  # git-hooks.hooks......enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
