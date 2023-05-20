#!/bin/bash

# provjera broja argumenata
if [ "$#" -ne 1 ]; then
	echo "Unesen krivi broj argumenata. Potrebno je unijeti 1 argument."
	exit 1
fi

# provjera postoji li direktorij
if [ ! -d "$1" ]; then
	echo "Zadani direktorij $1 ne postoji. Potrebno je unijeti ime direktorija u kojem se nalaze fotografije."
	exit 1
fi

> sortslika.txt
for datoteka in "$1"/*.jpg; do
	ime=$(echo "$datoteka" | grep -oE '[0-9]{8}_[0-9]{4}.jpg')
	godina=$(echo "$ime" | cut -c 1-4)
	mjesec=$(echo "$ime" | cut -c 5-6)
	dan=$(echo "$ime" | cut -c 7-8)
	sati=$(echo "$ime" | cut -c 10-11)
	minute=$(echo "$ime" | cut -c 12-13)
	echo "$godina/$mjesec/$dan/$sati/$minute/$ime" >> sortslika.txt
done

sort sortslika.txt >> sort

proslimjesec=""
proslagodina=""
while read line; do
	godina=$(echo "$line" | cut -c 1-4)
	mjesec=$(echo "$line" | cut -c 6-7)
	if [ "$proslimjesec" != "$mjesec" -o "$proslagodina" != "$godina" ]; then
		if [ "$proslimjesec" != "" ]; then
			echo "--- Ukupno: $i slika -----"
		fi
		echo ""
		godina=$(echo "$line" | cut -c 1-4)
		mjesec=$(echo "$line" | cut -c 6-7)
		echo "$mjesec"-"$godina"" :"
		echo "----------"
		i=0
		proslimjesec="$mjesec"
		proslagodina="$godina"
	fi
	i=$(($i + 1))
	naziv=$(echo "$line" | cut -c 18-35)
	echo "   $i. $naziv"
done < sortslika.txt

echo "--- Ukupno: $i slika -----"
echo ""

rm sortslika.txt
rm sort