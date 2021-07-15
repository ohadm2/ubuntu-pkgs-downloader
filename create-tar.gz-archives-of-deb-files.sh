#!/bin/bash

FOLDER_TO_WORK_ON=pkgs
ARCHIVES_DIR=archives

SCRIPT_LOC=$(pwd)

cd $SCRIPT_LOC

if [ -d "$FOLDER_TO_WORK_ON" ]; then
	INNER_FOLDERS=$(ls $FOLDER_TO_WORK_ON)

	if ! [ "$INNER_FOLDERS" == "" ]; then
		if ! [ -d "$ARCHIVES_DIR" ]; then
			echo "Could not find the folder "
			mkdir $ARCHIVES_DIR
		fi
		
		cd $FOLDER_TO_WORK_ON

		for i in $INNER_FOLDERS; do
			if [ -d "$i" ]; then
				echo "Found a dir called '$i' inside the dir '$FOLDER_TO_WORK_ON'. Compressing it ..."

				tar -czf $i.tar.gz $i

				mv $i.tar.gz $SCRIPT_LOC/$ARCHIVES_DIR/

				rm -rf $i
			fi
		done

		ls -l $SCRIPT_LOC/$ARCHIVES_DIR
	else
		echo "No folders found. Nothing to do. Exiting..."
	fi
else
	echo "ERROR! The given location '$FOLDER_TO_WORK_ON' is an invalid folder. Please fix and try again."
fi

