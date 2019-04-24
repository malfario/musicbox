# musicbox

Some scripts to create a RPI musicbox with a [HifiBerry DAC][https://www.hifiberry.com/] on [PI Zero][https://www.raspberrypi.org/products/raspberry-pi-zero/] with Raspbian Stretch

## Included software

- Spotify Connect Server: [spotifyd][https://github.com/Spotifyd/spotifyd]
- Plex Audio Player: [plexamp][https://plexamp.com/]
- MPD with TuneIn and Spotify Integration: [mopidy][https://www.mopidy.com/]
- Bluetooth Audio: [bluealsa][https://github.com/Arkq/bluez-alsa]

## Inspired by

THX to
- @nicokaiser for his scripts in [nicokaiser/rpi-audio-receiver][https://github.com/nicokaiser/rpi-audio-receiver] (Bluetooth and Spotifyd)
- @woutervanwijk and contributors for the [Pi MusicBox][https://www.pimusicbox.com] [project][https://github.com/pimusicbox/pimusicbox]

## Setup

- Install [Raspbian Stretch Lite][https://www.raspberrypi.org/downloads/raspbian/] on a SD card
- Insert SD card into your PI (Zero), connect HDMI and a keyboard
- Power up PI (Zero)
- Login with pi / raspberry
- Configure RPI
  - `sudo raspi-config`
  - `2 Network Options`
  - WIFI: `N2 Wi-fi`
  - Optional Hostname: `N1 Hostname`
- Important: change the password of the user `pi`
  - `passwd`
- Get IP
  - `sudo reboot`
  - If your WIFI configuration is OK, the IP got by DHCP is printed some lines before the logon prompt.
  - If you don't so an IP on the boot screen, logon with `pi / raspberry` and type `sudo ip addr list`. The IP should be listed at the interface `wlan0`.
  - If you do not see an IP at `wlan0`, do the configuration of the WIFI again :)
- SSH to your PI (from Windows - Putty, or from Linux - ssh). Example below shows a Linux SSH connection. Insert your IP instead of 10.10.10.10
  - `ssh pi@10.10.10.10`
  - Password: `raspberry`
- Install GIT
  - `sudo apt update`
  - `sudo apt upgrade`
  - `sudo install git`
- Clone this repository
  - `sudo su -`
  - `mkdir ~/sw`
  - `cd ~/sw`
  - `git clone https://github.com/snorre-k/musicbox.git`
- Start the Installation
  - `cd musicbox/scripts`
  - `./start_install.sh`

## Single components installation

Single components can be installed by changing to the relevant subdirectory and starting `./install.sh`

## Additional PI config`

- NTP - use DHCP supplied DHCP servers: `./scripts/ntp_dhcp.sh`
- VIM installation including some configuration: `./scripts/vim.sh`

## Warning

The scripts do have only minimal error handling. If something goes wrong, most of the time the scripts do not try to solve this or stop.