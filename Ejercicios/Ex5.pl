use warnings;
use strict;
use Bio::Factory::EMBOSS;
use Bio::AlignIO;

$f = Bio::Factory::EMBOSS->new();

$water = $f->program('water') || die "Program not found!\n";

my $wateroutfile = 'out.water';

$water->run({-asequence => $seq_object,
    -bsequence => \@seq_objects,
    -gapopen   => '10.0',
    -gapextend => '0.5',
    -outfile   => $wateroutfile});

my $alnin = Bio::AlignIO->new(-format => 'emboss',
    -file   => $wateroutfile);

while ( my $aln = $alnin->next_aln ) {

}