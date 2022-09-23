#!/usr/bin/bash
# input file = c3.tft.tft_legacy.v2022.1.Hs.symbols.gmt.txt
FILE=${1}

for i in $(cut -f 1,2 ${FILE}|sed -e 's/\t/|/') 
do 
	a=$(echo $i | cut -f 1 -d '|') 
	b=$(echo $i | cut -f 2 -d '|') 
	wget $b  
	cat $a |perl -e 'while(<>){if(m/<title>(\S+)</){$gs=$1}elsif(m/\[GeneSymbol=(\S+)\]/){$g=$1}} $g=$g||"NA";print "$gs\t$g\n" if $gs;' >> c3.tft.tft_legacy.v2022.1.Hs.symbols.INFO.txt
done
