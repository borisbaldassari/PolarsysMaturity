

use strict;
use warnings;
use File::Find;
use File::Spec;
use File::Basename;
use Data::Dumper;
use File::Copy::Recursive qw(rcopy);
use JSON qw( decode_json encode_json );
 
use Castalia::PublishPolarSys;
 
use Castalia::PublishStatic qw( build_page read_json);

die "Usage: $0 publish_conf.json\n" if (scalar @ARGV != 1);

my $publish_conf = shift;
my $json_conf = read_json($publish_conf);

my $dir_src = $json_conf->{"init"}->{"dir_src"};
my $dir_rules = $json_conf->{"init"}->{"dir_rules"};
my $dir_inc = $json_conf->{"init"}->{"dir_inc"};
my $dir_out = $json_conf->{"init"}->{"dir_out"};
my $dir_projects = $json_conf->{"init"}->{"dir_projects"};
my $dir_data = $json_conf->{"init"}->{"dir_data"};

my $menu_ref = $json_conf->{"menu"};

# Read the main configuration file. 
# All subsequent vars are retrieved from it, but can be overriden below.

#my $dir_src = "src/";
#my $dir_rules = "../../rules/";
#my $dir_inc = "includes/";
#my $dir_out = "dist/";
#my $dir_projects = "../../samples/";
#my $dir_data = "../../data/";

my $dir_src_doc = $dir_src . "documentation/";
my $dir_src_projects = $dir_src . "projects/";

my $file_metrics = $dir_data . "polarsys_metrics.json";
my $file_questions = $dir_data . "polarsys_questions.json";
my $file_attributes = $dir_data . "polarsys_attributes.json";
my $file_qm = $dir_data . "polarsys_qm.json";
my $file_refs = $dir_data . "references.json";

my $dir_out_data = $dir_out . "data/";
my $dir_out_doc = $dir_out . "documentation/";
my $dir_out_projects = $dir_out . "projects/";

# Clear dest
my @cmd_out = `rm -r $dir_out`;

# Copy includes to dest
rcopy($dir_inc, $dir_out);


#
# Generate files into the src directory.
#

print "# Copying download data to [$dir_out_data].\n";

# Create documentation dir if needed
if (not -e $dir_out_data) { 
    print "  * Creating folder [$dir_out_data].\n";
    mkdir $dir_out_data or die "Cannot create folder $dir_out_data.\n";
}

# Copy downloadable data
rcopy( $file_metrics, $dir_out_data ) 
    or print "ERR: could not copy data file [$file_metrics] to [$dir_out_data].\n";
rcopy( $file_questions, $dir_out_data ) 
    or print "ERR: could not copy data file [$file_questions] to [$dir_out_data].\n";
rcopy( $file_attributes, $dir_out_data ) 
    or print "ERR: could not copy data file [$file_attributes] to [$dir_out_data].\n";
rcopy( $file_qm, $dir_out_data ) 
    or print "ERR: could not copy data file [$file_qm] to [$dir_out_data].\n";
rcopy( $file_refs, $dir_out_data ) 
    or print "ERR: could not copy data file [$file_refs] to [$dir_out_data].\n";


#
# Now generate all dynamic pages (.inc's): documentation, projects, etc.
#

print "\n# Generating inc files from data...\n";

my $publish_ps = Castalia::PublishPolarSys->new();

# Create documentation dir if needed
if (not -e $dir_src_doc) { 
    print "  * Creating folder [$dir_src_doc].\n";
    mkdir $dir_src_doc or die "Cannot create folder $dir_src_doc.\n";
}

print " * Generating attributes doc from [$file_attributes] in [$dir_src_doc].\n";
my $doc_attrs = $publish_ps->generate_doc_attributes($file_attributes, $file_qm);
my $filename = $dir_src_doc . '/attributes.inc';
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $doc_attrs;
close $fh;

