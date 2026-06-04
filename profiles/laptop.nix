{
  system = { lib, ... }: {
    laptop.enable = lib.mkDefault true;
    printing.enable = lib.mkDefault true;
  };
}
