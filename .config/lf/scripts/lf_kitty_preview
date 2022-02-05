#!/usr/bin/env bash
file=$1
w=$2
h=$3
x=$4
y=$5

if [[ "$( file -Lb --mime-type "$file")" =~ ^image ]]; then
    kitty +icat --silent --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file"
    exit 1
fi

pistol "$file"
