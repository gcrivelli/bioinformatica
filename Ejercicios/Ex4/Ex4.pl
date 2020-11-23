use strict;
use warnings;
use Bio::SeqIO;
use Bio::SearchIO;
use Data::Dumper qw(Dumper);

my $dir = "../Ex2/outputs";
opendir DIR, $dir;
my @dir = readdir(DIR);
close DIR;

system("rm output.fasta");
open my $handle, '>', 'output.fasta';

print $handle "Hits que coinciden ", "\n\n";

foreach (@dir) {
    if (-f $dir . "/" . $_) {

        my $in = new Bio::SearchIO(-format => 'blast', -file => $dir . '/' . $_);

        while (my $result = $in->next_result) {
            while (my $hit = $result->next_hit) {
                while (my $hsp = $hit->next_hsp) {
                    if(defined($ARGV[0])) {
                        if (index($hit->description, $ARGV[0]) != -1) {
                            print $handle "Query: ", $result->query_name, " Hit: ", $hit->description,"\t",
                                $hsp->length('total'),"\t", $hsp->percent_identity,"\n";
                        }
                    }else{
                        print $handle "Query: ", $result->query_name, " Hit: ", $hit->description,"\t",
                            $hsp->length('total'),"\t", $hsp->percent_identity,"\n";
                    }
                }
            }
        }

    }
}

close($handle);