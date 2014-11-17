package Castalia::PublishPolarSys;

use strict;
use warnings;

use Data::Dumper;

use Castalia::PublishStatic qw( build_page read_json);

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
my %flat_questions;
my %flat_attributes;
my %flat_rules;
my %flat_refs;

my %project_errors;

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


sub generate_project($) {
    my $class = shift;
    my $project_path = shift;

    my @path = File::Spec->splitdir($project_path);
    my $project_id = $path[-1];



    # Import PMI file
    my %project_pmi;
    my $pmi_ok = 0;
    my $path_pmi = $project_path . "/" . $project_id . "_pmi.json";
    print "    - Reading PMI file from [$path_pmi].. ";    
    if ( -f $path_pmi ) {
        print " Exists, OK.\n";
	my $json_pmi = &read_json($path_pmi);
	# Retrieve project information from the array
	my @projects_pmi = keys( $json_pmi->{"projects"} );
	my $project = $json_pmi->{"projects"}->{$projects_pmi[0]};
	$project_pmi{'title'} = $project->{"title"};
	$project_pmi{'desc'} = $project->{"description"}->[0]->{"safe_value"} || "";
	$project_pmi{'web'} = $project->{"website_url"}->[0]->{"url"} || "";
	$project_pmi{'wiki'} = $project->{"wiki_url"}->[0]->{"url"} || "";
	$project_pmi{'dl'} = $project->{"download_url"}->[0]->{"url"} || "";
	$project_pmi{'doc'} = $project->{"documentation_url"}->[0]->{"url"} || "";
	$project_pmi{'gs'} = $project->{"gettingstarted_url"}->[0]->{"url"} || "";
	$pmi_ok = 1;
    } else {
	my $err = "ERR: Cannot find PMI file [$path_pmi] for [$project_id].";
	push( @{$project_errors{$project_id}}, $err);
        print "\n$err\n";
    }

    # Import attributes file for project

    # We read attributes from file named "<project>_attributes.json"
    my $attrs_ok = 0;
    my $json_attrs = "${project_path}/${project_id}_attributes.json";
    my $html_ret_attrs = "";
    if (-e $json_attrs) {
        print "    - Reading attributes from [$json_attrs]..\n";    
    
        my $raw_attrs = &read_json($json_attrs);

	# $html_ret_attr .= '
        #       <div class="row">
        #         <div class="col-lg-6">';

	$html_ret_attrs .= "<table class=\"table table-striped table-condensed table-hover\">\n";
	$html_ret_attrs .= "<tr><th width=\"50%\">Name</th>" 
	    . "<th width=\"30%\">Mnemo</th>" 
	    . "<th width=\"20%\">Value</th></tr>\n";
	foreach my $a_mnemo (sort keys %{$raw_attrs->{"children"}}) {
	    my $a_value = $raw_attrs->{"children"}->{$a_mnemo};
	    if (exists($flat_attributes{$a_mnemo})) {
		$html_ret_attrs .= "<tr><td><a href=\"/documentation/attributes.html#" 
		    . $a_mnemo . '">' . $flat_attributes{$a_mnemo}{'name'} . "</a></td><td>" ;
		$html_ret_attrs .= "<a href=\"/documentation/attributes.html#" 
		    . $a_mnemo . '">' . $a_mnemo . "</a></td><td>";
		$html_ret_attrs .= "" . $a_value . "</td></tr>\n";
	    } else {
		my $err = "WARN: attribute [" . $a_mnemo . 
		    "] is not referenced in attributes definition file.\n";
		push( @{$project_errors{$project_id}}, $err);
		if ($debug) {
		    print $err;
		}
	    }
	}

	$html_ret_attrs .= "</table>\n";
	
	$html_ret_attrs .= "\n";
	$attrs_ok = 1;
    } else {
	my $err = "ERR: Cannot find attributes file [$json_attrs] for [$project_id].\n";
	push( @{$project_errors{$project_id}}, $err);
        print $err;
    }

    # Import questions file for project

    # We read questions from file named "<project>_questions.json"
    my $questions_ok = 0;
    my $json_questions = "${project_path}/${project_id}_questions.json";
    my $html_ret_questions = "";

    if (-e $json_questions) {
        print "    - Reading questions from [$json_questions]..\n";    
    
        my $raw_questions = &read_json($json_questions);

	$html_ret_questions .= "<table class=\"table table-striped table-condensed table-hover\">\n";
	$html_ret_questions .= "<tr><th width=\"50%\">Name</th>" 
	    . "<th width=\"30%\">Mnemo</th>" 
	    . "<th width=\"20%\">Value</th></tr>\n";
	foreach my $q_mnemo (sort keys %{$raw_questions->{"children"}}) {
	    my $q_value = $raw_questions->{"children"}->{$q_mnemo};
	    if (exists($flat_questions{$q_mnemo})) {
		$html_ret_questions .= "<tr><td><a href=\"/documentation/questions.html#" 
		    . $q_mnemo . '">' . $flat_questions{$q_mnemo}{'name'} . "</a></td><td>" ;
		$html_ret_questions .= "<a href=\"/documentation/questions.html#" 
		    . $q_mnemo . '">' . $q_mnemo . "</a></td><td>";
		$html_ret_questions .= "" . $q_value . "</td></tr>\n";
	    } else {
		my $err = "WARN: question [" . $q_mnemo . 
		    "] is not referenced in questions definition file.\n";
		push( @{$project_errors{$project_id}}, $err);
		if ($debug) {
		    print $err;
		}
	    }
	}

	$html_ret_questions .= "</table>\n";
	
	$html_ret_questions .= "\n";
	$questions_ok = 1;
    } else {
	my $err = "ERR: Cannot find questions file [$json_attrs] for [$project_id].\n";
	push( @{$project_errors{$project_id}}, $err);
        print $err;
    }


    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>Project ' . $project_id . '</h2>

              <div class="tabbable">
                <ul class="nav nav-pills" role="tablist">
                  <!-- li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">Summary</a></li -->';

    if ($pmi_ok) {
	$html_ret .= '
                  <li role="presentation" class="active"><a href="#pmi" role="tab" data-toggle="tab">PMI</a></li>';
    } else { 
	$html_ret .= '
                  <li role="presentation" class="active"><a href="#pmi" role="tab" data-toggle="tab">PMI</a></li>';
    }
    $html_ret .= '
                  <li role="presentation" class="disabled"><a href="#qm" role="tab" data-toggle="tab">QM</a></li>';

    if ($attrs_ok) {
	$html_ret .= '
                  <li role="presentation"><a href="#attrs" role="tab" data-toggle="tab">Attributes</a></li>';
    } else { 
	$html_ret .= '
                  <li role="presentation" class="disabled"><a href="#attrs" role="tab" data-toggle="tab">Attributes</a></li>';
    }

    if ($questions_ok) {
	$html_ret .= '
                  <li role="presentation"><a href="#questions" role="tab" data-toggle="tab">Questions</a></li>';
    } else { 
	$html_ret .= '
                  <li role="presentation" class="disabled"><a href="#questions" role="tab" data-toggle="tab">Questions</a></li>';
    }

    $html_ret .= '
                  <li role="presentation"><a href="#metrics" role="tab" data-toggle="tab">Metrics</a></li>
                  <li role="presentation"><a href="#practices" role="tab" data-toggle="tab">Practices</a></li>
                  <li role="presentation" class="disabled"><a href="#actions" role="tab" data-toggle="tab">Actions</a></li>
                  <li role="presentation"><a href="#log" role="tab" data-toggle="tab">Errors</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                  <!-- div role="tabpanel" class="tab-pane active" id="home"><br />...';

    # $html_ret .= '<h4>Project rating</h4>';

    # $html_ret .= '<h4>Main caracteristics</h4>';

    # $html_ret .= '<h4>Errors during the analysis</h4>';

    # $html_ret .= '
    #                 <ul class="list-group">';

    # foreach my $logline (@{$project_errors{$project_id}}) {
    # 	if ($logline =~ m!^ERR\s*:?(.*)$!) { 
    # 	    $logline = "<span class=\"label label-danger\">ERROR</span> " . $1;
    # 	    $html_ret .= '
    #                   <li class="list-group-item">' . $logline . '</li>';;
    # 	}
    # }

    # $html_ret .= '
    #                 </ul>';    

    $html_ret .= '
                  </div -->
                  <div role="tabpanel" class="tab-pane active" id="pmi"><br />';

    # Generic information
    $html_ret .= '
                    <dl class="dl-horizontal">
                      <dt>Description</dt>
                      <dd>' . ($project_pmi{'desc'} || "") . '</dd>
                      <dt>Web</dt>
                      <dd><a href="' . ($project_pmi{'web'} || "") . '">' . ($project_pmi{'web'} || "") . '</a></dd>
                      <dt>Wiki</dt>
                      <dd><a href="' . ($project_pmi{'wiki'} || "") . '">' . ($project_pmi{'wiki'} || "") . '</a></dd>
                      <dt>Downloads</dt>
                      <dd><a href="' . ($project_pmi{'dl'} || "") . '">' . ($project_pmi{'dl'} || "") . '</a></dd>
                      <dt>Documentation</dt>
                      <dd><a href="' . ($project_pmi{'doc'} || "") . '">' . ($project_pmi{'doc'} || "") . '</a></dd>
                      <dt>Getting Started</dt>
                      <dd><a href="' . ($project_pmi{'gs'} || "") . '">' . ($project_pmi{'gs'} || "") . '</a></dd>
                    </dl>';

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

    $html_ret .= '
                  </div>
                  <div role="tabpanel" class="tab-pane" id="qm">...</div>
                  <div role="tabpanel" class="tab-pane" id="attrs"><br />';
    
    $html_ret .= $html_ret_attrs;

    $html_ret .= '
                  </div>
                  <div role="tabpanel" class="tab-pane" id="questions"><br />';

    $html_ret .= $html_ret_questions;

    $html_ret .= '
                  </div>
                  <div role="tabpanel" class="tab-pane" id="metrics"><br />';

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
        $project_values{$metric} = $raw_values->{"children"}->{$metric};
        }
    } else {
        print "WARN Deprecated format for metrics values file [$file]. Reading anyway.\n" if ($debug);
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
        print "WARN: metric [" . $v_mnemo . "] is not referenced in metrics definition file.\n" if ($debug);
        }
    }
    }
    $html_ret .= "</table>\n";
 
    $html_ret .= '</div>
                  <div role="tabpanel" class="tab-pane" id="practices"><br />';

    # Import Rules file for project

    # We read rules from file named "<project>_violations.json"
    my $json_violations = "${project_path}/${project_id}_violations.json";

    if (-e $json_violations) {
        print "    - Reading rules violations from [$json_violations]..\n";    
    
        my $raw_rules = &read_json($json_violations);

	# loop through values and display them in a table.
	$html_ret .= "<table class=\"table table-striped table-condensed table-hover\">\n";
	$html_ret .= "<tr><th width=\"40%\">Name</th>" 
	    . "<th width=\"40%\">Mnemo</th>" 
	    . "<th width=\"20%\">NCC</th></tr>\n";
	foreach my $rule (@{$raw_rules->{"children"}}) {
	    if (exists($flat_rules{$rule->{"name"}})) {
		my $v_mnemo = $rule->{'name'};
		$html_ret .= "<tr><td><a href=\"/documentation/rules.html#" 
		    . $v_mnemo . '">' . $flat_rules{$v_mnemo}{'name'} . "</a></td>" ;
		$html_ret .= "<td><a href=\"/documentation/rules.html#" 
		    . $v_mnemo . '">' . $v_mnemo . "</a></td>";
		$html_ret .= "<td>" . $rule->{'value'} . "</td></tr>\n";
	    } else {
		my $err = "WARN: metric [" . $rule->{'name'} . 
		    "] is not referenced in metrics definition file.";
		push( @{$project_errors{$project_id}}, $err);
		print "$err\n" if ($debug);
	    }
	}

	$html_ret .= "</table>\n";
 
    } else {
	my $err = "ERR: Cannot find violations file [$json_violations] for [$project_id].";
	push( @{$project_errors{$project_id}}, $err);
        print "$err\n";
    }
    
    $html_ret .= '</div>
                  <div role="tabpanel" class="tab-pane" id="actions">...</div>
                  <div role="tabpanel" class="tab-pane" id="log"><br />
                    <ul class="list-group">';
    foreach my $logline (@{$project_errors{$project_id}}) {
	if ($logline =~ m!^ERR\s*:?(.*)$!) { 
	    $logline = "<span class=\"label label-danger\">ERROR</span> " . $1;
	}
	if ($logline =~ m!^WARN\s*:?!) { 
	    $logline = "<span class=\"label label-danger\">ERROR</span> " . $logline;
	}
	$html_ret .= '
                      <li class="list-group-item">' . $logline . '</li>';;
    }

    $html_ret .= '
                    </ul>
                  </div>
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

