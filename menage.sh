#!/bin/bash

CURRENT_DIRECTORY=`dirname $0`
echo current : $CURRENT_DIRECTORY

echo "préparation du dossier clean"
rm -rf $CURRENT_DIRECTORY/bazar_clean 
mkdir $CURRENT_DIRECTORY/bazar_clean bazar_clean/divers bazar_clean/images bazar_clean/videos 
mkdir -p $CURRENT_DIRECTORY/bazar_clean/images

echo $1

FILES=`find $CURRENT_DIRECTORY/bazar -type f`

echo ""


for FILE in $FILES
do
	echo "Fichier à transférer :"
	echo $FILE
	echo ""
	STAT=`file $FILE | grep 'image data'`
	if [ $? == 0 ]
	then
		echo "Image détectée: transfert dans le dossier images"
		cp $FILE $CURRENT_DIRECTORY/bazar_clean/images
	else
		STAT=`file $FILE | grep 'Media'`
		if [ $? == 0 ]
		then
			echo "Vidéo détectée: transfert dans le dossier videos"
			cp $FILE $CURRENT_DIRECTORY/bazar_clean/videos
		else
			echo "Pas d'extention spécifique détectée: transfert dans le dossier divers"
			cp $FILE $CURRENT_DIRECTORY/bazar_clean/divers
		fi
	fi
	echo ""
done
