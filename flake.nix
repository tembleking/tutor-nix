{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        callPackage = pkgs.lib.callPackageWith (pkgs // pkgs.python3Packages // tutorPackages);
        tutorPackages =
          {
            tutor = callPackage ./tutor.nix {};
          }
          // tutorPlugins;
        tutorPlugins = {
          tutor-android = callPackage ./plugins/android.nix {};
          tutor-cairn = callPackage ./plugins/cairn.nix {};
          tutor-credentials = callPackage ./plugins/credentials.nix {};
          tutor-discovery = callPackage ./plugins/discovery.nix {};
          tutor-ecommerce = callPackage ./plugins/ecommerce.nix {};
          tutor-forum = callPackage ./plugins/forum.nix {};
          tutor-indigo = callPackage ./plugins/indigo.nix {};
          tutor-jupyter = callPackage ./plugins/jupyter.nix {};
          tutor-mfe = callPackage ./plugins/mfe.nix {};
          tutor-minio = callPackage ./plugins/minio.nix {};
          tutor-notes = callPackage ./plugins/notes.nix {};
          tutor-webui = callPackage ./plugins/webui.nix {};
          tutor-xqueue = callPackage ./plugins/xqueue.nix {};
        };
        tutorPackagesList =
          pkgs.lib.attrsets.attrValues tutorPackages;

        tutor-all = pkgs.symlinkJoin {
          name = "tutor-all";
          paths = tutorPackagesList;
        };
      in {
        packages =
          {
            default = tutorPackages.tutor;
          }
          // tutorPackages
          // {inherit tutor-all;};

        devShells.default = with pkgs;
          mkShell {
            buildInputs =
              [
                # Add here dependencies for the project.
              ]
              ++ tutorPackagesList;
          };

        formatter = pkgs.alejandra;

        overlays = {
          addPackages = final: prev: tutorPackages // {inherit tutor-all;};
        };
      }
    );
}
