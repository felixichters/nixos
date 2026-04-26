{
  system = { lib, ... }: {
    nvidia.enable = lib.mkDefault true;
  };
}
