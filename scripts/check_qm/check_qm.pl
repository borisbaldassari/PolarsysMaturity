#! /usr/bin/perl

# Applies various integrity checks on the different files that compose the 
# PolarSys quality model. Warns for unconsistent metrics combinations, missing
# attributes, etc.
#
# Author: Boris Baldassari <boris.baldassari@gmail.com>
#
# Licensing: Eclipse Public License - v 1.0
# http://www.eclipse.org/org/documents/epl-v10.html

use strict;
use warnings;
use Data::Dumper;
use JSON qw( decode_json );

my $usage = <<EOU;
$0 json_qm json_attributes json_concepts json_metrics

Applies various checks to the quality model, concepts and metrics 
for the PolarSys Maturity task project.

EOU

die $usage if (scalar @ARGV != 4);

my $file_qm = shift;
my $file_attributes = shift;
my $file_concepts = shift;
my $file_metrics = shift;
my ($qm, $attributes, $concepts, $metrics);

my $debug = 0;

my %flat_attributes;
my %flat_metrics;
my %flat_concepts;


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


# Read files
# params: 
#   $ the name of the file to be slurp.
sub read_file($) {
    my $filename = shift;

    do { 
        local $/;
        open my $fh, "<", $filename;
        return <$fh>;
    };
}


# Check consistency of a metric
# params:
#   $ the mnemo string of the metric to be checked
sub check_metric($) {
    my $mnemo = shift;

    print "* Checking metric $mnemo.\n" if ($debug);

    return -1 if (not exists $flat_metrics{$mnemo});
    my $metric = $flat_metrics{$mnemo};

    if ( not exists $metric->{"name"} ) {
	print "[ERR] metric $mnemo has no name.\n";
    }
    if ( not exists $metric->{"desc"} ) {
	print "[ERR] metric $mnemo has no description.\n";
    }
    if ( not exists $metric->{"scale"} ) {
	print "[WARN] metric $mnemo has no scale.\n";
    }
    if ( not exists $metric->{"ds"} ) {
	print "[ERR] metric $mnemo has no datasource.\n";
    }

    return 1;
} 


# Check consistency of a concept
# params:
#   $ a hash ref to the concept to be checked
sub check_concept($) {
    my $concept = shift;
    my $mnemo = $concept->{"mnemo"};

    print "* Checking question $mnemo.\n" if ($debug);

    if ( not exists $concept->{"name"} ) {
	print "[ERR] concept $mnemo has no name.\n";
    }
    if ( not exists $concept->{"desc"} ) {
	print "[ERR] concept $mnemo has no description.\n";
    }

    return 1;
} 


# Check consistency of an attribute
# params:
#   $ a hash ref to the attribute to be checked
sub check_attribute($) {
    my $attr = shift;
    my $mnemo = $attr->{"mnemo"};

    print "* Checking attribute $mnemo.\n" if ($debug);

    if ( not exists $attr->{"name"} ) {
	print "[ERR] attribute $mnemo has no name.\n";
    }
    if ( not exists $attr->{"desc"} ) {
	print "[ERR] attribute $mnemo has no description.\n";
    }

    return 1;
} 


# Check consistency of the qm structure
# params:
#   $ a hash ref to the qm tree to be checked
sub check_qm($) {
    my $tree = shift;

    # Check for mnemo first
    if ( not exists $tree->{"mnemo"} ) { 
	print "[ERR] No mnemo :-/ .\n";
    } else {
	print "* Checking node " . $tree->{"mnemo"} . "\n";
    }

    print "Checking type.\n" if ($debug);
    if ( exists $tree->{"type"} ) {
	if ( $tree->{"type"} eq "concept" ) {
	    my $concept_found = 0;
	    foreach my $concept ( @{$concepts->{"children"}} ) {
		if ( $concept->{"mnemo"} eq $tree->{"mnemo"} ) {
		    $concept_found = 1;
		    last;
		} 
	    }	    
	    if ( not $concept_found ) {
		print "[ERR] Could not find ", $tree->{"mnemo"}, " in concepts.\n";
	    }
#	    return;
	} elsif ( $tree->{"type"} eq "metric" ) {
	    if ( not exists $flat_metrics{$tree->{"mnemo"}} ) {
		print "[ERR] Could not find ", $tree->{"mnemo"}, " in metrics.\n";		
	    }
	} elsif ( $tree->{"type"} eq "attribute" ) {
	    if ( not exists $flat_attributes{$tree->{"mnemo"}} ) {
		print "[ERR] Could not find ", $tree->{"mnemo"}, " in attributes.\n";		
	    }
	}
    } else {
	print "[ERR] No type on " . $tree->{"mnemo"} . ".\n";
    }

    # recursively go through children.
    if (exists($tree->{"children"})) {
	foreach my $child (@{$tree->{"children"}}) {
	    &check_qm($child);
	}
    } 
}


## Read metrics file

# Open file and read.
my $json_qm = &read_file($file_qm);
my $json_attributes = &read_file($file_attributes);
my $json_concepts = &read_file($file_concepts);
my $json_metrics = &read_file($file_metrics);

# Decode the entire JSON
$qm = decode_json( $json_qm );
$attributes = decode_json( $json_attributes );
$concepts = decode_json( $json_concepts );
$metrics = decode_json( $json_metrics );

# Extract leafes -- used later on to easily find metrics.
&find_leaves( $metrics );

foreach my $concept ( @{$concepts->{"children"}} ) {
    $flat_concepts{$concept->{"mnemo"}} = $concept;
}

foreach my $attribute ( @{$attributes->{"children"}} ) {
    $flat_attributes{$attribute->{"mnemo"}} = $attribute;
}

print Dumper( %flat_metrics ) if ($debug);

# Check attributes definition file
print "\n# Checking attributes definition file...\n";

my $base_attrs_vol = 0;
foreach my $attr ( @{$attributes->{"children"}} ) {
    my $attr_mnemo = $attr->{"mnemo"};
    &check_attribute($attr) or die "Cannot find attribute '$attr_mnemo'.";
    $base_attrs_vol++;
}

print "Number of base metrics: $base_attrs_vol.\n\n";


# Check metrics definition file
print "\n# Checking metrics definition file...\n";

my $base_metrics_vol = 0;
foreach my $metric ( @{$metrics->{"children"}} ) {
    my $metric_mnemo = $metric->{"mnemo"};
    $base_metrics_vol++;
    &check_metric($metric_mnemo) or die "Cannot find metric '$metric_mnemo'.";
}

print "Number of base metrics: $base_metrics_vol.\n\n";


# Test concepts definition file
print "# Checking concepts definition file...\n\n";
my $compo_concepts_vol = 0;
for my $tmp_concept ( @{$concepts->{"children"}} ) {
    &check_concept($tmp_concept);
    $compo_concepts_vol++;
}
print "Number of concepts: $compo_concepts_vol.\n\n";
    

# Check qm definition file
print "# Checking quality model definition...\n\n";
&check_qm($qm->{"children"}->[0]);

print "\n# Checks done.\n";
