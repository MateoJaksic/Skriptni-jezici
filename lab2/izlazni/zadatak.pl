#!/usr/bin/perl

print "\n";

if (scalar @ARGV gt 0) {

	$datoteka = $ARGV[0];
	
	open LOG, "$datoteka";

	@adrese;
	@ponavljanje;
	$interni = 0;
	while ($linija = <LOG>) {
		chomp($linija);
		@rijeci = split / /, $linija;
		if ($rijeci[0] eq 'From:' && $rijeci[3] =~ /<.*@.*>/){
			#print "|$linija|\n";
			if (! grep {$_ eq $rijeci[3]} @adrese) {
				$adrese[$interni] = $rijeci[3];
				$ponavljanje[$interni] = 1;
				$interni += 1;
			} else {
				$counter = 0;
				foreach $adresa (@adrese) {
					if ($adresa eq $rijeci[3]) {
						$ponavljanje[$counter] += 1;
					}
					$counter += 1;
				}
			}
		}
	}

	@ispis;
	$brojac = 0;
	foreach $adresa (@adrese) {
		@zapis = split /</, $adresa;
		@zapis1 = split />/, $zapis[1];
		$ispis[$brojac] = "$ponavljanje[$brojac] $zapis1[0]";
		$brojac += 1;
	}

	@ponavljanje = sort @ponavljanje;
	
	for $broj (@ponavljanje) {
		foreach $line (@ispis) {
			@zapis = split / /, $line;
			if ($zapis[0] eq $broj) {
				printf "%50s: ", $zapis[1];
				foreach $id (1..$broj) {
					print "*";
				}
				print " ($broj)\n";
			}
		}
	}

	print "\n";
		

} else {

	@linije;
	$counter = 0;
	while (defined($linija = <>)) {
		$linije[$counter] = $linija;
		$counter += 1;
	}

	@adrese;
	@ponavljanje;
	$interni = 0;
	foreach $linija (@linije) {
		chomp($linija);
		@rijeci = split / /, $linija;
		if ($rijeci[0] eq 'From:' && $rijeci[3] =~ /<.*@.*>/){
			#print "|$linija|\n";
			if (! grep {$_ eq $rijeci[3]} @adrese) {
				$adrese[$interni] = $rijeci[3];
				$ponavljanje[$interni] = 1;
				$interni += 1;
			} else {
				$counter = 0;
				foreach $adresa (@adrese) {
					if ($adresa eq $rijeci[3]) {
						$ponavljanje[$counter] += 1;
					}
					$counter += 1;
				}
			}
		}
	}

	@ispis;
	$brojac = 0;
	foreach $adresa (@adrese) {
		@zapis = split /</, $adresa;
		@zapis1 = split />/, $zapis[1];
		$ispis[$brojac] = "$ponavljanje[$brojac] $zapis1[0]";
		$brojac += 1;
	}

	@ponavljanje = sort @ponavljanje;
	
	for $broj (@ponavljanje) {
		foreach $line (@ispis) {
			@zapis = split / /, $line;
			if ($zapis[0] eq $broj) {
				printf "%50s: ", $zapis[1];
				foreach $id (0..$broj) {
					print "*";
				}
				print " ($broj)\n";
			}
		}
	}
	
}