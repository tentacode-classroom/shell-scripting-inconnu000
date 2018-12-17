#!/bin/bash

echo "préparation du dossier clean"
rm -rf ./bazar_clean 
mkdir ./bazar_clean bazar_clean/divers bazar_clean/images bazar_clean/videos 
mkdir -p ./bazar_clean/images/2018/{1..12}

echo $1

FILES=`find ./bazar -type f`

echo ""
echo "Fichiers à transférer :"

for FILE in $FILES
do
	echo $FILE
	if [file $FILE | grep 'image data']
	then
	else
	fi
done
