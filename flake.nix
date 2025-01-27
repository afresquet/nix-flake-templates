{
  description = "Nix Flake Templates";

  outputs =
    { self }:
    {
      templates =
        let
          welcomeText = ''
            # `.direnv` and `.devenv` should be added to `.gitignore`
            ```sh
              echo .direnv >> .gitignore
              echo .devenv >> .gitignore
            ```
          '';

          rust = {
            path = ./rust;
            description = "Devenv Rust environment";
            inherit welcomeText;
          };
        in
        {
          inherit rust;

          rust-toolchain = {
            path = ./rust-toolchain;
            description = "Rust Overlay toolchain.toml environment";
            inherit welcomeText;
          };

          default = rust;
        };
    };
}
