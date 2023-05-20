#!usr/bin/perl

# pokretanje "perl zadatak4.pl TestPrimjeri/labosi-zakljucano.csv"

print "\n"; # samo zbog izgleda

if (scalar @ARGV gt 0) {
	
	foreach $datoteka (@ARGV){
		$counter = 0;
		open CONFIG, "$datoteka";
		while ($linija = <CONFIG>) {
	
			if ($counter ne 0) {
				chomp($linija);
		
				@rastav = split /;/, $linija;

				@termin = split /-/, $rastav[3];
				@termin_dan = split / /, $termin[2];
				@termin_sat = split /:/, $termin_dan[1];
				
				@zakljucano = split /-/, $rastav[4];
				@zakljucano_dan = split / /, $zakljucano[2];
				@zakljucano_sat = split /:/, $zakljucano_dan[1];
			
				if ($termin_dan[0] ne $zakljucano_dan[0] || $termin_sat[0] ne $zakljucano_sat[0]) {
					@bez_prostorije = split / /, $rastav[3];
					print "$rastav[0] $rastav[1] $rastav[2] - PROBLEM: ";
					print "$bez_prostorije[0] $bez_prostorije[1] ";
					print "--> $rastav[4]\n";
				}
			}

			$counter += 1;
		}
	}	
} else {
	print "Unesite podatke:\n";

	$counter = 0;
	while (defined($linija = <>)) {
		chomp($linija);

		@rastav = split /;/, $linija;

		@termin = split /-/, $rastav[3];
		@termin_dan = split / /, $termin[2];
		@termin_sat = split /:/, $termin_dan[1];
				
		@zakljucano = split /-/, $rastav[4];
		@zakljucano_dan = split / /, $zakljucano[2];
		@zakljucano_sat = split /:/, $zakljucano_dan[1];
			
		if ($termin_dan[0] ne $zakljucano_dan[0] || $termin_sat[0] ne $zakljucano_sat[0]) {
			@bez_prostorije = split / /, $rastav[3];
			$izlaz[$counter] = "$rastav[0] $rastav[1] $rastav[2] - PROBLEM: $bez_prostorije[0] $bez_prostorije[1] --> $rastav[4]\n";
			$counter += 1;
		}
	}
	
	print "\nIspis je:\n";
	foreach $zapis (@izlaz){
		print "$zapis";
	}
	
}

print "\n"; # samo zbog izgleda