#!usr/bin/perl

# pokretanje "perl zadatak3.pl log/localhost_access_log*.txt"

print "\n"; # samo zbog izgleda

foreach $datoteka (@ARGV){
	@rastav = split /\./, $datoteka;
	@datum = split /\[1]/, $rastav[1];
	print " Datum: $datum[0]\n";
	print " sat : broj pristupa\n";
	print "-------------------------------\n";

	open LOG, "$datoteka";
	
	@counter;
	while ($linija = <LOG>) {
		chomp($linija);
		@rastav = split /\[/, $linija;
		@vrijeme = split /:/, $rastav[1];
		$counter[$vrijeme[1]] += 1;
	}	

	$brojac = 0;
	foreach (0..23) {
		if ((10 - $brojac) gt 0){
			print "  0$brojac : $counter[$brojac]\n";
		}
		else {
			print "  $brojac : $counter[$brojac]\n";
		}
		$counter[$brojac] = 0;
		$brojac += 1;
	}
	
	print "\n";
}
