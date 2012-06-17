#!/bin/bash

#
# update the below variables
# 
ORG="myorg"
USER="user1"
PASS="pass1"
PULL_DIR="/e/_GEOGREP/github"


PWDIR=`pwd`;
API="https://api.github.com"
GITCMD="git pull git@github.com:"
    
echo "# getting list of repos..."
REPOLIST=`curl --silent -u $USER:$PASS ${API}/orgs/${ORG}/repos -q | grep name | awk -F': "' '{print $2}' | sed -e 's/",//g'`
 
for REPO in $REPOLIST; do     
 # pull command
 cd ${PULL_DIR}/${REPO};
 ${GITCMD}${ORG}/${REPO}.git
done

cd $PWDIR
 
#
# curl --silent -u user1:pass1 https://api.github.com/orgs/myorg/repos -q | grep name | awk -F':  {print } | sed -e s/,//g'
#
