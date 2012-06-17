#!/bin/bash

#
## This script helps to check status of all git repositories under a directory
#

#
# update the below variable
# 
GITDIR='/e/mygithub/repos'


for gitdir in `find $GITDIR -name .git`; 
    do 
        workdir=${gitdir%/*}; 
        echo $workdir;
        git --git-dir=$gitdir --work-tree=$workdir status;
        echo "============================================";
        echo ;
    done    