#!/bin/bash

# provjera broja argumenata
if [ "$#" -ne 2 ]; then
	echo "Unesen krivi broj argumenata. Potrebno je upisati dva argumenta."
	exit 1
fi

# provjera postoji li direktorij
if [ ! -d "$1" ]; then
	echo "Zadani direktorij $1 ne postoji. Potrebno je navesti dva direktorija koji postoje."
	exit 1
fi

# provjera postoji li direktorij
if [ ! -d "$2" ]; then
	echo "Zadani direktorij $2 ne postoji. Potrebno je navesti dva direktorija koji postoje."
	exit 1
fi

echo ""

find "$1" -type f > datoteke1.txt
find "$2" -type f > datoteke2.txt

i=0
while read line1; do
	uzorak1=$(basename "$line1")
	while read line2; do
		uzorak2=$(basename "$line2")
		if [ "$uzorak1" == "$uzorak2" ]; then
			i=$(($i + 1))
			if [ "$1/$uzorak1" -nt "$2/$uzorak2" ]; then
				echo "../$1/$uzorak1 --> ../$2"
			fi
		fi
	done < datoteke2.txt
	if [ "$i" -ne 1 ]; then
		echo "../$1/$uzorak1 --> ../$2"
	fi
	i=0
done < datoteke1.txt

i=0
while read line1; do
	uzorak1=$(basename "$line1")
	while read line2; do
		uzorak2=$(basename "$line2")
		if [ "$uzorak1" == "$uzorak2" ]; then
			i=$(($i + 1))
			if [ "$2/$uzorak1" -nt "$1/$uzorak2" ]; then
				echo "../$2/$uzorak1 --> ../$1"
			fi
		fi
	done < datoteke1.txt
	if [ "$i" -ne 1 ]; then
		echo "../$2/$uzorak1 --> ../$1"
	fi
	i=0
done < datoteke2.txt

echo ""

rm datoteke1.txt
rm datoteke2.txt