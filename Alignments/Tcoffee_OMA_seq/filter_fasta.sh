#!/usr/bin/bash

if [ $# -lt 2 ]
then
	echo "Too few arguments"
	exit 1
fi

TMPNAME=$(uuidgen -r)

sed 's/\n/#\n/' $1 | sed 's/\n//g' | sed 's/>/\n>/g' > $TMPNAME

for id in $(cat $2)
do
	sed -i "/$id/d" $TMPNAME 
done

sed -l 60 's/#/\n/g' $TMPNAME

rm $TMPNAME
