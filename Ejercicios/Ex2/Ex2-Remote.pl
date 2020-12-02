use strict;
use warnings;
use Bio::Tools::Run::RemoteBlast;

my $dir = "inputs";
opendir DIR, $dir;
my @dir = readdir(DIR);
close DIR;

my $remoteBlast = Bio::Tools::Run::RemoteBlast->new(
    ( "-prog" => "blastp",
    "-data" => "swissprot",
    "-expect" => "1e-10",
    "-readmethod" => "SearchIO" )
);

foreach (@dir) {
    if (-f $dir . "/" . $_) {

        my $input = "inputs/" . $_;
        my $output = "outputs/" . $_ . ".out";

        my $r = $remoteBlast->submit_blast($input);

        while ( my @rids = $remoteBlast->each_rid ) {
            foreach my $rid ( @rids ) {
                my $rc = $remoteBlast->retrieve_blast($rid);
                if( !ref($rc) ) {
                    if( $rc < 0 ) {
                        $remoteBlast->remove_rid($rid);
                    }
                }
                else {
                    my $result = $rc->next_result();

                    $remoteBlast->save_output($output);
                    $remoteBlast->remove_rid($rid);
                }
            }
        }
    }
}