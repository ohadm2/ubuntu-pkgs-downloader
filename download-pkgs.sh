#!/bin/bash

apt-get --allow-insecure-repositories update

FOLDER_TO_WORK_ON=pkgs

# we will check if the given param is not empty only for the 1st param so that we won't get an error about too many params when a list is given
if ! [ "$1" == "" ]; then
	PKGS_NAMES=$@

 	for i in $PKGS_NAMES; do
		VERSION_PREFIX=$(cat /etc/os-release | grep PRETTY_NAME | awk -F\" '{print $2}' | tr " " "_")		

		PKG_DIR=$VERSION_PREFIX-$i		
 
		mkdir -p /$FOLDER_TO_WORK_ON/$PKG_DIR
	
		apt-get download --allow-unauthenticated -y --download-only -o Dir::Cache::archives="/$FOLDER_TO_WORK_ON/$PKG_DIR" -o Dir::Cache="/tmp/" $i
	done
else
	echo "Error! Wrong usage."
	echo "Only give a name of a single pkg to install e.g. open-vm-tools"
fi

