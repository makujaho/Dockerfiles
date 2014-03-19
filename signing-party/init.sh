#!/bin/bash

if [[ $EUID -eq 0 ]]; then
   echo "YOU LITTLE PRICK...Start this script without root privs." 1>&2
   exit 1
fi

if [ "$(sudo docker images | grep "$(whoami)/signing" | wc -l)" -eq 0 ]; then
   sudo docker build -t="$(whoami)/signing" . 
fi;

sudo docker run -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/group:/etc/group:ro -v /home:/home:rw -u $(whoami) -e "HOME=${HOME}" -t "$(whoami)/signing" $@
