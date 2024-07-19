{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "sawadashota";
    userEmail = "shota@sslife.tech";
    aliases = {
      sw = "switch";
      co = "checkout";
      ci = "commit";
      st = "status";
      br = "branch";
      rmt = "remote";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      l = "log --oneline --decorate --graph";
      s = "status";
      a = "add";
      cm = "commit";
      cmm = "commit -m";
      ca = "commit --amend";
      p = "!git push origin `git rev-parse --abbrev-ref HEAD`";
      pl = "pull";
      f = "fetch";
      m = "merge";
      d = "diff";
      dt = "difftool";
      t = "tag";
      r = "rebase";
      rs = "reset";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        editor = "nvim";
      };
      ghq = {
        root = "~/repo/";
      };
      credential = {
        helper = "osxkeychain";
      };
    };
    ignores = [
      ".idea/"
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "Icon"
      ".envrc"
      ".vscode/"
    ];
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview];
    settings = {
      editor = "nvim";
    };
  };
}

