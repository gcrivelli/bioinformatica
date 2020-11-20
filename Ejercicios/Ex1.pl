use warnings;
use strict;
use Bio::SeqIO;

$seqio_obj = Bio::SeqIO->new(-file => "INS-IGF2.gb", -format => "genbank");

open my $handle, '>', 'INS-IGF2.fasta';

while ($seq_obj = $seqio_obj->next_seq) {
    print $handle $seq_obj->seq, "\n";
}

close($seq_obj);