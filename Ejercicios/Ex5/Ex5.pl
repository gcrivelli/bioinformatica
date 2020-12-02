use strict;
use warnings;

system("sixpack", "-sequence", "alzheimer.fasta", "-outseq", "result", "-reverse", "Y", "-outfile", "rfsOutput.txt");

system("patmatmotifs", "-sequence", "../Ex1/sequenceOutput.fasta", "-outfile", "output.patmatmotifs", "-full");