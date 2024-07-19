{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    go
    delve
    gotests
    gosimports
    deno
    bun
    zig
  ];
}
