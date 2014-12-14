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

die "Usage: $0 project_id url dir_out\n" if (scalar @ARGV != 3);

my $project_id = shift;
my $url = shift;
my $dir_out = shift;

# Fetch XML file from the marketplace
my $content = get($url);
#die "Could not get [$url]!" unless defined $content;

my $favs = 0;
my $dl = 0;

my $fetch_date = localtime();

# Write this to a json file.
my $metrics_project = {
    "name" => "PMI Metrics for $project_id",
    "project" => $project_id,
    "version" => $fetch_date,
    "children" => {},
};

if (defined($content)) {
    my $parser = XML::LibXML->new;
    my $doc = $parser->load_xml(string => $content);
    
    my @nodes_name = $doc->findnodes("//node");
    my @name_attrs = $nodes_name[0]->attributes();
    my $name = "undef";

    foreach my $attr (@name_attrs) {
	if ($attr->nodeName() eq 'name') {
	    $name = $attr->getValue();
	}
    }
    my @nodes_fav = $doc->findnodes("//favorited");
    $favs = $nodes_fav[0]->textContent();
    $metrics_projects->{"children"}->{"MKT_FAV"} = $favs;
    my @nodes_dls = $doc->findnodes("//installsrecent");
    $dl = $nodes_dls[0]->textContent();
    $metrics_projects->{"children"}->{"MKT_INSTALL_SUCCESS_1M"} = $favs;
}


# Write this to a json file.

my $json_out = encode_json( $metrics_project );
my $file_json_out = $dir_out . "/" . $project_id . "_metrics_marketplace.json";
print "  Writing json file to $file_json_out.\n";
open my $fh, ">", $file_json_out;
print $fh $json_out;
close $fh;

# # Write this to a csv file
# my $csv_out = "project,mkt_fav,mkt_install\n";
# $csv_out .= $project_id . "," . $favs . ", " . $dl . "\n";

# my $file_csv_out = $project_id . "_metrics_marketplace.csv";
# print "  Writing csv file to $file_csv_out.\n";
# open $fh, ">", $file_csv_out;
# print $fh $csv_out;
# close $fh;
 
print "  Finished importing data from Marketplace.\n";
