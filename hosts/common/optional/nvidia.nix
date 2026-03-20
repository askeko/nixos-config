{config, ...}: {
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required for most Wayland compositors
    modesetting.enable = true;

    # Use the open source kernel module (for Turing+ GPUs)
    # Set to false if you have an older GPU or run into issues
    open = true;

    # Enable the settings menu (nvidia-settings)
    nvidiaSettings = true;

    # Use the stable driver package
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
