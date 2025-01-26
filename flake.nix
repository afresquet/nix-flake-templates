{
  description = "Nix Flake Templates";

  outputs =
    { self }:
    {
      templates =
        let
          rust = {
            path = ./rust;
            description = "Devenv Rust environment";
          };
        in
        {
          inherit rust;

          default = rust;
        };
    };
}
