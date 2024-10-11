#!/bin/bash
obTags="tags: ["
vault_dirs=("00 - Maps of Content" "01 - Projects" "02 - Areas" "03 - Resources" "04 - Permanent" "05 - Fleeting" "06 - Daily" "07 - Archives")
number_args=0
args=()
path_Vault='/home/niek/Documents/Vault'
array_Path=()
start_Path="$PWD"

printchoice(){
	echo "choose a main Vault folder:"
	i=0
	for var in "${vault_dirs[@]}"
	do
		echo "[$i] $var"
		i=$((i+1))
	done
	read -p "Enter choice: " mainfolder
	echo
	if ! [[ $mainfolder = [0-9] ]]; then
		printchoice
	fi
	return "$mainfolder"
}

getchoice() {
case $1 in
	"00" | "0") path_Vault="$path_Vault/00 - Maps of Content";;
	"01" | "1") path_Vault="$path_Vault/01 - Projects";;
	"02" | "2") path_Vault="$path_Vault/02 - Areas";;
	"03" | "3") path_Vault="$path_Vault/03 - Resources";;
	"04" | "4") path_Vault="$path_Vault/04 - Permanent";;
	"05" | "5") path_Vault="$path_Vault/05 - Fleeting";;
	"06" | "6") path_Vault="$path_Vault/06 - Daily";;
	"07" | "7") path_Vault="$path_Vault/07 - Archives";;
	*)
		echo "Invalid input, try again"
		echo
		printchoice ;;
esac
}

checkSubFolder(){
	found=0
	for var in ${directories[@]}
	do
		if [ "${var}" = "${args[2]}" ]; then
			found=1
		fi
	done
	if [ $found -eq 0 ]; then
		echo "subfolder not found, exiting"
		exit 1
	fi
}

getSubFolders() {
	for (( i=2; i<$number_args; i++ ))
	do
		array_Path+=(${args[i]})
	done
	length=${#array_Path[@]}
}

getTagsAliases() {
	length=${#array_Path[@]}
	if [ "$length" -gt 5 ]; then
		for (( i=5; i<$length; i++ ))
		do
			if [ $i -eq 5 ]; then
				obName=${array_Path[i]:5}
				obName=$(tr '\ ' '-' <<< "$obName")
				obClass=$obName
				obTags="$obTags $obName"
			else
				obName=${array_Path[i]}
				obName=$(tr '\ ' '_' <<< "$obName")
				obTags="$obTags $obName"
			fi
		done
	fi
}
getDirectories() {
	cd "$path_Vault" || exit
	sleep 0.2
	# IFS="/" read -ra directories <<< "/"
	if [ ! -z "$(ls -A)" ]; then
		directories=( $(find * -maxdepth 0 -type d ) )
	else
		directories=()
	fi
	cd "$start_Path" || exit
}

printDirectories(){
	if [ "${#directories[@]}" != 0 ]; then
		echo "Choose a subfolder"
		i=1
		for var in "${directories[@]}"
		do
			echo "[$i] $var"
			i=$(($i + 1))
		done
		read -p "Enter choice: " subfolder
		if ((subfolder >= 1 && subfolder <= $i)); then
			array_Path+=(${directories[(($subfolder - 1))]})
			path_Vault="$path_Vault/${directories[(($subfolder - 1))]}"
			getDirectories
			echo
			printDirectories
		else
			echo "Invalid input, try again"
			printDirectories
		fi
	fi
}

createNode() {
	obTags="$obTags ]"
	obDate=$(/bin/date +%y-%m-%d)
	obTime=$(/bin/date +%H:%M:%S)
	obId="${args[0]}"
	Template="---\nid: $obId\nDate: $obDate $obTime\n$obTags\ncssclasses: [ $obClass ]\n---\n\n***\n\n# "
	path_Node="$path_Vault/${args[0]}.md"
	echo "$path_Node"
	if [ -e "$path_Node" ]; then
		echo "File ${args[0]}.md already exists!"
		exit 1
	else
		echo -e "$Template" >> "$path_Node"
		sleep 0.2
		nvim "$path_Node"
	fi
}

#### end of functions

IFS="/" read -ra array_Start <<< "$PWD"

# Check number of arguments given
for var in "$@"
do
  number_args=$((number_args+1))
  args+=($var)
done

# Check if Help is given or no input
if [ "$1" = "--help" ] || [ "$1" = "-h" ] || [ "$args" = 0 ]; then
	echo "fill in: filename | Main folder | subfolder 1 | subfolder ..."
	exit 2
fi

# TODO: list all folders, with subfolders
if [ "$2" = "-a" ] || [ "$2" = "--all" ]; then
	cd "$path_Vault" || exit

	directories=( $(find * -maxdepth 5 -type d ) )
	getDirectories
	printDirectories
fi
# Check if we are in the Obsidian Vault directory and in a Main directory
if [ $number_args -eq 1 ]; then
	printchoice
	choice=$?
	getchoice $choice
	# create array of path Vault
	IFS="/" read -ra array_Path <<< "$path_Vault"
	getDirectories
	printDirectories
elif [ ! "$2" = "" ]; then
	getchoice "$2"
	getDirectories
	# create array of path Vault
	IFS="/" read -ra array_Path <<< "$path_Vault"
	if [ ! "$3" = "" ]; then
		path_Vault=$path_Vault/"$3"
		echo $path_Vault
		# Check if folder exist
		if [ ! -d "$path_Vault" ]; then
			echo 'dir does not exist'
			mkdir $3
		fi
		checkSubFolder
		getSubFolders
	else
		printDirectories
	fi
fi
getTagsAliases
createNode
