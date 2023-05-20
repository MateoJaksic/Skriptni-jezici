#!/bin/bash

# provjera broja argumenata
if [ "$#" -ne 1 ]; then
	echo "Unesen krivi broj argumenata."
	exit 1
fi

# provjera postoji li direktorij
if [ ! -d "$1" ]; then
	echo "Zadani direktorij $1 ne postoji."
	exit 1
fi

for logdatoteka in "$1"*.txt; do
	echo ""
	echo >> $logdatoteka
	> skraceno.txt
	prva_linija=$(head -n 1 $logdatoteka)
	datum=$(echo $prva_linija | grep -oE '[0-9]{2}/Feb/[0-9]{4}')
	dan=$(echo $datum | grep -oE '[0-9]{2}/')
	dan=$(echo $dan | grep -oE '[0-9]{2}')
	godina=$(echo $datum | grep -oE '[0-9]{4}')
	echo "datum: ""$dan""-02-""$godina" 
	echo "--------------------------------------------------"
	while read line;	do
		line=$(cut -d'"' -f2 <<< "$line")
		echo $line >> skraceno.txt
	done < $logdatoteka
	sort skraceno.txt | uniq -c | sort -r
done

echo ""

rm skraceno.txt