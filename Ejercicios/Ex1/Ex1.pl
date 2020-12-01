use warnings;
use strict;
use Bio::SeqIO;

my $seqio_obj = Bio::SeqIO->new(
    -file => "sequence.gb",
    -format => "genbank");

open my $handle, '>', 'sequence.fasta';

while (my $seq_obj = $seqio_obj->next_seq) {
    print $handle $seq_obj->translate->seq, "\n";
}

close($handle);