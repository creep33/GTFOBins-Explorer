#!/bin/bash

# Terminal GTFObins-explorer by creep33 


# Colours
declare -r redColour="\e[0;31m\033[1m"
declare -r blueColour="\e[0;34m\033[1m"
declare -r endColour="\033[0m\e[0m"
declare -r greenColour="\e[0;32m\033[1m"
declare -r whiteColour="\033[1;37m"

ctrl_c()
{
	echo -e "\n\n[!] Saliendo...\n"
	exit 1
}

Help()
{
	echo -e "Tool developed by: ${whiteColour}creep33${endColour}"
	echo -e "\nUsage: ${greenColour}$0${endColour} [-f <path_to_file>] [<binary>]"
	echo -e "When matchen binary: ${greenColour}$0${endColour} ${redColour}<binary>${endColour} ${blueColour}<option>${endColour}\n"
	exit 1
}


GTFOBins-explore()
{
	GTFOBins_binaries=$(/bin/curl -s https://gtfobins.github.io/ | /bin/grep -oP "<li><a href=\"/gtfobins/.*?/" | /bin/tr '/' ' ' | /bin/sort -u | /bin/awk '{print $4}')
	look_for_binary=$(echo $1 | /bin/tr '[:upper:]' '[:lower:]')
	
	for binary in $GTFOBins_binaries; do
		if [ "$look_for_binary" = "$binary" ]
		then
			echo -e "\nMatched"
			echo -e "Visit --> https://gtfobins.github.io/gtfobins/${redColour}$binary${endColour}/\n"
			echo -e "Available options for ${redColour}$binary${endColour}:\n${blueColour}$(/bin/curl -s -X GET https://gtfobins.github.io/gtfobins/awk/ | html2text | /bin/grep \#\# | /bin/tr -d '\#')${endColour}\n"
			echo -e "Use: ${greenColour}$0${endColour} ${redColour}$binary${endColour} ${blueColour}<option>${endColour}\n"
		fi
	done
}


GTFOBins-Display-Option()
{
	echo -e " $0 $1 $2"
}


GTFOBins-File-explorer()
{
	GTFOBins_binaries=$(/bin/curl -s https://gtfobins.github.io/ | /bin/grep -oP "<li><a href=\"/gtfobins/.*?/" | /bin/tr '/' ' ' | /bin/sort -u | /bin/awk '{print $4}')
	look_for_binaries=$(/bin/cat $1 | /bin/tr '/' ' ' | /bin/awk NF{'print $NF'} | /bin/sort -u)
	for looking_binary in $look_for_binaries;do
		for binary in $GTFOBins_binaries;do
			if [ "$looking_binary" = "$binary" ]
			then
				echo -e "\nMatched binary: ${redColour}$binary${endColour}"
				echo -e "Visit --> https://gtfobins.github.io/gtfobins/${redColour}$binary${endColour}/\n"
			fi
		done
	done

}

trap ctrl_c INT

if [ $# == 1 ] 
then
	GTFOBins-explore $1
elif [ $# == 2 ]
then
	if [ $1 == "-f" ]
	then
		GTFOBins-File-explorer $2
	else
		GTFOBins-Display-Option $1 $2
	fi
else
	Help
fi
