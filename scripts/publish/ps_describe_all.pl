#! /usr/bin/perl

# Publishes a whole hierarchy integrating every single
# information hold in the maturity assessment process.
#
# Author: Boris Baldassari <boris.baldassari@gmail.com>
#
# Licensing: Eclipse Public License - v 1.0
# http://www.eclipse.org/org/documents/epl-v10.html

use strict;
use warnings;

use Data::Dumper;
use File::Basename;
use File::Copy::Recursive qw(rcopy);
use JSON qw( decode_json encode_json );
use REST::Client;

my $usage = <<EOU;
$0

Creates an html representation of the quality model, its metrics, concepts 
and rules, and its application to a set of sample projects.

This script works only in the context of a specific directory structure. 
See Bitbucket repo at https://bitbucket.org/PolarSys/polarsysmaturity.git

EOU

die $usage if (scalar @ARGV != 0);

my $plotly_key = '1mys04h2le';
my $plotly_name = 'BorisBaldassari';
my $plotly_url =  'https://plot.ly/clientresp';

my $rules_dir = "../../rules/";
my $metrics_dir = "../../data/";
my $samples_dir = "../../samples/";

my $includes = "includes/";
my $project_example = $includes . "projects/example/";

my $target = "target/";
my $target_docs = $target . "docs/";
my $file_concepts = $target_docs . "data/polarsys_concepts.json";
my $file_metrics = $target_docs . "data/polarsys_metrics.json";
my $target_projects = $target . "projects/";

my $debug = 0;

my $json = JSON->new;
$json->allow_singlequote("true");

my %flat_metrics;
my %flat_attributes;
my %flat_rules;
my $full_csv_rules;

## Functions

# recursive function to find leaves of a tree.
# params: 
#   $ a hash reference to the tree.
sub find_leaves($) {
    my $tree = shift;

    print "Traversing ", $tree->{"name"}, "\n" if ($debug);

    if (exists($tree->{"children"})) {
	foreach my $child (@{$tree->{"children"}}) {
	    &find_leaves($child);
	}
    } else {
	my $name = $tree->{"mnemo"};
	$flat_metrics{$name} = $tree;
    }
}


# write a string to a file
# params: 
#   $ the name of the file to write to
#   $ the string to be written in the file
sub write_file($$) {
    my $file_name = shift;
    my $content = shift;

    open( my $fh, ">", $file_name ) or die "Cannot open $file_name for writing.";
    print $fh $content;
    close $fh;
}

# describes a metric
# params: 
#   $ the mnemo of the metric
sub describe_metric($) {
    my $mnemo = shift;

    if (not exists $flat_metrics{$mnemo}) {
	die "Could not find metric (internal inconsistency).\n";
    }

    my $metric = $flat_metrics{$mnemo};
    my $metric_name = $metric->{"name"};
    my $metric_desc = $metric->{"description"};
    my $metric_question = $metric->{"question"} if (exists $metric->{"question"});
    my $metric_active = $metric->{"active"} if (exists $metric->{"active"});
    my $metric_from = $metric->{"datasource"} if (exists $metric->{"datasource"});

    my $text = "<h4 id=\"$mnemo\">$metric_name ($mnemo)</h4>\n";

    if ( exists $metric->{"active"} ) {
        $text .= "<p class=\"desc\">Active: $metric_active</p>\n";
    }

    if ( exists $metric->{"question"} ) {
        $text .= "<p class=\"desc\">Question: $metric_question</p>\n";
    }

    if ( exists $metric->{"datasource"} ) {
        $text .= "<p class=\"desc\">Data source: $metric_from</p>\n";
    }

    $text .= "<p class=\"desc\">Description:</p>\n";
    foreach my $desc (@{$metric_desc}) {
	$text .= "<p class=\"subdesc\">$desc</p>\n";
    }

    if ( exists $metric->{"composition"} ) {
	    my @compo_metrics =  split( " ", $metric->{"composition"} );
	    # Detect if we miss some base metrics to compute this derived metric
	    foreach my $compo_metric (@compo_metrics) {
	        if ( not exists $flat_metrics{$compo_metric} ) {
		    print "WARN: Missing $compo_metric to compute $mnemo.\n";
	        }
	    }
	    my $compo = join( ", ", @compo_metrics);
	    $text .= "<p>Composed of $compo.</p>\n";
    }

    return $text;
} 

