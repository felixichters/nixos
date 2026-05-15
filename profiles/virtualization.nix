{
  system = { lib, ... }: {
    virtualization.enable = lib.mkDefault true;
  };
}
