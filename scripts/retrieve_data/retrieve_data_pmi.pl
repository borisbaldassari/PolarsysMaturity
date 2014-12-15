#! perl
#
#
#
#
#

use strict;
use warnings;

use Data::Dumper;
use JSON qw( decode_json encode_json );
use LWP::Simple;

# This can be changed for more verbose output
my $debug = 1;
my $base_url = "http://projects.eclipse.org/json/project/";

die "Usage: $0 project_id dir_out\n" if (scalar @ARGV != 2);

my $project_id = shift;
my $dir_out = shift;

# Fetch json file from projects.eclipse.org
my $url = $base_url . $project_id;
my $content = get($url);
die "Could not get [$url]!" unless defined $content;

my $fetch_date = localtime();
my %metrics;

#print "File from [$url] is \n$content.\n";

# Decode the entire JSON
my $raw_data = decode_json( $content );

my $raw_projects = $raw_data->{"projects"};
my @projects = sort keys( %{$raw_projects} );
my $projects_vol = scalar @projects;
print "Found [$projects_vol] project(s).\n";


foreach my $project_id (@projects) {
    my $raw_project = $raw_projects->{$project_id};
    my %proj;

    print "\n* Working on [$project_id].\n";

    # Retrieve basic information about the project
    $proj{"title"} = $raw_project->{"title"};
    $proj{"desc"} = $raw_project->{"description"}->[0]->{"safe_value"};
    $proj{"id"} = $raw_project->{"id"}->[0]->{"value"};
    
    # Retrieve information about Bugzilla
    my $pub_its_info = 0;
    if (scalar @{$raw_project->{"bugzilla"}} > 0) {

	$proj{"bugzilla_product"} = $raw_project->{"bugzilla"}->[0]->{"product"};
	if ($proj{"bugzilla_product"} =~ m!\S+!) { $pub_its_info++ };

	$proj{"bugzilla_component"} = $raw_project->{"bugzilla"}->[0]->{"component"};
	
	$proj{"bugzilla_create_url"} = $raw_project->{"bugzilla"}->[0]->{"create_url"};
	if ($proj{"bugzilla_create_url"} =~ m!\S+!) { $pub_its_info++ };
	if (head($proj{"bugzilla_create_url"})) {
	    $pub_its_info++; 
	    print "  Got create url [" . $proj{"bugzilla_create_url"} . "]!\n"; 
	}

	$proj{"bugzilla_query_url"} = $raw_project->{"bugzilla"}->[0]->{"query_url"};
	if ($proj{"bugzilla_query_url"} =~ m!\S+!) { $pub_its_info++; }
	if (head($proj{"bugzilla_query_url"})) {
	    $pub_its_info++;
	    print "  Got query url [" . $proj{"bugzilla_query_url"} . "]!\n"; 
	}
    }	
    $metrics{$project_id}{"PUB_ITS_INFO_PMI"} = $pub_its_info;

    # Retrieve information about source repos
    my $pub_scm_info = 0;
    if (scalar @{$raw_project->{"source_repo"}} > 0) {
	$proj{"source_repo_type"} = $raw_project->{"source_repo"}->[0]->{"type"};
	if ($proj{"source_repo_type"} =~ m!\S+!) { $pub_scm_info += 2; };

	$proj{"source_repo_name"} = $raw_project->{"source_repo"}->[0]->{"name"};
	if ($proj{"source_repo_name"} =~ m!\S+!) { $pub_scm_info++ };

	$proj{"source_repo_url"} = $raw_project->{"source_repo"}->[0]->{"url"};
	if ($proj{"source_repo_url"} =~ m!\S+!) { $pub_scm_info++ };
	if (head($proj{"source_repo_url"})) {
	    $pub_scm_info++;
	    print "  Got git url [" . $proj{"source_repo_url"} . "]!\n"; 
	}

    }
    $metrics{$project_id}{"PUB_SCM_INFO_PMI"} = $pub_scm_info;


    # Now working on releases..
    my $milestones_vol = 0;
    my $reviews_success = 0;
    my $rel_vol = 0;
    if (exists($raw_project->{"releases"})) {
	$rel_vol = scalar @{$raw_project->{"releases"}};
	print "  Found [$rel_vol] releases...\n";
	my $milestones_count_5;
	my $rel_count = 0;
	foreach my $rel (@{$raw_project->{"releases"}}) {
	    my %tmp_rel;
	    print "   - Release ", $rel->{"title"} if ($debug);
	    
	    $tmp_rel{"title"} = $rel->{"title"};
	    $tmp_rel{"date"} = $rel->{"date"}->[0]->{"value"};
	    $tmp_rel{"date_tz"} = $rel->{"date"}->[0]->{"timezone"};
	    $tmp_rel{"desc"} = $rel->{"description"}->[0]->{"safe_value"};
	    
	    print " (", $tmp_rel{"date"}, " ", $tmp_rel{"date_tz"}, ")";
	    
	    # Playing with review
	    $tmp_rel{"review_title"} = $rel->{"review"}->{"title"};
	    $tmp_rel{"review_state"} = $rel->{"review"}->{"state"}->[0]->{"value"} || 0;
	    $tmp_rel{"review_type"} = $rel->{"review"}->{"type"}->[0]->{"value"};
	    $tmp_rel{"review_end_date"} = $rel->{"review"}->{"end_date"}->[0]->{"value"};
	    $tmp_rel{"review_end_date_tz"} = $rel->{"review"}->{"end_date"}->[0]->{"timezone"};
	    
	    if ($tmp_rel{"review_state"} =~ m!success!i && $rel_count < 5) { 
		$reviews_success++;
	    }
	    
	    # Playing with milestones
	    $tmp_rel{"milestones_vol"} = scalar @{$rel->{"milestones"}};
	    if ($rel_count < 5) { 
		$milestones_count_5 += $tmp_rel{"milestones_vol"};
	    }
	    print " with ", $tmp_rel{"milestones_vol"}, " milestones " if ($debug);
	    $milestones_vol += $tmp_rel{"milestones_vol"};
	    
	    print "with results ", $tmp_rel{"review_state"}, ".\n";
#	    push( @releases, %tmp_rel );
	    $rel_count++;
	}
	print "  Found [$milestones_vol] milestones.\n";

	$metrics{$project_id}{"PLAN_MILESTONES_VOL"} = $milestones_count_5;
	if ($rel_vol > 5) { $rel_vol = 5 }
	my $reviews_success_rate = 100 * $reviews_success / $rel_vol;
	$metrics{$project_id}{"PLAN_REVIEWS_SUCCESS_RATE"} = $reviews_success_rate;
    } else {
	print "Cannot find any release in file..\n";
	$metrics{$project_id}{"PLAN_MILESTONES_VOL"} = 0;
	$metrics{$project_id}{"PLAN_REVIEWS_SUCCESS_RATE"} = 0;

    }

    # Write this to a json file.
    my $metrics_project = {
	"name" => "PMI Metrics for $project_id",
	"project" => $project_id,
	"version" => $fetch_date,
	"children" => $metrics{$project_id},
    };
    my $json_out = encode_json( $metrics_project );
    my $file_json_out = $dir_out . "/" . $project_id . "_metrics_pmi.json";
    print "  Writing metrics json file to [$file_json_out].\n";
    open my $fh, ">", $file_json_out;
    print $fh $json_out;
    close $fh;
    
}

# Write all projects (if several) to a csv file.
# my $csv_out = "project,plan_milestones_vol,plan_reviews_success_rate,pub_scm_info,pub_its_info\n";;
# foreach my $project (sort keys %metrics) {
#     $csv_out .= $project . "," 
# 	. $metrics{$project}{"PLAN_MILESTONES_VOL"} . ","
# 	. $metrics{$project}{"PLAN_REVIEWS_SUCCESS_RATE"} . ","
# 	. $metrics{$project}{"PUB_SCM_INFO"} . ","
# 	. $metrics{$project}{"PUB_ITS_INFO"}    . "\n";
# }

# my $file_csv_out = "metrics_pmi.csv";
# print "  Writing csv file to $file_csv_out.\n";
# open my $fh, ">", $file_csv_out;
# print $fh $csv_out;
# close $fh;

my $file_pmi_out = $dir_out . "/" . $project_id . "_pmi.json";
print "  Writing raw PMI JSON file to $file_pmi_out.\n";
open my $fh, ">", $file_pmi_out;
print $fh $content;
close $fh;
 
print "  Finished importing data from PMI JSON file.\n";
