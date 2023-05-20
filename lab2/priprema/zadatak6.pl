#!/usr/bin/perl

# pokretanje "perl zadatak6.pl TestPrimjeri/notturno.txt 4"

use open ':locale';
use utf8;

if (scalar @ARGV gt 0) {

	foreach $i (0..$#ARGV-1) {

		print "\n"; # samo zbog izgleda
		
		$datoteka = $ARGV[i];
		$broj = $ARGV[-1];

		open LOG, "$datoteka";

		@rijeci;
		@uzorci;
		$counter = 0;
		$interni = 0;
		$index = 0;

		while ($linija = <LOG>) {
			@zapis = ($linija =~ /([a-zšđčćž]+)/ig);
	
			foreach $rijec (@zapis) {
				$rijec = "\L$rijec\E";
				$rijeci[$counter] = $rijec;
				$duljina = length $rijec;
				if ($duljina ge $broj) {
					$uzorak = substr($rijec, 0, $broj);
					if (! grep {$_ eq $uzorak} @uzorci) {
						$uzorci[$interni] = $uzorak;
						$interni += 1;
					}
				$counter += 1;	
				}			
			}
		}

		foreach $uzorak (@uzorci) {
			$kolicina = 0;
			foreach $rijec (@rijeci) {
				$prefiks = substr($rijec, 0, $broj);
				if ($uzorak eq $prefiks) {
					$kolicina += 1;
				}
			}
			$izlaz[$index] = "$uzorak : $kolicina\n";
			$index += 1;
		}	

		@izlaz = sort @izlaz;

		foreach $linija (@izlaz) {
			print "$linija";
		}
	
	}
} else {
	print "Unesite podatke:\n";

	@linije;
	$broj = 4;
	$counter = 0;
	while (defined($linija = <>)) {
		$linije[$counter] = $linija;
		$counter += 1;
	}
	
	print "\n";
	
	@rijeci;
	@uzorci;
	$counter = 0;
	foreach $red (@linije) {
		@zapis = split / /, $red;
		foreach $rijec (@zapis) {
			$rijec = "\L$rijec\E";
			$rijeci[$counter] = $rijec;
			$duljina = length $rijec;
			if ($duljina ge $broj) {
				$uzorak = substr($rijec, 0, $broj);
				if (! grep {$_ eq $uzorak} @uzorci) {
					$uzorci[$interni] = $uzorak;
					$interni += 1;
				}
			$counter += 1;	
			}			
		}		
	}
	
	
	foreach $uzorak (@uzorci) {
		$kolicina = 0;
		foreach $rijec (@rijeci) {
			$prefiks = substr($rijec, 0, $broj);
			if ($uzorak eq $prefiks) {
				$kolicina += 1;
			}
		}
		$izlaz[$index] = "$uzorak : $kolicina\n";
		$index += 1;
	}

	@izlaz = sort @izlaz;

	foreach $linija (@izlaz) {
		print "$linija";
	}
	
}

print "\n"; # samo zbog izgleda