#!/bin/bash

# NOTE: THIS SCRIPT WILL DO THE PREPARATIONS FOR THE LINKING SCRIP TO RUN.
#       IN ORDER FOR THE LINKING SCRIPT TO WORK THE SAME FILES CANNOT EXIST
#       SO THIS SCRIPT WILL TAKE CARE OF THOSE.
#       THEY WILL BE STORED IN `~/.tmp/backup` FOR RECOVERY.
#       THEY WILL NOT BE DELETED.

BACKUP_LOCATION="${HOME}/.tmp/backup"

mkdir -p ${BACKUP_LOCATION}

echo "Moving files in ${HOME}"

mv -v ${HOME}/zshrc ${BACKUP_LOCATION}

echo "Moving files in ${XDG_CONFIG_HOME}"

mv -v ${XDG_CONFIG_HOME}/zsh ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/tmux ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/alacritty ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/nvim ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/zathura ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/mpd ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/ncmpcpp ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/rofi ${BACKUP_LOCATION}
mv -v ${XDG_CONFIG_HOME}/fusuma ${BACKUP_LOCATION}