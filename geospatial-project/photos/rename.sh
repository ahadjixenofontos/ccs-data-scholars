#!/bin/bash

i = 0

while read -r line; do
	i=$((i+1))
	mv $line "photo$i.jpg"
done < photo-list
