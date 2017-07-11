#!/usr/bin/bash

i = 0

while read line
do
	mv $line face$i.jpg
	((i++))
done < faceslist.txt
