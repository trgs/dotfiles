#!/bin/bash

echo "[+] Updating from git"
git pull

echo "[+] Downloading all Vim plugins"
vim +PluginInstall +qall

echo "[+] Done!"
