#!/usr/bin/env bash
# DESCRIPTION
#   Fetch and install commotion wireless on Debian/Ubuntu/Mint
#
# USAGE
#   ./install-helper.bash [output-dir]
#
# @author: Édouard Lopez <dev+commotion-wireless@edouard-lopez.com>


url="http://downloads.commotionwireless.net/linux/"
outputDir="${1:-commotion-wireless}"

# @description Fetch package from official website
# @param    $1|outputDir  directory to store fetched packages
# @return    void
function getPackage() {
  args=(
    --no-verbose
    -P "$outputDir" --no-directories --no-host-directories
    --recursive --level=1 --no-parent --accept "*.deb"
  )

  wget "${args[@]}" "$url"
}


# @description check for missing dependencies and install
# @return    void
function install() {
  dpkg -i "$outputDir"/*.deb
  # resolve dependencies and try again
  apt-get install -f
  dpkg -i "$outputDir"/*.deb
}

# @description step to complete installation
# @return    void
function run-installer() {
  getPackage "$outputDir"
  install "$outputDir"
}

run-installer;
