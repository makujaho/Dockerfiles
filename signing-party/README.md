signing-image
=============

    USAGE: ./init.sh whoami

    sudo docker run -v /etc/passwd:/etc/passwd:ro -v /etc/shadow:/etc/shadow:ro -v /etc/group:/etc/group:ro -v /home:/home:rw -u $(whoami) -e "HOME=${HOME}" -t "$(whoami)/signing" $@

You have to map passwd, shadow, group and homes inside the docker container on startup
or you won't get to see your keys...

you are creating a virtual environment.

start.sh can be called. It checks if a docker image whoami/signing exists and uses that.
If not, it asks if it should build this image.

Please start init.sh without root privileges.

