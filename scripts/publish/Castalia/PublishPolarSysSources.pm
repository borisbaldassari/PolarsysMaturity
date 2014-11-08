package Castalia::PublishPolarSys;

use strict;
use warnings;

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

my %flat_metrics;
my %flat_attributes;
my %flat_rules;

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
    my $class = shift;
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

sub generate_doc_metrics($$) {
    my $class = shift;
    my $dir_data = shift;
    my $dir_out = shift;

    my $html_ret = "";


    # $html_ret = build_title("PolarSys Maturity Assessment Dashboard &mdash; " . $title);
    # $html_ret = build_menu(\@cats_n);
    # $html_ret = get_HTML_end();

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
