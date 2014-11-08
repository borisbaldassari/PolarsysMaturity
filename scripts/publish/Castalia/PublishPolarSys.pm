package Castalia::PublishPolarSys;

use strict;
use warnings;

use Data::Dumper;
use JSON qw( decode_json encode_json );

use Castalia::PublishStatic qw( build_page );

use Exporter qw( import );
 
our @EXPORT_OK = qw( 
    generate_all_docs 
    generate_doc_metrics
    generate_doc_questions
    generate_doc_attributes
    generate_doc_qm
    generate_all_projects 
);

my $debug = 0;

my %flat_metrics;
my %flat_attributes;
my %flat_rules;

my %metrics_ds;

sub new($$$) {
    my $class = shift;
    my $self = {
        # _f_metrics => shift,
        # _f_questions  => shift,
        # _f_attributes       => shift,
    };

    bless $self, $class;
    return $self;
}

sub read_json($) {
    my $file = shift;

    my $json;
    do { 
        local $/;
        open my $fhm, "<", $file;
        $json = <$fhm>;
	close $fhm;
    };

    # Decode the entire JSON
    my $raw = decode_json( $json );
    
    return $raw;
}


sub generate_project($) {
    my $class = shift;
    my $project_path = shift;

    my @path = File::Spec->splitdir($project_path);
    my $project_id = $path[-1];

    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2 class="page-header">Project ' . $project_id . '</h2>

              <div class="tabbable">
                <ul class="nav nav-pills" role="tablist">
                  <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">PMI</a></li>
                  <li role="presentation"><a href="#qm" role="tab" data-toggle="tab">QM</a></li>
                  <li role="presentation"><a href="#metrics" role="tab" data-toggle="tab">Metrics</a></li>
                  <li role="presentation"><a href="#practices" role="tab" data-toggle="tab">Practices</a></li>
                  <li role="presentation"><a href="#actions" role="tab" data-toggle="tab">Actions</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="home"><br />';

    # Import PMI file
    my $path_pmi = $project_path . "/" . $project_id . "_pmi.json";
    print "    - Reading PMI file from [$path_pmi].. ";    
    if ( -f $path_pmi ) {
        print " Exists, OK.\n";

	my $json_pmi = &read_json($path_pmi);
	
	# Retrieve project information from the array
	my @projects_pmi = keys( $json_pmi->{"projects"} );
	my $project = $json_pmi->{"projects"}->{$projects_pmi[0]};
	
	my $project_title = $project->{"title"};
	my $project_desc = $project->{"description"}->[0]->{"safe_value"} || "undefined";
	my $project_web = $project->{"website_url"}->[0]->{"url"} || "undefined";
	my $project_wiki = $project->{"wiki_url"}->[0]->{"url"} || "undefined";
	my $project_dl = $project->{"download_url"}->[0]->{"url"} || "undefined";
	my $project_doc = $project->{"documentation_url"}->[0]->{"url"} || "undefined";
	my $project_gs = $project->{"gettingstarted_url"}->[0]->{"url"} || "undefined";

	# Generic information
	$html_ret .= '
                    <dl class="dl-horizontal">
                      <dt>Description</dt>
                      <dd>' . $project_desc . '</dd>
                      <dt>Web</dt>
                      <dd><a href="' . $project_web . '">' . $project_web . '</a></dd>
                      <dt>Wiki</dt>
                      <dd><a href="' . $project_wiki . '">' . $project_wiki . '</a></dd>
                      <dt>Downloads</dt>
                      <dd><a href="' . $project_dl . '">' . $project_dl . '</a></dd>
                      <dt>Documentation</dt>
                      <dd><a href="' . $project_doc . '">' . $project_doc . '</a></dd>
                      <dt>Getting Started</dt>
                      <dd><a href="' . $project_gs . '">' . $project_gs . '</a></dd>
                    </dl>
                  </div>';

                # <div class="panel panel-default">
                #   <!-- Default panel contents -->
                #   <div class="panel-heading">General information</div>
                #   <div class="panel-body"></div>
                #   <ul class="list-group">
                #     <li class="list-group-item">' . $project_description . '</li>
                #     <li class="list-group-item">' . $project_web . '</li>
                #   </ul>
                # </div>

	# Bugzilla

	# Code repo

	# Milestone

    } else {
        print "\nERR: Cannot find PMI file [$path_pmi] for [$project_id].\n";
    }
    
    $html_ret .= '
                  <div role="tabpanel" class="tab-pane" id="qm">...</div>
                  <div role="tabpanel" class="tab-pane" id="metrics">';

    # Import Measures file for project
    my %project_values;
    # We read metrics from all files named "*_metrics*.json"
    my @json_metrics_files = <${project_path}/${project_id}*_metrics*.json>;
    for my $file (@json_metrics_files) {
	print "    - Reading metrics values file from [$file]..\n";    
	
	my $raw_values = &read_json($file);

	# We want to be able to read files from bitergia (raw) AND
	# from our scripts (extended).
	if (exists($raw_values->{"name"})) {
	    # Our format 
	    foreach my $metric (sort keys %{$raw_values->{"children"}}) {
		$project_values{$metric} 
	            = $raw_values->{"children"}->{$metric};
	    }
	} else {
	    print "WARN Deprecated format for metrics values file [$file]. Reading anyway.\n";
	    # Bitergia format
	    foreach my $metric (keys %{$raw_values}) {
		$project_values{uc($metric)} = $raw_values->{$metric};
	    }	    
	}
    }
	
    # loop through values and display them in a table.
    $html_ret .= "<table class=\"table table-striped table-condensed table-hover\">\n";
    $html_ret .= "<tr><th width=\"50%\">Name</th>" 
	. "<th width=\"30%\">Mnemo</th>" 
	. "<th width=\"20%\">Value</th></tr>\n";
#    print Dumper(%project_values);
    foreach my $v_mnemo (sort keys %project_values) {
	if (exists($flat_metrics{$v_mnemo})) {
	    my $v_name = $flat_metrics{$v_mnemo}->{"name"};
	    $html_ret .= "<tr><td><a href=\"/documentation/metrics.html#" 
		. $v_mnemo . "\">" . $v_name . "</a></td>" ;
	    $html_ret .= "<td><a href=\"/documentation/metrics.html#" 
		. $v_mnemo . "\">" . $v_mnemo . "</a></td>";
	    $html_ret .= "<td>" . $project_values{$v_mnemo} . "</td></tr>\n";
	} else {
	    if ($debug) {
		#print "WARN: metric [" . $v_mnemo . "] is not referenced in metrics definition file.\n";
	    }
	}
    }
    $html_ret .= "</table>\n";
 
    $html_ret .= '</div>
                  <div role="tabpanel" class="tab-pane" id="practices">...</div>
                  <div role="tabpanel" class="tab-pane" id="actions">...</div>
                </div>
              </div>
            </div>
          </div>
        </div>
';

    return $html_ret;
}