# describes a concept
# params: 
#   $ a reference to the concept
sub describe_concept($) {
    my $concept = shift;

    my $concept_mnemo = $concept->{"mnemo"};
    my $concept_name = $concept->{"name"};
    my $concept_desc = $concept->{"description"};

    my $text = "<h4 id=\"$concept_mnemo\">$concept_name ($concept_mnemo)</h4>\n";
    
    if ( exists $concept->{"active"} ) {
	    my $concept_active = $concept->{"active"};
	    if ( $concept_active eq "true" ) {
	        $text .= "<p class=\"desc\">Concept is <b>active</b>.</p>\n";
	    } else {
	        $text .= "<p class=\"desc\">Concept is <b>inactive</b> for now.</p>\n";
	    }
    } else {
	    print "[ERR] Could not find active attribute on concept node [$concept_mnemo]!\n";	
    }

    if ( exists $concept->{"composition"} ) {
	    my @compo_metrics =  split( " ", $concept->{"composition"} );
	    # Detect if we miss some base metrics to compute this derived concept
	    foreach my $compo_metric (@compo_metrics) {
	        if ( not exists $flat_metrics{$compo_metric} ) {
		    print "WARN: Missing $compo_metric to compute $concept_mnemo.\n";
	        }
	    }
	    my $compo = join( ", ", @compo_metrics);
	    $text .= "<p class=\"desc\">Composed of $compo.</p>\n";
    } else {
	    print "[ERR] Could not find composition attribute on concept node [$concept_mnemo]!\n";
    }

    $text .= "<p class=\"desc\">Description:</p>\n";
    foreach my $desc (@{$concept_desc}) {
	$text .= "<p class=\"subdesc\">$desc</p>\n";
    }
    
    return $text;
} 


# describes a rule
# params: 
#   $ the mnemo of the rule
sub describe_rule($) {
    my $mnemo = shift;

    if (not exists $flat_rules{$mnemo}) {
        die "Could not find rule (internal inconsistency).\n";
    }

    my $rule = $flat_rules{$mnemo};
    my $rule_name = $rule->{"name"};
    my $rule_pri = $rule->{"priority"};
    my $rule_cats = $rule->{"cat"};
    my $rule_from = $rule->{"from"};
    
    my @rule_desc = @{$rule->{"desc"}};

    my $text = "<h4 id=\"$mnemo\">$rule_name ($mnemo)</h4>\n";
    $text .= "<p class=\"desc\">Category: $rule_cats</p>\n";
    $text .= "<p class=\"desc\">Priority: $rule_pri</p>\n";
    $text .= "<p class=\"desc\">From: $rule_from</p>\n";
        
    $full_csv_rules .= "$mnemo,$rule_pri,$rule_cats\n";

    $text .= "<p class=\"desc\">Description:</p>\n";
    foreach my $p (@rule_desc) {
        $text .= "<p class=\"subdesc\">$p</p>\n";
    }
    
    return $text;
} 


