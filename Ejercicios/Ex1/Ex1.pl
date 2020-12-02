use warnings;
use strict;
use Bio::SeqIO;

my $seqio_obj = Bio::SeqIO->new(
    -file => "sequence.gb",
    -format => "genbank");

my $content;

while (my $seq_obj = $seqio_obj->next_seq) {
    $content = $seq_obj->translate(
        -orf => 1,
        -start => "atg")
        ->seq;
}

$content =~ s/(.{1,70})/$1\n/gs;

open my $handle, '>', 'sequenceOutput.fasta';

print $handle ">Secuencia del ARNm correspondiente al gen del Alzheimer", "\n";
print $handle $content;

close($handle);