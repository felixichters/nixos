{ ... }:

{
  programs.ranger = {
    enable = true;
    settings = {
      #show_hidden = true;
    };
    rifle = [
      { condition = "mime ^text"; command = ''nvim -- "$@"''; }
      { condition = "mime ^text, label pager"; command = ''"$PAGER" -- "$@"''; }

      { condition = "ext json|xml|yaml|toml|csv"; command = ''nvim -- "$@"''; }
      { condition = "ext py|sh|rb|pl|js|ts|lua|nix|cpp|c|h|hpp|rs|go|tex"; command = ''nvim -- "$@"''; }

      { condition = "ext pdf"; command = ''firefox -- "$@"''; }

      { condition = "ext png|jpg|jpeg|gif|webp|bmp|svg"; command = ''feh -- "$@"''; }

      { condition = "ext zip"; command = ''unzip -- "$@"''; }
      { condition = "ext tar|gz|bz2|xz|zst"; command = ''tar xf "$@"''; }
      { condition = "ext 7z"; command = ''7z x -- "$@"''; }
    ];
  };
}
