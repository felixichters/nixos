{... }:

{
	security.rtkit.enable = true;

	services.pipewire = { 
		enable = true; 
		alsa = {
			enable = true;
			support32Bit = true;
		};
		pulse.enable = true;
	};

	services.pulseaudio.enable = false;

	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = true;
	services.blueman.enable = true;
}
