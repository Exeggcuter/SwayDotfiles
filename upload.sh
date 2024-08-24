#!/bin/bash
dirConfig=$HOME/.config

echo "Copy $HOME/.config into github local repository..."

rm -rf .config
cp -r ${dirConfig}  .


echo "Done!"