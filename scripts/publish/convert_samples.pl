#!/usr/bin/perl
#multi-line in place substitute - subs.pl

my $file = shift;

die "Need a file to act upon.\n" if (not defined $file);

local $/ = undef;

open INFILE, $file or die "Could not open file. $!";
$string =  <INFILE>;
close INFILE;

$file =~ s/\.json$/.new.json/;

$string =~ s/\[\s+{\s+"name": /{\n      /g;
$string =~ s/"\s+},\s+{\s+"name": /",\n      /g;
$string =~ s/",\s+"value"/"/g;
$string =~ s/\s+}\s+]/\n  }/g;

open OUTFILE, ">", $file or die "Could not open file. $!";
print OUTFILE ($string);
close OUTFILE;
