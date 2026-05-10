pkgs:

with pkgs;
[
  # Browsers
  chromium
  firefox
]
++ [
  # Communication
  element-desktop
  signal-desktop
]
++ [
  # Learning
  anki
]
++ [
  # Terminal mainstays
  atuin
  bat
  btop
  ghostty
  git
  git-lfs
  helix
  jq
  ripgrep
  starship
  tmux
]
++ [
  # Shell
  oh-my-zsh
  zsh
]
++ [
  # Development
  cargo
  clang
  forgejo-cli
  go
  just
  julia_110
  mise
  nasm
  nodejs
  rust-analyzer
  uv
  zed-editor
  zls
]
++ [
  # Wayland desktop
  kanshi
  slurp
  sway
  swaybg
  swaylock
  wdisplays
  xwayland-satellite
  waybar
  grim # screenshot functionality
  slurp # screenshot functionality
  wl-clipboard # wl-copy and wl-paste
  mako
]
++ [
  # Media and files
  ffmpeg
  pulsemixer
  unzip
  xfce.thunar
  xz
]
++ [
  # Security and secrets
  gnupg
  sops
  ssh-to-age
]
++ [
  # System and networking
  acpi
  arp-scan
  nh
  picocom
  rainfrog
  sshpass
  dnsmasq
  bind
]
++ [
  # Miscellaneous
  grip
  libsecret
  zig
  virt-manager
  pkg-config
  docker
  networkmanagerapplet
]
