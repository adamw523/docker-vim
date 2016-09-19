#! /bin/bash

# exit if UID or GID aren't set

id_error_msg="Please set the HOST_UID and HOST_GID environment variables"
[ -z "$HOST_UID" ] && { echo $id_error_msg; exit 1;}
[ -z "$HOST_GID" ] && { echo $id_error_msg; exit 1;}

dir_error_msg="Please mount work volume in /vim"
[ ! -d /vim ] && { echo $dir_error_msg; exit 1;}

# change vim UID to $UID
usermod -u $HOST_UID vim

# change vim GID to $GID
groupmod -g $HOST_GID vim

# sudo vim -c "cd /vim; ls -l; vim"

sudo -u vim /start_vim.sh

