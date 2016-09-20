docker run --rm -i -t -v `pwd`:/vim -e "HOST_GID=`id -g`" -e "HOST_UID=`id -u`" adamw523/vim