sub create_doc_rules($$) {
    my $source = shift;
    my $target = shift;
    
    print "# Reading rules, looping...\n";
    
    ## Read rules from json files in the rules directory
    
    my @json_files = <$source/*.json>;

    my $vol_rules;
    foreach my $file_rules (@json_files) {
        
        print "* Reading rules file $file_rules..\n";

        # Open json file
        my $json_rules;
        do { 
            local $/;
            open my $fh, "<", $file_rules;
            $json_rules = <$fh>;
	    close $fh;
        };
        
        # Decode the entire JSON
        my $raw_rules = decode_json( $json_rules );
        
        my $rules_name = $raw_rules->{"name"};
        my $rules_version = $raw_rules->{"version"};
        print "  Ruleset: [", $rules_name, "],";
        print " version [", $rules_version, "],";
        my $rules_from = $rules_name . " " . $rules_version;
        
        my $file_vol_rules;
        foreach my $rule_child (@{$raw_rules->{"children"}}) {
            $flat_rules{$rule_child->{"mnemo"}} = $rule_child;
            $flat_rules{$rule_child->{"mnemo"}}->{"from"} = $rules_from;
            $file_vol_rules++;
        }
        $vol_rules += $file_vol_rules;
        
        print " [$file_vol_rules] rules found.\n";
    }
    #print Dumper( %flat_rules ) if ($debug);

    # $full_text_* contain the full html page string for rules and concepts.
    my $full_text_rules = "<!DOCTYPE html><head>\n";
    $full_text_rules .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../styles.css\"/>\n";
    $full_text_rules .= "</head>\n<body>\n";
    $full_text_rules .= "<div id=\"content-full\">\n";
    $full_text_rules .= "<h1>List of rules for the PolarSys Maturity Assessment quality model</h1>\n\n";
    $full_text_rules .= "<p>Download the rule set [ <a href=\"rules.csv\">CSV</a> ]</p>\n";

    # Loop through rules
    my $rules_vol = 0;
    foreach my $rule ( keys %flat_rules ) {
    
        if (exists($flat_rules{$rule}{'priority'})) {

            my $rule_name = $flat_rules{$rule}{"name"};
            print "Working on $rule_name: $rule.\n" if ($debug);
    
            #$full_text_concepts .= "<h2>Concept name</h2>\n";
    
            $full_text_rules .= &describe_rule($rule) or die "Cannot find rule '$rule_name'.";
            $rules_vol++;
        }
    }
    print "Found a total of [$rules_vol] rules.\n\n";

    # Close html tags in output
    $full_text_rules .= "</div></body></html>\n";
    
    # Write results to html file.
    print "# Writing rules files...\n";

    print "* Writing rules html description to [" . $target_docs . "/rules.html].\n";
    &write_file($target_docs . "/rules.html", $full_text_rules);

    # Write results to csv file.
    print "* Writing rules csv formatting to [" . $target_docs . "/rules.csv].\n";
    &write_file($target_docs . "/rules.csv", $full_csv_rules);

}

sub create_doc_metrics($$) {
    my $source = shift;
    my $target = shift;
    
    ## Read metrics file

    # Open metrics file and read.
    print "\n# Reading metrics file [$file_metrics]...\n";
    my $json_metrics;
    do { 
        local $/;
        open my $fhm, "<", $file_metrics;
        $json_metrics = <$fhm>;
	close $fhm;
    };

    # Decode the entire JSON
    my $metrics = decode_json( $json_metrics );

    # Extract leafes
    &find_leaves( $metrics );

    print Dumper( %flat_metrics ) if ($debug);

    # $full_text_* contain the full html page string for metrics and concepts.
    my $full_text_metrics = "<!DOCTYPE html>\n<head>\n";
    $full_text_metrics .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../styles.css\"/>\n";
    $full_text_metrics .= "</head>\n<body>\n";
    $full_text_metrics .= "<div id=\"content-full\">\n";
    $full_text_metrics .= "<h1>List of metrics for the PolarSys Maturity Assessment quality model</h1>\n";

    my $full_text_concepts = "<!DOCTYPE html><head>\n";
    $full_text_concepts .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../styles.css\"/>\n";
    $full_text_concepts .= "</head>\n<body>\n";
    $full_text_concepts .= "<div id=\"content-full\">\n";
    $full_text_concepts .= "<h1>List of concepts for the PolarSys Maturity Assessment quality model</h1>\n";

    # Loop through metric's repos
    print "# Looping through repos/metrics...\n";
    my $compo_metrics_vol = 0;
    foreach my $repo ( @{$metrics->{"children"}} ) {

        my $repo_name = $repo->{"name"};
        print "* $repo_name... ";
        
        # Print base metrics
        my $base_metrics_vol = 0;
        for my $tmp_metric ( @{$repo->{"children"}} ) {
	        my $metric_mnemo = $tmp_metric->{"mnemo"};
	        if ( not exists $flat_metrics{$metric_mnemo}->{"composition"} ) {
	            $base_metrics_vol++;
	            $full_text_metrics .= &describe_metric($metric_mnemo) 
	                or die "Cannot find metric '$metric_mnemo'.";
	        }
        }
        print "[$base_metrics_vol] metrics found.\n";
        $compo_metrics_vol += $base_metrics_vol;
    }
    print "Found a total of [$compo_metrics_vol] metrics.\n";

    print "\n# Reading concepts file [$file_concepts]...\n";
    my $json_concepts;
    do { 
        local $/;
        open my $fhc, "<", $file_concepts;
        $json_concepts = <$fhc>;
	close $fhc;
    };

    # Decode the entire JSON
    my $concepts = decode_json( $json_concepts );


    # Loop through concepts
    print "# Looping through concepts...\n";
    my $compo_concepts_vol = 0;
    foreach my $concept_tree ( @{$concepts->{"children"}} ) {

        my $concept_name = $concept_tree->{"name"};
        print "Working on $concept_name.\n" if ($debug);

        $full_text_concepts .= &describe_concept($concept_tree) 
            or die "Cannot find concept '$concept_name'.";
	    $compo_concepts_vol++;

        # Print metrics used by concept
        my @tmp_metrics = split( ' ', $concept_tree->{"composition"} );
            for my $tmp_metric ( @tmp_metrics) {
	        my $metric_mnemo = $tmp_metric;
	        if ( exists $flat_metrics{$metric_mnemo}->{"composition"} ) {
	            $full_text_concepts .= &describe_metric($metric_mnemo) 
	                or die "Cannot find metric '$metric_mnemo'.";
	        }
        }
    }
    print "Found a total of [$compo_concepts_vol] concepts.\n\n";

    # Close html tags in output
    $full_text_metrics .= "</div></body></html>\n";
    $full_text_concepts .= "</div></body></html>\n";

    # Write results to html file.
    print "# Writing metrics and concepts files...\n";
    
    print "* Writing metrics html description to [" . $target . "/metrics.html].\n";
    &write_file($target . "/metrics.html", $full_text_metrics);

    print "* Writing concept html description to [" . $target . "/concepts.html].\n\n";
    &write_file($target . "/concepts.html", $full_text_concepts);

}

sub describe_project($$) {
    my $project_name = shift;
    my $project_path = shift;
    
    # Create hierarchy for target project
    my $target_project = $target_projects . "/" . $project_name;
    print "* Copying directory structure to target project.\n";
    rcopy($project_example, $target_project) 
        or die "Cannot copy example project to [$target_project].\n";

    

    &describe_project_home($project_name, $project_path);
    &describe_project_measures($project_name, $project_path);
    &describe_project_violations($project_name, $project_path);

}

sub describe_project_home($$) {
    my $project_name = shift;
    my $project_path = shift;
    
    # Open PMI file.
    my $project_pmi = $project_path . "/" . $project_name . "_pmi.json";
    print "* Looking for PMI file at [$project_pmi]...";
    
    if ( -f $project_pmi ) {
        print " OK.\n";
    } else {
        print "\nERR: Cannot find PMI file [$project_pmi] for [$project_name].\n\n";
        return;
    }

    my $json_pmi;
    do { 
        local $/;
        open my $fhpmi, "<", $project_pmi;
        $json_pmi = <$fhpmi>;
	close $fhpmi;
    };

    # Decode the entire JSON
    my $json_project_pmi = decode_json( $json_pmi );
    
    # Retrieve project information from the array
    my @projects_pmi = keys( $json_project_pmi->{"projects"} );
    my $project_id = $projects_pmi[0];
    my $project = $json_project_pmi->{"projects"}->{$project_id};
    
    my $project_title = $project->{"title"};

    print "* Building home.html..\n";

    my $full_text_project_home = "<!DOCTYPE html><head>\n";
    $full_text_project_home .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../../styles.css\"/>\n";
    $full_text_project_home .= "</head>\n<body>\n";
    $full_text_project_home .= "<div id=\"content\">\n";
    $full_text_project_home .= "<h2>Project [$project_name]: $project_title</h2>\n";
    
    # Add general info.
    $full_text_project_home .= "<div class=\"subpar\">\n";
    $full_text_project_home .= "<h3>General information</h3>";
    $full_text_project_home .= "<p class=\"desc\">ID: " . $project_id . "</p>\n";
    my $project_web = $project->{"website_url"}->[0]->{"url"} || "undefined";
    $full_text_project_home .= "<p class=\"desc\">Web site: <a href=\"" 
            . $project_web . "\" target=\"_blank\">"
            . $project_web . "</a></p>\n";
    my $project_wiki = $project->{"wiki_url"}->[0]->{"url"} || "undefined";
    $full_text_project_home .= "<p class=\"desc\">Wiki: <a href=\"" 
            . $project_wiki . "\" target=\"_blank\">"
            . $project_wiki . "</a></p>\n";
    my $project_dl = $project->{"download_url"}->[0]->{"url"} || "undefined";
    $full_text_project_home .= "<p class=\"desc\">Download URL: <a href=\"" 
            . $project_dl . "\" target=\"_blank\">"
            . $project_dl . "</a></p>\n";
    my $project_doc = $project->{"documentation_url"}->[0]->{"url"} || "undefined";
    $full_text_project_home .= "<p class=\"desc\">Documentation: <a href=\"" 
            . $project_doc . "\" target=\"_blank\">"
            . $project_doc . "</a></p>\n";
    my $project_gs = $project->{"gettingstarted_url"}->[0]->{"url"} || "undefined";
    $full_text_project_home .= "<p class=\"desc\">Getting Started URL: <a href=\"" 
            . $project_gs . "\" target=\"_blank\">"
            . $project_gs . "</a></p>\n";
    $full_text_project_home .= "</div>\n";
    
    # Add bugzilla info.
    $full_text_project_home .= "<div class=\"subpar\">\n";
    $full_text_project_home .= "<h3>Bugzilla</h3>";
    if ( exists($project->{"bugzilla"}->[0]->{"product"}) ) {
        my $project_bugzilla = $project->{"bugzilla"}->[0];
        $full_text_project_home .= "<p class=\"desc\">Product: " . $project_bugzilla->{"product"} . "</p>\n";
        $full_text_project_home .= "<p class=\"desc\">Query URL: <a href=\"" 
            . $project_bugzilla->{"query_url"} . "\" target=\"_blank\">" 
            . $project_bugzilla->{"query_url"} . "</a></p>\n";
        $full_text_project_home .= "<p class=\"desc\">Create URL: <a href=\"" 
            . $project_bugzilla->{"create_url"} . "\" target=\"_blank\">"
            . $project_bugzilla->{"create_url"} . "</a></p>\n";
    } else {
        $full_text_project_home .= "<p>NOT DEFINED</p>";
    }
    $full_text_project_home .= "</div>\n";
    
    # Add scm info.
    $full_text_project_home .= "<div class=\"subpar\">\n";
    $full_text_project_home .= "<h3>Source repositories</h3>";
    if ( exists($project->{"source_repo"}->[0]->{"url"}) ) {
        foreach my $repo (@{$project->{"source_repo"}}) {
            $full_text_project_home .= "<h4>" . $repo->{"name"} . "</h4>";
            $full_text_project_home .= "<p class=\"desc\">Type: " 
                . $repo->{"type"} . "</p>\n";
            $full_text_project_home .= "<p class=\"desc\">URL: <a href=\"" 
                . $repo->{"url"} . "\" target=\"_blank\">" 
                . $repo->{"url"} . "</a></p>\n";
        }
    } else {
        $full_text_project_home .= "<p>NOT DEFINED</p>";
    }
    $full_text_project_home .= "</div>\n";
    
    # Add info on releases.
    $full_text_project_home .= "<div class=\"subpar\">\n";
    $full_text_project_home .= "<h3>Releases</h3>";
    if ( exists($project->{"releases"}->[0]->{"title"}) ) {
#        my $project_releases = $project->{"bugzilla"}->[0];
        $full_text_project_home .= "<ul>";
        
        foreach my $rel (@{$project->{"releases"}}) {
            $full_text_project_home .= "<li>";
        
            $full_text_project_home .= "<h4>" . $rel->{"title"} . "</h4>\n";
            
            if (exists($rel->{"noteworthy"}->[0]->{"url"})) {
                $full_text_project_home .= "<p class=\"desc\"><b>Noteworthy</b>: <a href=\"" 
                    . $rel->{"noteworthy"}->[0]->{"url"} . "\" target=\"_blank\">" 
                    . $rel->{"noteworthy"}->[0]->{"url"} . "</a></p>\n";
            }
            
            $full_text_project_home .= "<p class=\"desc\"><b>Date</b>: " 
                . $rel->{"date"}->[0]->{"value"} . "</p>\n";

            if ($debug && exists($rel->{"architecture"}->[0]->{"safe_value"})) {
                $full_text_project_home .= "<p class=\"desc\" ><b>Architecture</b>: " 
                    . $rel->{"architecture"}->[0]->{"safe_value"} . "</p>\n";
            }

            if ($debug && exists($rel->{"communities"}->[0]->{"safe_value"})) {
                $full_text_project_home .= "<p class=\"desc\"><b>Communities</b>: " 
                    . $rel->{"communities"}->[0]->{"safe_value"} . "</p>\n";
            }
            
            if ($debug && exists($rel->{"compatibility"}->[0]->{"safe_value"})) {
                $full_text_project_home .= "<p class=\"desc\"><b>Compatibility</b>: " 
                    . $rel->{"compatibility"}->[0]->{"safe_value"} . "</p>\n";
            }
            
            if ($debug && exists($rel->{"endoflife"}->[0]->{"safe_value"})) {
                $full_text_project_home .= "<p class=\"desc\"><b>End of life</b>: " 
                    . $rel->{"endoflife"}->[0]->{"safe_value"} . "</p>\n";
            }
            
            if (exists($rel->{"review"}->{"title"})) {
                $full_text_project_home .= "<p class=\"desc\"><b>Review</b>: " 
                    . $rel->{"review"}->{"title"} . " (" 
                    . $rel->{"review"}->{"end_date"}->[0]->{"value"} . ")<br />\n";
                $full_text_project_home .= "<b>State</b>: " 
                    . $rel->{"review"}->{"state"}->[0]->{"value"} . "</p>\n";
            }
            
            $full_text_project_home .= "</li>";
        }
    } else {
        $full_text_project_home .= "<p>NOT DEFINED</p>";
    }
    $full_text_project_home .= "</ul>";
    $full_text_project_home .= "</div>\n";

    $full_text_project_home .= "";


    # Close div id="content" tag
    $full_text_project_home .= "</div>";
    
    # More info box    
    $full_text_project_home .= "<div id=\"moreinfo\"><h4>More info</h4>\n";
    $full_text_project_home .= "<p>Most of the information displayed in this page comes from the PMI web site: <a href=\"http://projects.eclipse.org\">projects.eclipse.org</a></p>\n";
    $full_text_project_home .= &describe_downloads();
    $full_text_project_home .= "</div>\n";
    
    # Close html tags in output
    $full_text_project_home .= "</body></html>\n";

    # Write home page to target dir.
    my $target_project = $target_projects . "/" . $project_name;
    print "* Writing html description to [" . $target_project . "/home.html].\n\n";
    &write_file($target_project . "/home.html", $full_text_project_home);
}

sub describe_downloads() {
    my $full_text_project;
    $full_text_project = "<h4>Download data for this project</h4>\n";
    $full_text_project .= "<ul>\n";
    $full_text_project .= "<li>Metrics [ <a href=\"project_metrics.json\">JSON</a> ]</li>";
    $full_text_project .= "<li>Concepts [ <a href=\"project_concepts.json\">JSON</a> ]</li>";
    $full_text_project .= "<li>Attributes [ <a href=\"project_attributes.json\">JSON</a> ]</li>";
    $full_text_project .= "</ul>\n";

    return $full_text_project;
}


sub describe_project_measures($$) {
    my $project_name = shift;
    my $project_path = shift;
    
    my %project_values;
    my %project_concepts;
    my %project_attributes;

    print "* Building measures for project [$project_name]..\n";

    # We read metrics from all files named "*_metrics*.json"
    my @json_metrics_files = <$samples_dir/$project_name/*_metrics*.json>;
    for my $file (@json_metrics_files) {

       	print "* Reading values from [$file]..\n";
	# Open json file
	my $json_values;
	if (-e $file) { 
	    local $/; 
	    open my $fh, "<", $file;
	    $json_values = <$fh>;
	    close $fh;
	};

	# Decode the entire JSON
	my $raw_values;
	eval {
	    $raw_values = decode_json( $json_values );
	} or do {
	    print "ERR: Cannot read input file [$file]. $@. Skiping...\n";
	    next;
	};

	# We want to be able to read files from bitergia (raw) AND
	# from our scripts (extended).
	if (exists($raw_values->{"name"})) {
	    # Our format 
	    for (my $i = 0 ; $i < scalar @{$raw_values->{"children"}} ; $i++) {
		$project_values{$raw_values->{"children"}->[$i]->{"name"}} 
	            = $raw_values->{"children"}->[$i]->{"value"};
	    }
	} else {
	    # Bitergia format
	    foreach my $metric (keys %{$raw_values}) {
		$project_values{$metric} = $raw_values->{$metric};
	    }	    
	}
    }

    # Read attributes

    # Open json file
    my ($json_values, $raw_values);
    my $file_in_attributes = "$samples_dir/$project_name/${project_name}_attributes.json";
    print "* Reading attributes from [$file_in_attributes]..\n";
    if (-e $file_in_attributes) { 
	local $/; 
	open my $fh, "<", $file_in_attributes;
	$json_values = <$fh>;
	close $fh;
    };
    
    # Decode the entire JSON
    eval {
	$raw_values = decode_json( $json_values );

	for (my $i = 0 ; $i < scalar @{$raw_values->{"children"}} ; $i++) {
	    $project_attributes{$raw_values->{"children"}->[$i]->{"name"}} 
	    = $raw_values->{"children"}->[$i]->{"value"};
	}

	# Copy attributes to target_projects
	my $json_path = $target_projects . "/" . $project_name . "/" . "project_attributes.json";
	print "* Writing project attributes to [$json_path].\n";
	
	eval {
	    $raw_values = encode_json( \%project_attributes );
	} or do {
	    print "ERR: Cannot write project attributes to json. $@. Skiping...\n";
	    next;
	};
	
	# Open json file
	do { 
	    local $/; 
	    open my $fh, ">", $json_path 
		or print "ERR: Cannot write project attributes to json [$json_path]. $@. Skiping...\n";
	    print $fh $raw_values;
	    close $fh;
	};
    } or do {
	print "ERR: Cannot read input file [$file_in_attributes]. Skiping...\n";
	print "$@.\n" if ($debug);
    };

    # Read concepts

    # Open json file
    my $file_in_concepts = "$samples_dir/$project_name/${project_name}_concepts.json";
    print "* Reading concepts from [$file_in_concepts]..\n";
    if (-e $file_in_concepts) { 
	local $/; 
	open my $fh, "<", $file_in_concepts;
	$json_values = <$fh>;
	close $fh;
    } #else {
#	print "ERR: Could not find [$file_in_concepts].\n";
#    }

    #print Dumper($json_values);
    
    # Decode the entire JSON
    eval {
	$raw_values = decode_json( $json_values );

	for (my $i = 0 ; $i < scalar @{$raw_values->{"children"}} ; $i++) {
	    $project_concepts{$raw_values->{"children"}->[$i]->{"name"}} 
	    = $raw_values->{"children"}->[$i]->{"value"};
	}

	# Copy concepts to target_projects
	my $json_path = $target_projects . "/" . $project_name . "/" . "project_concepts.json";
	print "* Writing project concepts to [$json_path].\n";

	eval {
	    $raw_values = encode_json( \%project_concepts );
	} or do {
	    print "ERR: Cannot encode project concepts to json. $@. Skiping...\n";
	};
	
	# Open json file
	do { 
	    local $/; 
	    open my $fh, ">", $json_path 
		or print "ERR: Cannot write project attributes to json [$json_path]. $@. Skiping...\n";
	    print $fh $raw_values;
	    close $fh;
	};
	
    } or do {
	print "ERR: Cannot read input file [$file_in_concepts]. Skiping...\n";
	print "$@.\n" if ($debug);
    };

    
    my $full_text_project_measures = "<!DOCTYPE html><head>\n";
    $full_text_project_measures .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../../styles.css\"/>\n";
    $full_text_project_measures .= "</head>\n<body>\n";
    $full_text_project_measures .= "<div id=\"content\">\n";
    $full_text_project_measures .= "<h2>Measures for [$project_name]</h2>\n";
    
    # loop through values and display them in a table.
    $full_text_project_measures .= "<table class=\"measures\">\n";
    $full_text_project_measures .= "<tr><th width=\"50%\">Name</th>" 
	. "<th width=\"30%\">Mnemo</th>" 
	. "<th width=\"20%\">Value</th></tr>\n";
    foreach my $v_mnemo (sort keys %project_values) {
#	print "DBG Looking for $v_mnemo in project_values.\n";
	if (exists($flat_metrics{$v_mnemo})) {
	    my $v_name = $flat_metrics{$v_mnemo}->{"name"};
	    $full_text_project_measures .= "<tr><td><a href=\"../../docs/metrics.html#" 
		. $v_mnemo . "\">" . $v_name . "</a></td>" ;
	    $full_text_project_measures .= "<td><a href=\"../../docs/metrics.html#" 
		. $v_mnemo . "\">" . $v_mnemo . "</a></td>";
	    $full_text_project_measures .= "<td>" . $project_values{$v_mnemo} . "</td></tr>\n";
	} else {
	    if ($debug) {
		print "WARN: metric [" . $v_mnemo . "] is not referenced in metrics definition file.\n";
	    }
	}
    }
    $full_text_project_measures .= "</table>\n";
    $full_text_project_measures .= "</div>\n";
    
    
    # Close div id="content" tag
    $full_text_project_measures .= "</div>";
    
    # More info box    
    $full_text_project_measures .= "<div id=\"moreinfo\"><h4>More info</h4>\n";
    $full_text_project_measures .= "You can get more information by clicking on the metric name or mnemo.\n";
    $full_text_project_measures .= &describe_downloads();    
    $full_text_project_measures .= "</div>\n";
    # Close html tags in output
    $full_text_project_measures .= "</body></html>\n";


    # Create html description for attributes.
    my $full_text_project_attributes = "<!DOCTYPE html><head>\n";
    $full_text_project_attributes .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../../styles.css\"/>\n";
    $full_text_project_attributes .= "</head>\n<body>\n";
    $full_text_project_attributes .= "<div id=\"content\">\n";
    $full_text_project_attributes .= "<h2>Attributes for [$project_name]</h2>\n";
    
    # loop through values and display them in a table.
    $full_text_project_attributes .= "<table class=\"measures\">\n";
    $full_text_project_attributes .= "<tr>" 
	. "<th width=\"30%\">Mnemo</th>" 
	. "<th width=\"20%\">Value</th></tr>\n";
    foreach my $v_mnemo (sort keys %project_attributes) {
#	print "DBG Looking for $v_mnemo in project_values.\n";
	#my $v_name = $flat_metrics{$v_mnemo}->{"name"};
	$full_text_project_attributes .= "<tr>" ;
	$full_text_project_attributes .= "<td><a href=\"../../docs/attributes.html#" 
	    . $v_mnemo . "\">" . $v_mnemo . "</a> (TODO)</td>";
	$full_text_project_attributes .= "<td>" . $project_attributes{$v_mnemo} . "</td></tr>\n";
    }
    $full_text_project_attributes .= "</table>\n";
    $full_text_project_attributes .= "</div>\n";
    
    
    # Close div id="content" tag
    $full_text_project_attributes .= "</div>";
    
    # More info box    
    $full_text_project_attributes .= "<div id=\"moreinfo\"><h4>More info</h4>\n";
    $full_text_project_attributes .= "<p>You can get more information by clicking on the metric name or mnemo.</p>\n";
    $full_text_project_attributes .= "<p><img src=\"../../images/cdt_attributes.svg\" /></p>;
    #<iframe width=\"400\" height=\"600\" frameborder=\"0\" seamless=\"seamless\" scrolling=\"no\" src=\"https://plot.ly/~BorisBaldassari/39/800/600\"></iframe></p>";
    $full_text_project_attributes .= &describe_downloads();    
    $full_text_project_attributes .= "</div>\n";
    # Close html tags in output
    $full_text_project_attributes .= "</body></html>\n";

    
    # Copy metrics values to target_projects
    my $json_path = $target_projects . "/" . $project_name . "/" . "project_metrics.json";
    print "* Writing project values to [$json_path].\n";

    eval {
	$raw_values = encode_json( \%project_values );
    } or do {
	print "ERR: Cannot write project values to json. $@. Skiping...\n";
	next;
    };

    # Open json file
    do { 
	local $/; 
	open my $fh, ">", $json_path 
	    or print "ERR: Cannot write project values to json [$json_path]. $@. Skiping...\n";
	print $fh $raw_values;
	close $fh;
    };

    
    # # Open json file
    # do { 
    # 	local $/; 
    # 	open my $fh, ">", $json_path 
    # 	    or print "ERR: Cannot write project concepts to json [$json_path]. $@. Skiping...\n";
    # 	print $fh $raw_values;
    # 	close $fh;
    # };


    # Write html description for attributes to file.
    my $target_project = $target_projects . "/" . $project_name;
    print "* Writing html description to [" . $target_project . "/attributes.html].\n\n";
    &write_file($target_project . "/attributes.html", $full_text_project_attributes);

    # Write measures page to target dir.
    print "* Writing html description to [" . $target_project . "/measures.html].\n\n";
    &write_file($target_project . "/measures.html", $full_text_project_measures);
}




sub describe_project_violations($$) {
    my $project_name = shift;
    my $project_path = shift;
    
    my %project_violations;

    print "* Building practices for project [$project_name]..\n";

    # We read metrics from all files named "*_metrics*.json"
    my $json_violations = "${samples_dir}/${project_name}/${project_name}_violations.json";

    print "* Reading values from [$json_violations]..";
    
    if ( -f $json_violations ) {
        print " OK.\n";
    } else {
        print "\nERR: Cannot find violations file [$json_violations] for [$project_name].\n\n";
        return;
    }

    # Open json file
    my $json_values;
    do { 
	local $/; 
	open my $fh, "<", $json_violations;
	$json_values = <$fh>;
	close $fh;
    };
    
    # Decode the entire JSON
    my $raw_values;
    eval {
	$raw_values = decode_json( $json_values );
    } or do {
	print "ERR: Cannot read input file [$json_violations]. $@. Skiping...\n";
	return;
    };
    
    for (my $i = 0 ; $i < scalar @{$raw_values->{"children"}} ; $i++) {
	$project_violations{$raw_values->{"children"}->[$i]->{"name"}} 
	    = $raw_values->{"children"}->[$i]->{"value"};
    }
    
    my $full_text_project_measures = "<!DOCTYPE html><head>\n";
    $full_text_project_measures .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"../../styles.css\"/>\n";
    $full_text_project_measures .= "</head>\n<body>\n";
    $full_text_project_measures .= "<div id=\"content\">\n";
    $full_text_project_measures .= "<h2>Practices (rule violations) for [$project_name]</h2>\n";
    
    $full_text_project_measures .= "<p>This rules have been extracted from <a href=\"http://pmd.sf.net\">PMD 5.1.2</a> and <a href=\"http://findbugs.sf.net\">FindBugs 3.0.0</a>.</p>";

    # loop through values and display them in a table.
    $full_text_project_measures .= "<table class=\"measures\">\n";
    $full_text_project_measures .= "<tr><th width=\"50%\">Name</th>" 
	. "<th width=\"20%\">Mnemo</th>" 
	. "<th width=\"10%\">Priority</th>" 
	. "<th width=\"10%\">Category</th>" 
	. "<th width=\"10%\">Value</th></tr>\n";
    foreach my $v_mnemo (sort keys %project_violations) {
	if (exists($flat_rules{$v_mnemo})) {
	    my $v_name = $flat_rules{$v_mnemo}->{"name"};
	    $full_text_project_measures .= "<tr><td><a href=\"../../docs/rules.html#" 
		. $v_mnemo . "\">" . $v_name . "</a></td>" ;
	    $full_text_project_measures .= "<td><a href=\"../../docs/rules.html#" 
		. $v_mnemo . "\">" . $v_mnemo . "</a></td>";
	    $full_text_project_measures .= "<td>" . $flat_rules{$v_mnemo}{'priority'} . "</td>";
	    $full_text_project_measures .= "<td>" . $flat_rules{$v_mnemo}{'cat'} . "</td>";
	    $full_text_project_measures .= "<td>" . $project_violations{$v_mnemo} . "</td></tr>\n";
	} else {
	    if ($debug) {
		print "WARN: rule [" . $v_mnemo . "] is not referenced in rules definition file.\n" if ($debug);
	    }
	}
    }
    $full_text_project_measures .= "</table>\n";
    $full_text_project_measures .= "</div>\n";
    
    
    # Close div id="content" tag
    $full_text_project_measures .= "</div>";
    
    # More info box    
    $full_text_project_measures .= "<div id=\"moreinfo\"><h4>More info</h4>\n";
    $full_text_project_measures .= "<p>Rule violations are retrieved from well-known rule-checking tools like PMD and FindBugs. Rules can be assimilated to good and bad practices. They are all attached to a category (quality attribute, check the <a href=\"../../docs/quality_model.html\">quality model</a> for more information) and have a priority.</p>\n";
    $full_text_project_measures .= &describe_downloads();
    $full_text_project_measures .= "<h4>Plot it!</h4>\n";
    $full_text_project_measures .= "<p><img src=\"../../images/cdt_violations.png\" width= \"100%\"/></p>\n";
    $full_text_project_measures .= "</div>\n";
    
    # Close html tags in output
    $full_text_project_measures .= "</body></html>\n";

    # Write measures page to target dir.
    my $target_project = $target_projects . "/" . $project_name;
    print "* Writing html description to [" . $target_project . "/practices.html].\n\n";
    &write_file($target_project . "/practices.html", $full_text_project_measures);
}


sub create_projects() {

    print "\n\n## Describing projects.\n\n";
    
    my @projects = <$samples_dir/*>;
    foreach my $project (@projects) {
        if (-d $project ) {
            my $project_name = basename($project);
            print "# Working on project [$project_name] located at [$project].\n";
            &describe_project($project_name, $project);
        } else {
            print "WARN: [$project] does not look like a project dir.\n\n";
        }
    }
    
}

sub init() {

    print "# Initialising folders...\n";

    # Copy all includes to target
    print "* Copying includes to target.\n";
    rcopy($includes, $target) or die "Copy failed: $!.";

    # Copy rules to rules_dir
    my $target_rules = $target_docs . "rules";
    print "* Copying rule definition files from [$rules_dir] to [$target_rules].\n";
    rcopy($rules_dir, $target_rules) 
        or die "Cannot copy rules to [$target_rules].\n";
    
    my $target_data = $target_docs . "data";

    # Copy metrics and concepts to target_docs
    my $source_metrics = $metrics_dir . "/polarsys_metrics.json";
    print "* Copying metrics definition file from [$source_metrics] to [$target_data].\n";
    rcopy($source_metrics, $target_data) 
        or die "Cannot copy metrics to [$target_data].\n";
    my $source_concepts = $metrics_dir . "/polarsys_concepts.json";
    print "* Copying concepts definition file from [$source_concepts] to [$target_data].\n";
    rcopy($source_concepts, $target_data) 
        or die "Cannot copy concepts to [$target_data].\n";

    # Copy qm to target_docs
    my $source_qm = $metrics_dir . "/polarsys_qm_full.json";
    print "* Copying quality_model definition file from [$source_qm] to [$target_data].\n";
    rcopy($source_qm, $target_data) 
        or die "Cannot copy quality model definition from [$source_qm] to [$target_data].\n";

    print "Directory Structure initialised.\n\n";
}

##
## Do things now.
##

print "Executing $0 on " . localtime . "\n\n";

&init();
&create_doc_rules($rules_dir, $target_docs);
&create_doc_metrics($metrics_dir, $target_docs);
&create_projects();


