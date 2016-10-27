#!/usr/bin/env bash
chown compiler:compiler /spj
echo 0 > /tmp/counter
core=$(grep --count ^processor /proc/cpuinfo)
n=$(($core*4))
gunicorn --workers $n --threads $n --error-logfile /log/gunicorn.log --time 600 --bind 0.0.0.0:8080 server:wsgiapp