sub generate_all_projects($) {
    my $class = shift;
    
}


# Generate all documentation.

# Generate page for quality model.
# Params: 
sub generate_doc_qm() {
    my $class = shift;

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
    my $metric_desc = $metric->{"desc"};
    my $metric_from = $metric->{"ds"};

    my $text = "<p class=\"desc\" id=\"$mnemo\"><span class=\"glyphicon glyphicon-record\" />&nbsp;<strong>$metric_name</strong> ( $mnemo )</p>\n";

    foreach my $desc (@{$metric_desc}) {
	$text .= "<p class=\"desc\">$desc</p>\n";
    }

    return $text;
} 



sub generate_doc_metrics($) {
    my $class = shift;
    my $file_metrics = shift;
    
    ## Read metrics file

    # Open metrics file and read.
    print "  * Reading metrics file [$file_metrics]...\n";

    my $raw_metrics = &read_json($file_metrics);
    
    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2 class="page-header">Definition of metrics</h2>
              <p>All metrics used in the maturity assessment process are described thereafter, with useful information and references.</p><br />
        
';

    
    # Import metrics.
    foreach my $tmp_metric (@{$raw_metrics->{"children"}}) {
	my $metric_mnemo = $tmp_metric->{"mnemo"};
	my $metric_ds = $tmp_metric->{"ds"};
	$flat_metrics{$metric_mnemo} = $tmp_metric;

	# Populate metrics_ds
	$metrics_ds{$metric_ds}++;
    }

    # Create the tabs.
    $html_ret .= '
              <div class="tabbable">
                <ul class="nav nav-tabs" role="tablist">';
    my $first = 1;
    foreach my $repo (sort keys %metrics_ds) {
	$html_ret .= '
                  <li role="presentation" class="';
	$html_ret .= "active" if ($first);
	$html_ret .= '">
                    <a href="#repo_' . $repo . '" role="tab" data-toggle="tab">' . ucfirst($repo) . '&nbsp;
                   <span class="badge">' . $metrics_ds{$repo} . '</span></a></li>';
	$first = 0;
    }

    $html_ret .= '
              </ul>
             <div class="tab-content">  ';
    
    # Create tab contents
    $first = 1;
    foreach my $repo (sort keys %metrics_ds) {
	$html_ret .= '
               <div role="tabpanel" class="tab-pane ';
	$html_ret .= "active" if ($first);
	$html_ret .= '" id="repo_' . $repo . '"><br />';
	foreach my $tmp_metric (@{$raw_metrics->{"children"}}) {
	    if ($tmp_metric->{"ds"} eq $repo) {
		$html_ret .= &describe_metric($tmp_metric->{"mnemo"});
	    }
	}
	$html_ret .= '
               </div>  ';
	$first = 0;
    }
    
    $html_ret .= '
              </div>
            </div>
          </div>
        </div>';


    return $html_ret;
}

sub generate_doc_questions() {
    my $class = shift;

}

sub generate_doc_rules() {
    my $class = shift;

}

sub generate_all_docs() {
    my $class = shift;

}

1;
