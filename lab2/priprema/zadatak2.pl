#!/usr/bin/perl

# pokretanje "perl zadatak2.pl"

print "\n"; # samo zbog izgleda

print "Unesite niz brojeva (za prekid učitavanja stisnite CTRL+D): \n";

$counter = 0;
$suma = 0;
@lista;
while (defined($redak = <>)) {
	chomp($redak);
	$lista[$counter] = $redak;
	$suma += $lista[$counter];
	$counter += 1;
}

$avg = $suma / $counter;
print "\nNiz brojeva u listi je: @lista\n";
print "Aritmetička sredina je $avg\n";

print "\n"; # samo zbog izgleda
