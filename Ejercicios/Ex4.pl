use strict;
use warnings;
use Bio::SeqIO;
use Bio::SearchIO;
use Data::Dumper qw(Dumper);

print Dumper @ARGV[0];

my $dir = "outputs";
opendir DIR, $dir;
my @dir = readdir(DIR);
close DIR;

foreach (@dir) {
    if (-f $dir . "/" . $_) {

        my $in = new Bio::SearchIO(-format => 'blast', -file => 'outputs/' . $_);

        while (my $result = $in->next_result) {
            while (my $hit = $result->next_hit) {
                while (my $hsp = $hit->next_hsp) {
                    if (index($hit->description, @ARGV[0]) != -1) {
                        printf("Query: %s Hit: %s\t%d\t%1.1f\n", $result->query_name, $hit->description,
                            $hsp->length('total'), $hsp->percent_identity);
                    }
                }
            }
        }

    }
}