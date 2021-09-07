{
  description = "Rescript bindings for ReactBootstrap";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        yarnBuild = pkgs.mkYarnPackage {
          name = "rescript-react-bootstrap";
          version = "0.0.1";
          src = ./.;
          packageJSON = ./package.json;
          yarnLock = ./yarn.lock;

          nativeBuildInputs = with pkgs; [ nodejs-16_x python39 ];

          # TODO: we need to build this package any way haha

          meta = with pkgs.lib; {
            license = licenses.mit;
            maintainers = with maintainers; [ matdsoupe ];
          };
        };
      in {
        devShell = pkgs.mkShell {
          name = "rescript-react-bootstrap";
          buildInputs = with pkgs; with pkgs.nodePackages; [
            # pacotes pro ambiente de desenvolvimento
            # dev packages
            nodejs-16_x
            yarn
            eslint
            prettier

            # necessário para compilar o rescript/bs-platform (temporário)
            # to build rescript/bs-platform (temporary)
            python39

            # pacotes da aplicação (veja package.json)
            # app packages (See package.json)
            yarnBuild
          ];
          shellHook = ''export PATH="./node_modules/.bin:$PATH"'';
        };
      });
}
