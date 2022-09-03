#!/bin/bash

# This scrip links the scripts from the repository into ~/.local/bin/ which
# should be part of $PATH.
# Symbolic links are created instead of moving or copying the files since it
# seems kind of silly to have duplicates around when version control exists.

current_dir=${PWD}

# finding the base directory of the repository
cd "$(git rev-parse --show-toplevel)"

git_base=${PWD}

utility_scripts=${git_base}/scripts/utility

# Creating ~/.local/bin/
mkdir ~/.local/bin/

cd ${utility_scripts}

# create link for every file/script
for file in *
do
    echo "linking" ${file}
    ln -s ${utility_scripts}/${file} ~/.local/bin/${file} &&
    echo "success!" || echo "error when linking" ${file} "to ~/.local/bin/"
done

# returning back to the original directory
cd {current_dir}
