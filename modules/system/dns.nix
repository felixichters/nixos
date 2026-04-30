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
        DNSSEC = "allow-downgrade";
        DNSOverTLS = "opportunistic";
        DNS = [
          "1.1.1.1#cloudflare-dns.com"
          "1.0.0.1#cloudflare-dns.com"
          "2606:4700:4700::1111#cloudflare-dns.com"
        ];
        FallbackDNS = [
          "9.9.9.9#dns.quad9.net"
          "149.112.112.112#dns.quad9.net"
        ];
      };
    };
    networking.networkmanager.dns = "systemd-resolved";
  };
}
