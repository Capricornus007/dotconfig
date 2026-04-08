#!/bin/bash
DIR=/run/user/$(id -u)/$(echo $1 | sed -e "s/kdeconnect:\/\///")/storage/emulated/0
thunar -w $DIR
