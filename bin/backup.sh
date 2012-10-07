#!/usr/bin/env zsh

# hdiutil attach /Volumes/Junior/Sundsvall.sparsebundle

# Backup local documents
echo "Backing up ~/Documents"
rsync -arvpz --delete ~/Documents admin@home.cubicphuse.nl:/share/HDA_DATA/Backup/random/
