#!/usr/bin/env bash
# DESCRIPTION
#   Fetch and install commotion wireless on Debian/Ubuntu/Mint
#
# USAGE
#   ./install-helper.bash [output-dir]
#
# @author: Édouard Lopez <dev+commotion-wireless@edouard-lopez.com>


url="http://downloads.commotionwireless.net/linux/"

# @description Fetch package from official website
# @param    $1|outputDir  directory to store fetched packages
# @return    void
function getPackage() {
  outputDir="${1:-commotion-wireless}"
  args=(
    --no-verbose
    -P "$outputDir" --no-directories --no-host-directories
    --recursive --level=1 --no-parent --accept "*.deb"
  )

  wget "${args[@]}" "$url"
}



# @description step to complete installation
# @return    void
function run-installer() {
  getPackage
}

run-installer;
