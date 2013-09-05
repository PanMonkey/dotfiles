#!/bin/bash

cd `dirname $0`
CURRENT_DIR=$PWD
WORKING_DIR=$CURRENT_DIR/tmp

mkdir -p $WORKING_DIR

print() {
    printf "\033[1;32m$*\033[0;39m\n"
}


now=`date '+%Y%m%d%H%M%S'`
mkdir $CURRENT_DIR/backups/$now
for dotfile in .?*; do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]; then
        if [ -e $HOME/$dotfile ]; then
            mv $HOME/$dotfile $CURRENT_DIR/backups/$now
        fi
        ln -s $CURRENT_DIR/$dotfile $HOME
    fi
done


