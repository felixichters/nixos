{ config, lib, ... }:
{
  options.dns.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "systemd-resolved with DNS-over-TLS to Cloudflare";
  };

  config = lib.mkIf config.dns.enable {
    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNSSEC = "true";
        DNSOverTLS = "true";
        FallbackDNS = [
          "1.1.1.1#cloudflare-dns.com"
          "1.0.0.1#cloudflare-dns.com"
          "2606:4700:4700::1111#cloudflare-dns.com"
        ];
      };
    };
    networking.networkmanager.dns = "systemd-resolved";
  };
}