print " * Generating metrics doc from [$file_metrics] in [$dir_src_doc].\n";
my $doc_metrics = $publish_ps->generate_doc_metrics($file_metrics, $file_qm);
$filename = $dir_src_doc . '/metrics.inc';
open($fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $doc_metrics;
close $fh;

print " * Generating questions doc from [$file_questions] in [$dir_src_doc].\n";
my $doc_questions = $publish_ps->generate_doc_questions($file_questions, $file_qm);
$filename = $dir_src_doc . '/questions.inc';
open($fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $doc_questions;
close $fh;

print " * Generating rules doc from [$dir_rules] in [$dir_src_doc].\n";
my $doc_rules = $publish_ps->generate_doc_rules($dir_rules);
$filename = $dir_src_doc . '/rules.inc';
open($fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $doc_rules;
close $fh;

print " * Generating references doc from [$file_refs] in [$dir_src_doc].\n";
my $doc_refs = $publish_ps->generate_doc_refs($file_refs);
$filename = $dir_src_doc . '/references.inc';
open($fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $doc_refs;
close $fh;

$filename = $dir_out_doc . 'polarsys_qm_full_doc.json';
print " * Generating extended JSON for quality model [$file_qm] in [$filename].\n";
my $doc_qm = $publish_ps->generate_doc_qm($file_qm);
print "    - Writing qm to [$filename].\n";
if (not -e $dir_out_doc) { 
    print "  * Creating folder [$dir_out_doc].\n";
    mkdir $dir_out_doc or die "Cannot create folder $dir_out_doc.\n";
}
open($fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh $doc_qm;
close $fh;

print "\n# Generating inc files for projects...\n";

# Create projects dir if needed
if (not -e $dir_out_projects) { 
    print "  * Creating folder [$dir_out_projects].\n";
    mkdir $dir_out_projects or die "Cannot create folder $dir_out_projects.\n";
}

# Find the projects menu entry in menu array, and extract the ids 
# of the selected projets to work on.
my %selected_projects;
foreach my $entry (@{$menu_ref}) {
    if ( $entry->{"name"} =~ m!Projects! ) {
	foreach my $project (@{$entry->{"children"}}) {
	    my $id = $project->{'url'};
	    $id =~ s!/projects/(.+).html!$1!;
	    $selected_projects{$id} = 1;
	}
	last;
    }
}

my @projects = <$dir_projects/*>;

foreach my $project (@projects) {
    my @path = File::Spec->splitdir($project);
    my $project_id = $path[-1];

    if ( not exists($selected_projects{$project_id}) ) {
	next;
    }

    print "  # Working on project [$project_id].\n";

    if (not -e $dir_src_projects) { 
	print "  * Creating folder [$dir_src_projects].\n";
	mkdir $dir_src_projects or die "Cannot create folder $dir_src_projects.\n";
    }

    # Generating single metrics file for project.
    my $metrics_full = $publish_ps->generate_project_metrics($project_id, $project, $dir_out_projects);    

    # Generating project indicators, questions and attributes for $project_id.
    my $quality = $publish_ps->generate_inds($project_id, $file_qm, $metrics_full, $dir_out_projects);

    print "  * Generating project analysis for [$project_id] from [$project] in [$dir_src_projects].\n";
    
    my $doc_project = $publish_ps->generate_project($project, $dir_out_projects, $file_qm);
    $filename = $dir_src_projects . '/' . $project_id . ".inc";
    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
    print $fh $doc_project;
    close $fh;

    $publish_ps->generate_global_downloads($dir_out_projects);
    
}


#
# Generate the web site from the sources.
#
print "\n# Generating site from src...\n";

# Loop through all files.
my @files;
find({ wanted => sub { push @files, $_ if ( m!\.inc$! )} , no_chdir => 1 }, ($dir_src));

foreach my $file (@files) {
    
    my @file_path = File::Spec->splitdir($file);

    my $title = ucfirst($file_path[-1]);
    $title =~ s/.inc$//;
    
    my $html = build_page($title, $file, $dir_src, $dir_out, $menu_ref);

    # File name is different if we have a dir or an inc.
    if ($file =~ m!\.inc$!) {
	my $file_target = substr $file, length($dir_src);
	$file_target = $dir_out . $file_target;
	
	my $cont_dir = dirname($file_target);

	# Create projects dir if needed
	if (not -e $cont_dir) { 
	    print "  * Creating folder [$cont_dir].\n";
	    mkdir $cont_dir or die "Cannot create folder $cont_dir.\n";
	}
	
	$file_target =~ s/\.inc$/.html/;
	print "  * File src [$file] dest [${file_target}].\n";
	
	open(my $fh, '>', $file_target) or die "Could not open file [$file_target] $!";
	print $fh $html;
	close $fh;
    } else {
	print "WARN Could not identify file $file.\n";
    }
    
}

# Now create all indexes for directories
my @dirs;
find({ wanted => sub { push @dirs, $_ if ( -d )} , no_chdir => 1 }, ($dir_out));

foreach my $dir (@dirs) {
    
    my @dir_path = File::Spec->splitdir($dir);
    my $title = ucfirst($dir_path[-1]);
    $title =~ s/.inc$//;
    
    my $dir_target = substr $dir, length($dir_src);
    $dir_target = $dir_out . $dir_target . "/index.html";

    # Don't overwrite existing indexes.
    if (-e $dir_target) { next; }

    my $html = build_page($title, $dir, $dir_src, $dir_out, $menu_ref);

    print "  * Dir src [$dir] dest [${dir_target}].\n";
    
    open(my $fh, '>', $dir_target) or die "Could not open dir [$dir_target] $!";
    print $fh $html;
    close $fh;
}





