# DO NOT CLOSE THIS FILE, THIS IS THE SETUP
# WHEN THE FILE HAS CHANGED, IF YOU FIND ANY 'REBUILD ENVIROMENT' BUTTON, PLEASE CLICK IT
{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = [
    pkgs.deno
  ];
  env = {};
  idx = {
    extensions = [
      "denoland.vscode-deno"
    ];
    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };
    workspace = {
      onCreate = {
        default.openFiles = [ ".idx/dev.nix" ];
        # Because the Deno version was too outdated on nix, and
        # when you upgraded it using 'deno upgrade', they dont have the perms to do it in idx
        # This is the workaround
        create-exec = ''
          mkdir exec
          cd exec
          deno upgrade --output ./deno
          echo "DO NOT REMOVE THIS THING, EVEN THOUGH THIS IS NOT EXPORTED" >> README.txt
          echo "# GENERATED BY just-a-vid-place" >> ~/.bashrc
          echo "export PATH=\$PATH:$PWD" >> ~/.bashrc
          sudo ln -s $PWD /usr/bin
          cd ../.idx
          cat ./template/dev.nix > dex.nix
          rm -rf ./template
          exit
        '';
      };
      onStart = {
      };
    };
  };
}
