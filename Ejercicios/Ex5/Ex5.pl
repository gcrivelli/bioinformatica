use strict;
use warnings;

system("rm outputORF.fasta");
system("rm output.patmatmotifs");

system("getorf", "-sequence", "../Ex1/INS-IGF2.fasta", "-outseq", "outputORF.fasta");

system("patmatmotifs", "-sequence", "outputORF.fasta", "-outfile", "output.patmatmotifs", "-full", "-sdbname1", "prosite.dat");