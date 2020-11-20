use strict;
use warnings;

my $dir = "inputs";
opendir DIR,$dir;
my @dir = readdir(DIR);
close DIR;

if(0) {
    system("makeblastdb", "-in", "swissprot", "-dbtype", "prot", "-out", "resultado.out");
}

foreach(@dir){
    if (-f $dir . "/" . $_ ){
        system("blastp", "-db", "resultado.out"
            ,"-query", "inputs/" . $_, "-out", "outputs/" . $_ . ".out");
    }
}