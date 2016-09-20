FROM debian:jessie

RUN apt-get update -q
RUN apt-get install -qy curl git sudo

# user
RUN useradd -m vim -s /bin/bash

# vim
RUN apt-get install -qy vim

# other tools
RUN apt-get install -qy ack-grep most

# janus
RUN apt-get install -qy rake
USER vim
RUN HOME=/home/vim; curl -Lo- https://bit.ly/janus-bootstrap | bash

USER root

ADD vimrc.before /home/vim/.vimrc.before
ADD vimrc.after /home/vim/.vimrc.after

RUN chown -R vim:vim /home/vim

ADD entrypoint.sh /entrypoint.sh
ADD start_vim.sh /start_vim.sh

RUN chmod +x /entrypoint.sh
RUN chmod +x /start_vim.sh

ENTRYPOINT ["/entrypoint.sh"]
