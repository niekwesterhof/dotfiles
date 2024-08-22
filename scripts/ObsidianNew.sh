#!/bin/bash
obTags="tags: ["
IFS="/" read -ra array <<< $PWD
length=${#array[@]}
if [ $length -gt 5 ]; then
	for (( i=5; i<$length; i++ ))
	do
		if [ $i -eq 5 ]; then
			obName=${array[i]:5}
			obName=`tr '\ ' '-' <<< $obName`
			obClass=$obName
			obTags="$obTags $obName"
		else
			obName=${array[i]}
			obName=`tr '\ ' '_' <<< $obName`
			obTags="$obTags $obName"
		fi
	done
fi
obTags="$obTags ]"

obDate=`/bin/date +%y-%m-%d`
obTime=`/bin/date +%H:%M:%S`
obId="$1"
Template="---\nid: $obId\nDate: $obDate $obTime\n$obTags\ncssclasses: [ $obClass ]\n---\n\n***\n\n### "

if [ -z "$2" ]; then
	echo -e $Template >> "$1.md"
else
	if [ -z "$1" ]; then
		nvim "$obDate-$obTime.md"
	else
		if [ -e "$1.md" ]; then
			echo "File $1.md already exists!"
			exit 1
		else
			echo -e $Template >> "$1.md"
			sleep 0.2
			nvim "$1.md"
		fi
	fi
fi
