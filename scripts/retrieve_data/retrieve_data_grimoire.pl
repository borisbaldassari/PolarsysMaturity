#! perl
#
#
#
#
#

use strict;
use warnings;

use Data::Dumper;
use JSON qw( encode_json );
use XML::LibXML;
use LWP::Simple;

# This can be changed for more verbose output
my $debug = 1;
my $base_url = "http://projects.eclipse.org/json/project/";

die "Usage: $0 project_id dir_out\n" if (scalar @ARGV != 2);

my $project_id = shift;
my $dir_out = shift;

my $url = "http://dashboard.eclipse.org/data/json/" 
    . $project_id 
    . "-grimoirelib-prj-static.json";
my $file_out = $dir_out . "/" . $project_id . "_metrics_grimoire.json";

# Fetch json file from the dashboard.eclipse.org
print "Fetching file from [$url].\n";
my $content = getstore($url, $file_out);
print "HTTP response is [$content].\n";
 
print "Finished importing data from Grimoire.\n";
