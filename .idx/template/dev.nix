# NOW, IF YOU FIND ANY 'REBUILD ENVIROMENT' BUTTON, PLEASE CLICK IT
# THEN REMOVE THESE COMMENTS
{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = [
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
      };
      onStart = {
      };
    };
  };
}
