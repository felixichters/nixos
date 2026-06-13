{ ... }:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    banner = "little pig little pig, let me come in!";
    openFirewall = true;
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      UseDns = true;
      UsePAM = true;
      X11Forwarding = false;
      StrictModes = true;
      PermitRootLogin = "prohibit-password";
    };
  };
}
