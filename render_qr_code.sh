#! /usr/bin/env bash
# Copyright (C) Sebastian Pipping <sebastian@pipping.org>
# Licensed under CC-BY-SA 4.0

filename="$1"
text="$2"

set -e
set -x

qrencode -m 20 -s 3 -o "${filename}" "${text}"
convert -colorspace RGB -fill '#5347bf' -opaque '#ffffff' "${filename}" "${filename}"
optipng -o7 "${filename}"
