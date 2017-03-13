#!/bin/bash

# create folders just in case
mkdir -p $HOME/.local/share/applications/
mkdir -p $HOME/.local/share/icons/hicolor/scalable/apps

for folder in ./*/
do
    if [ -f $folder/Dockerfile ]
    then
        cd $folder
        build_name=${PWD##*/}
        docker build -t $build_name .

        cp *.desktop $HOME/.local/share/applications/
        cp *.svg $HOME/.local/share/icons/hicolor/scalable/apps
    fi
done
