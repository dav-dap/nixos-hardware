{ lib, pkgs, ... }:

{
  imports = [
    ../../../common/cpu/amd
    ../../../common/gpu/nvidia.nix
    ../../../common/pc/laptop
    ../../../common/pc/laptop/acpi_call.nix
    ../../../common/pc/laptop/ssd
  ];

  # Specify bus id of Nvidia and Intel graphics.
  hardware.nvidia.prime = {
    amdgpuBusId = "PCI:5:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # Cooling management
  services.thermald.enable = lib.mkDefault true;

  # tlp defaults to "powersave", which doesn't exist on this laptop
  services.tlp.settings = {
    CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
  };
}
