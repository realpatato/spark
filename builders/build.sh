#!/bin/bash
set -e

WX_WIDGETS_DIR="../wxWidgets"

if [ ! -d $WX_WIDGETS_DIR ]; then
    echo "wxWidgets does not exist, creating now..."
    git clone https://github.com/wxWidgets/wxWidgets.git $WX_WIDGETS_DIR || { echo >&2 "ERROR: wxWidgets clone failed!"; rm -r $WX_WIDGETS_DIR; exit 1; }
else
    echo "wxWidgets already exists!"
fi