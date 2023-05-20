#!/usr/bin/perl

# pokretanje "perl zadatak5.pl TestPrimjeri/rezultati.csv"

print "\n"; # samo zbog izgleda

$datoteka = $ARGV[0];

open LOG, "$datoteka";

$counter = 0;
$index = 0;
@imena;
@vrijednosti;
@izlaz;
while ($linija = <LOG>){
	chomp($linija);
	@rastav = split / /, "$linija"; 
	
	if ($rastav[0] ne "#"){
		if ($counter eq 0) {
			@faktori = split /;/, "$linija";
		} else {
			@podaci = split /;/, "$linija";
			$imena[$counter] = "$podaci[1], $podaci[2] ($podaci[0])";
			$vrijednosti[$counter] = 0;
	
			if ($podaci[3] ne "-") {
				$vrijednosti[$counter] += ($faktori[0] * $podaci[3]);
			}
			if ($podaci[4] ne "-") {
				$vrijednosti[$counter] += ($faktori[1] * $podaci[4]);
			}
			if ($podaci[5] ne "-") {
				$vrijednosti[$counter] += ($faktori[2] * $podaci[5]);
			}
			if ($podaci[6] ne "-") {
				$vrijednosti[$counter] += ($faktori[3] * $podaci[6]);
			}
			if ($podaci[7] ne "-") {
				$vrijednosti[$counter] += ($faktori[4] * $podaci[7]);
			}
			if ($podaci[8] ne "-") {
				$vrijednosti[$counter] += ($faktori[5] * $podaci[8]);
			}
			if ($podaci[9] ne "-") {
				$vrijednosti[$counter] += ($faktori[6] * $podaci[9]);
			}

			$izlaz[$index] = "%s\t: %2.2f\n", $imena[$counter], $vrijednosti[$counter];
			$index += 1;
		}

		$counter += 1;
	}
}

@kopije = @vrijednosti;
@kopije = reverse sort @kopije;

foreach $id1 (0..$index-1) {
	$pamti = 0;
	foreach $id2 (1..$index) {
		if ($kopije[$id1] eq $vrijednosti[$id2]) {
			printf "%2d. %-35s\t: %2.2f\n", $id1+1, $imena[$id2], $vrijednosti[$id2];
		}
	}
}

print "\n"; # samo zbog izgleda