# Generate page for quality model attributes.
# Params: 
sub generate_doc_attributes() {
    my $class = shift;

    my $file_attrs = shift;
    
    ## Read attributes file

    # Open attributes file and read.
    print "  * Reading attributes from file [$file_attrs]...\n";
    
    my $raw_attrs = &read_json($file_attrs);
    
    my $attrs_name = $raw_attrs->{"name"};
    my $attrs_version = $raw_attrs->{"version"};
    print "      Ruleset: [", $attrs_name, "],";
    print " version [", $attrs_version, "],";
    
    my $vol_attrs;
    foreach my $attr (@{$raw_attrs->{"children"}}) {
	$flat_attributes{$attr->{"mnemo"}} = $attr;
	$vol_attrs++;
    }
    
    print " [$vol_attrs] attributes found.\n";
    
    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>Definition of Attributes</h2>
              <p>Attributes of quality represent our measurement goals for the given context. The first step when defining attributes is to gather quality requirements, in this case both for the Eclipse foundation and the PolarSys working group. These have been summarised <a href="https://polarsys.org/wiki/EclipseQualityRequirements">on a dedicated page of the wiki</a>. We relied on different standards and norms to formalise them: ISO 9126 and 250xx for the product, CMMi for the process, and open-source quality models for the community. </p><br />
        
';
    
    $html_ret .= '
              <ul class="list-group">';

    foreach my $attr (sort keys %flat_attributes) {
        $html_ret .= '
                <li class="list-group-item">';
        my $attr_name = $flat_attributes{$attr}{"name"};
        my $attr_desc = $flat_attributes{$attr}{"desc"};

        $html_ret .= "<p id=\"$attr\"><strong>$attr_name</strong> ( $attr )</p>\n";
        foreach my $desc (@{$attr_desc}) {
            $html_ret .= "<p class=\"desc\">$desc</p>\n";
        }
        $html_ret .= '
                </li>';
    
    }

    $html_ret .= '
              </ul>';
        
    $html_ret .= '
            </div>
          </div>
        </div>';


    return $html_ret;
    
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

    my $text = "<p id=\"$mnemo\"><!-- span class=\"glyphicon glyphicon-record\" / -->&nbsp;<strong>$metric_name</strong> ( $mnemo )</p>\n";

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
              <h2>Definition of metrics</h2>
              <p>All metrics used in the maturity assessment process are described thereafter, with useful information and references.</p><br />
        
';

    
    # Import metrics.
    foreach my $tmp_metric (@{$raw_metrics->{"children"}}) {
        my $metric_mnemo = $tmp_metric->{"mnemo"};
        my $metric_ds = $tmp_metric->{"ds"};
    if (exists $flat_metrics{$metric_mnemo}) {
	my $err = "WARN: Metric [$metric_mnemo] already exists!.";
	push( @{$project_errors{'MAIN'}}, $err);
	print "$err\n",
    } else {
        $flat_metrics{$metric_mnemo} = $tmp_metric;
    }

        # Populate metrics_ds
        $metrics_ds{$metric_ds}++;
    }
    
    # Create the tabs.
    $html_ret .= ' 
              <div class="tabbable">
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#repo_all" role="tab" data-toggle="tab">All&nbsp;<span class="badge">' . 
                  scalar keys(%flat_metrics) . '</span></a></li>';

    foreach my $repo (sort keys %metrics_ds) {
        $html_ret .= '
                  <li role="presentation">
                    <a href="#repo_' . $repo . '" role="tab" data-toggle="tab">' . ucfirst($repo) . 
                    '&nbsp;<span class="badge">' . $metrics_ds{$repo} . '</span></a></li>';
    }

    $html_ret .= '
                </ul>
                <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="repo_all"><br />
                  <ul class="list-group">';
                  
    foreach my $tmp_metric (sort keys %flat_metrics) {
        $html_ret .= '
                <li class="list-group-item">';
        $html_ret .= &describe_metric($tmp_metric);
        $html_ret .= "</li>";
    }
    $html_ret .= '
                  </ul></div>';
    
    # Create tab contents
    foreach my $repo (sort keys %metrics_ds) {
        $html_ret .= '
                  <div role="tabpanel" class="tab-pane" id="repo_' . $repo . '"><br />';
        $html_ret .= '
                    <ul class="list-group">';
                  
        foreach my $tmp_metric (sort keys %flat_metrics) {
            if ($flat_metrics{$tmp_metric}->{"ds"} eq $repo) {
            $html_ret .= '
                      <li class="list-group-item">';
            $html_ret .= &describe_metric($tmp_metric);
            $html_ret .= "</li>";
            }
        }
        $html_ret .= '
                    </ul>
                  </div>  ';
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
    my $file_questions = shift;
    
    ## Read question file

    # Open rules file and read.
    print "  * Reading questions from file [$file_questions]...\n";
    
    my $vol_questions;
    
    my $raw_questions = &read_json($file_questions);
    
    my $questions_name = $raw_questions->{"name"};
    my $questions_version = $raw_questions->{"version"};
    print "      Ruleset: [", $questions_name, "],";
    print " version [", $questions_version, "],";
    
    my $file_vol_questions;
    foreach my $question (@{$raw_questions->{"children"}}) {
	$flat_questions{$question->{"mnemo"}} = $question;
	$file_vol_questions++;
    }
    
    print " [$file_vol_questions] rules found.\n";
    
    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>Definition of Questions</h2>
              <p>Questions are mapped to quality attributes, on one side, and to metrics on the other side. It acts as a generic definition for measurement, allowing users to analyse different types of projects with the same quality tree. Questions also preserve the semantics and consistency of measures regarding associated the quality attribute, see Basili\'s Goal-Question-Metric approach [<a href="/documentation/references.html#Basili1994">Basili1994</a>] for more information on this approach.</p><br />
        
';
    
    $html_ret .= '
              <ul class="list-group">';

    foreach my $question (sort keys %flat_questions) {
        $html_ret .= '
                <li class="list-group-item">';
        my $question_name = $flat_questions{$question}{"name"};
        my $question_desc = $flat_questions{$question}{"desc"};
	my $question_question = "";
	if (exists $flat_questions{$question}{"question"}) {
	    $question_question = $flat_questions{$question}{"question"} ;
	}

        $html_ret .= "<p id=\"$question\"><strong>$question_name</strong> ( $question )</p>\n";
        $html_ret .= "<p class=\"desc\">" . $question_question . "</a>\n";
        foreach my $desc (@{$question_desc}) {
            $html_ret .= "<p class=\"desc\">$desc</p>\n";
        }
        $html_ret .= '
                </li>';
    
    }

    $html_ret .= '
              </ul>';
        
    $html_ret .= '
            </div>
          </div>
        </div>';


    return $html_ret;

}

sub generate_doc_rules() {
    my $class = shift;
    my $dir_rules = shift;
    
    ## Read rules files

    # Open rules file and read.
    print "  * Reading rules from dir [$dir_rules]...\n";
    
    my @json_files = <$dir_rules/*.json>;

    my $vol_rules;
    foreach my $file_rules (@json_files) {
        
        print "    - Reading rules file $file_rules..\n";
        my $raw_rules = &read_json($file_rules);
        
        my $rules_name = $raw_rules->{"name"};
        my $rules_version = $raw_rules->{"version"};
        print "      Ruleset: [", $rules_name, "],";
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
    
    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>Definition of rules</h2>
              <p>Rules are mapped to good and bad practices, as defined by the open-source community. They are computed by open-source rule-checking tools like PMD or FindBugs. They are classified by category associated to some quality characteristics.</p><br />
        
';
    
    $html_ret .= '
              <ul class="list-group">';

    foreach my $rule_mnemo (sort keys %flat_rules) {
        $html_ret .= '
                <li class="list-group-item">';
        my $rule_name = $flat_rules{$rule_mnemo}{"name"};
        my $rule_desc = $flat_rules{$rule_mnemo}{"desc"};

        $html_ret .= "<p id=\"$rule_mnemo\"><strong>$rule_name</strong> ( $rule_mnemo )</p>\n";
        
        foreach my $desc (@{$rule_desc}) {
            $html_ret .= "<p class=\"desc\">$desc</p>\n";
        }
        $html_ret .= '
                </li>';
    
    }

    $html_ret .= '
              </ul>';
        
    $html_ret .= '
            </div>
          </div>
        </div>';


    return $html_ret;

}

sub generate_doc_refs($) {
    my $class = shift;
    my $file_refs = shift;
    
    ## Read refs file

    # Open references file and read.
    print "  * Reading references from [$file_refs]...\n";

    my $raw_refs = &read_json($file_refs);
    
    # Import references.
    foreach my $tmp_ref (keys %{$raw_refs->{"children"}}) {
        $flat_refs{$tmp_ref} = $raw_refs->{"children"}->{$tmp_ref};
    }
    
    my $html_ret = '
        <div id="page-wrapper">
          <div class="row">
            <div class="col-lg-12">
              <h2>References</h2>
              <p>All refs used in the maturity assessment process are described thereafter, with useful information and references.</p><br />
        
';
    
    $html_ret .= '
              <ul class="list-group">';

    foreach my $ref (sort keys %flat_refs) {
    my $ref_desc = $flat_refs{$ref};
        $html_ret .= '
                <li class="list-group-item">';
        $html_ret .= "<p id=\"$ref\"><strong>[$ref]</strong> $ref_desc</p></li>\n";
    
    }

    $html_ret .= '
              </ul>';
        
    $html_ret .= '
            </div>
          </div>
        </div>';


    return $html_ret;
}

sub generate_all_docs() {
    my $class = shift;

}

1;
