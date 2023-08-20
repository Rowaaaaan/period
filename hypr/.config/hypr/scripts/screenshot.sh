#!/usr/bin/sh

# Take screenshot using grim and output to stdout, then edit using swappy
grim -g "$(slurp)" - | swappy -f -
