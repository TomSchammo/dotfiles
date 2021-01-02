#!/bin/bash


filename="$HOME/Documents/Notes/note-$(date +%Y-%m-%d).md"

if [ ! -f ${filename} ]; then
    echo "# Notes for $(date +%Y-%m-%d)" > ${filename}
fi

nvim -c "norm Go" \
    -c "norm Go## $(date +%H:%M)" \
    -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" ${filename}
