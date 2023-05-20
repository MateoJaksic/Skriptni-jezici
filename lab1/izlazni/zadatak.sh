#!/bin/bash

# provjera argumenata
if [ "$#" -ne 1 ]; then
	echo "Krivi broj argumenata. Argument treba biti ime željene datoteke koja se nalazi u tekućem kazalu (npr. passwd.txt)."
	exit 1
fi

# dodavanje praznog reda na zadanu datoteku kako bi mogli raditi sa zadnjim redom
echo "" >> $1

# dobivanje podataka
while read line; do
	reducirano=$(echo "$line" | grep -oE '[a-z]* [A-Z][a-z]*')
	prezime=$(echo "$reducirano" | grep -oE '[A-Z][a-z]*')
	echo $prezime >> prezimena.txt
done < $1

# sortiranje podataka
sort prezimena.txt | uniq -c | sort -r > sortirano.txt

# ispis podataka
while read line; do
	echo "    $line"
done < sortirano.txt

# brisanje pomocnih datoteka
rm prezimena.txt
rm sortirano.txt