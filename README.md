# python-kickstart
Bootstrap a Python dev environment on Nixos.

This kick-starter is based on https://devenv.sh/ and specifically tailored to Python development https://devenv.sh/supported-languages/python/.

There are some opinionated defaults set here.

## Setting up
The full setup can be seen at https://devenv.sh/getting-started/.

### TL;DR
Add the following to your configuration

``` nix
environment.systemPackages = [
  pkgs.devenv
];

programs.nix-ld.enable = true;
```

Inside the project run `direnv allow` to enable the automatic environment creation `.envrc` to run and setup the space.

## Maintenance
To refresh the package versions or after making changes to the `devenv.nix` or `pyproject.toml`

``` shell
devenv update
uv sync
```

## project structure

`devenv.nix` controls the native dependencies of the project and the scaffolding to define a UV project.
- uv package manager
- venv also supported
- some of the most common native dependencies (OS-dependent library packages) are defined.

UV was chosen as the default package and project manager.
- `uv lock` `uv sync` `uv ...` control the python project as normal

`pyproject.toml` defines all the python dependencies both for development and runtime.
- some opinionated default packages have been selected for the development environment.
  - includes, formatting, linting, lsp etc
