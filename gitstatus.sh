#!/bin/bash

#
# update the below variable
# 
GITDIR='/e/_GEOGREP/github'


for gitdir in `find $GITDIR -name .git`; 
    do 
        workdir=${gitdir%/*}; 
        echo $workdir;
        git --git-dir=$gitdir --work-tree=$workdir status;
        echo "============================================";
        echo ;
    done    