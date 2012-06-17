#!/bin/bash

#
# update the below variables
# 
ORG="myorg"
USER="user1"
PASS="pass1"
CLONE_DIR="/e/_GEOGREP/github"

rm -rf $CLONE_DIR
mkdir -p $CLONE_DIR
API="https://api.github.com"
GITCMD="git clone git@github.com:"
    
echo "# Getting the list of repos ..."
REPOLIST=`curl --silent -u $USER:$PASS ${API}/orgs/${ORG}/repos -q | grep name | awk -F': "' '{print $2}' | sed -e 's/",//g'`
 
for REPO in $REPOLIST; do     
 # clone command
 ${GITCMD}${ORG}/${REPO}.git ${CLONE_DIR}/${REPO}
done
 
#
# curl --silent -u user1:pass1 https://api.github.com/orgs/myorg/repos -q | grep name | awk -F':  {print } | sed -e s/,//g'
#