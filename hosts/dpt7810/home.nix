{ user, ... }:

{
  imports = [ ../../modules/home ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";
  home.stateVersion = "24.05";
}
