#!/usr/bin/perl

# pokretanje "perl zadatak1.pl"

print "\n"; # samo zbog izgleda

print "Unesite niz znakova: ";
chomp($niz = <STDIN>);
print "Unesite broj ponavljanja: ";
chomp($broj = <STDIN>);

print "\nIspis znakovnog niza $broj puta:\n";
foreach(1..$broj) {
	print "$niz\n";
}

print "\n"; # samo zbog izgleda

