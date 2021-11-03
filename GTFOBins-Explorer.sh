#!/bin/bash

ctrl_c()
{
	echo -e "\n\n[!] Saliendo...\n"
	exit 1
}

Help()
{
	echo -e "\nUsage: ./GTFOBins-Explorer.sh [-f <path_to_file>] [<binary>]\n"
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
			echo -e "Visit --> https://gtfobins.github.io/gtfobins/$binary/\n"
		fi
	done
}

GTFOBins-File-explorer()
{
	GTFOBins_binaries=$(/bin/curl -s https://gtfobins.github.io/ | /bin/grep -oP "<li><a href=\"/gtfobins/.*?/" | /bin/tr '/' ' ' | /bin/sort -u | /bin/awk '{print $4}')
	look_for_binaries=$(/bin/cat $1 | /bin/tr '/' ' ' | /bin/awk NF{'print $NF'} | /bin/sort -u)
	for looking_binary in $look_for_binaries;do
		for binary in $GTFOBins_binaries;do
			if [ "$looking_binary" = "$binary" ]
			then
				echo -e "\nMatched binary: $binary"
				echo -e "Visit --> https://gtfobins.github.io/gtfobins/$binary/\n"
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
		Help
	fi
else
	Help
fi
