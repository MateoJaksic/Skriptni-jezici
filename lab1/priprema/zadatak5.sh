#!/bin/bash

# provjera broja argumenata
if [ "$#" -ne 2 ]; then
	echo "Unesen krivi broj argumenata."
	exit 1
fi

# provjera postoji li direktorij
if [ ! -d "$1" ]; then
	echo "Zadani direktorij $1 ne postoji. Ako želite trenutni direktorij možete koristiti $(pwd). "
	exit 1
fi

echo ""
echo "Kazalo: $1"
oblik=${2:1}
oblik=$(echo $oblik | grep -oE '\.[a-z]*')
echo "Oblik datoteke: *$oblik"
echo ""

find . -type f > datoteke.txt

while read line; do
	line=$(echo $line | grep -oE '[^./].+')
	ekstenzija=$(echo $line | grep -oE '\.[a-z]+')
	if [ ! -z $ekstenzija ]; then
		if [ $ekstenzija == $oblik ]; then
			brojlinija=$(($(wc -l < $line) + 1))
			echo "Broj linija: $brojlinija -- za $1/$line"
		fi
	fi
done < datoteke.txt

echo ""

rm datoteke.txt