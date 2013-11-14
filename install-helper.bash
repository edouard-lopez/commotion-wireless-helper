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
  args=(
    --no-verbose
    -P "$outputDir" --no-directories --no-host-directories
    --recursive --level=1 --no-parent --accept "*.deb"
  )

  wget "${args[@]}" "$url"
