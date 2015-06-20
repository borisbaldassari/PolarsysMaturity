
package Castalia::PublishStatic;

use strict;
use warnings;
use JSON qw( decode_json encode_json );

use Castalia::PublishHTML qw( 
    get_html_start 
    get_html_end
    );

use Exporter qw(import); 
our @EXPORT_OK = qw( build_page read_json );

my $html_start = get_html_start();
my $html_end = get_html_end();

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

sub get_HTML_start() { return $html_start; }

sub get_HTML_end() { return $html_end; }

sub build_page($$$$$) {
    my $title = shift;
    my $file = shift;
    my $dir_src = shift;
    my $dir_out = shift;
    my $menu_ref = shift; # array ref => for the menu

    my $html_ret = &get_HTML_start();
    $html_ret .= &build_title("PolarSys Dashboard &mdash; v1.3");
    $html_ret .= &build_menu($menu_ref);
    # if file is a directory, create index
    if (-d $file) {
	# Create the target directory if it doesn't exists
	my $file_target_dir = substr $file, length($dir_src);
	$file_target_dir = $dir_out . $file_target_dir;
	if (not -e $file_target_dir) { 
	    print "  * Creating folder [$file_target_dir].\n";
	    mkdir $file_target_dir or die "Cannot create folder $file_target_dir.\n";
	}
	$html_ret .= &build_content_dir($file);
    } elsif ($file =~ m!\.inc$!) {
	$html_ret .= &build_content_inc($file);	
    }
    $html_ret .= &get_HTML_end();

    return $html_ret;
}

 
sub build_title($) {
    my $title = shift;

    my $html_title = '

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
          <div class="navbar-header">
          <!-- div class="navbar-inner" -->
          <!-- div class="container" -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.html">' . $title . '</a>
            </div>
            <!-- /div -->
            </div>
            <!-- /.navbar-header -->';




    return $html_title;
}


sub build_crumbs($) {
    my $path = shift;
    my @path  = File::Spec->splitdir($path);
    
    my $html_ret = '
      <div class="row"><div class="col-xs-12">
        <ol class="breadcrumb">
          <li><a href="/">Home</a></li>';
    
    shift(@path);
    foreach (@path) {
	my $_c = ucfirst($_);
	$_c =~ s/\.inc$//;

	$html_ret .= '
          <li><a href="/' . $_c . '">' . $_c . '</a></li>';
    }
    $html_ret .= '
        </ol>
      </div></div>
      <div class="row">';
    
    return $html_ret;
}


sub build_menu($) {
    my $array_ref = shift;

    my $html_ret = '
              <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">';
    $html_ret .= '
                  <ul class="nav" id="side-menu">';

    foreach my $entry (@{$array_ref}) {
	$html_ret .= '
                    <li class="active"><a href="' . $entry->{'url'} . '">';
	if (exists($entry->{"icon"})) { 
	    $html_ret .= '<i class="fa ' . $entry->{"icon"} . ' fa-fw"></i> ';
	}
	$html_ret .= $entry->{"name"};
	if (exists $entry->{"children"}) {
	    $html_ret .= '<span class="fa arrow"></span></a>';
	    $html_ret .= '
                      <ul class="nav nav-second-level active">';

	    foreach my $entry (@{$entry->{"children"}}) {
		$html_ret .= '
                    <li><a href="' . $entry->{'url'} . '">' . 
		    $entry->{"name"} . '</a></li>';
	    }
	    $html_ret .= '
                  </ul>';
	} else {
	    $html_ret .=  '</a>';
	}
	$html_ret .= '</li>';
    }
    $html_ret .= "</ul>";

    $html_ret .= '
          </div></div>
        </nav>

';

    $html_ret .= '
      <div id="page-wrapper">
        <div class="row">
          <div class="col-lg-12">

            <p class="text-right"><img class="img-responsive pull-right" src="/images/header-bg-icons.png" style="margin: 10px" alt="header icons" /></p>
';
    
    return $html_ret;
}


sub build_content_dir($) {
    my $path = shift;
    my @path  = File::Spec->splitdir($path);
    
    my $dir_name = $path[-1];
    
    shift(@path);
    my @path_uc;
    foreach (@path) { push( @path_uc, ucfirst($_)); }
    
    my $path_join = join( ' &gt; ', @path_uc);
    my $folders_list = "";
    my $files_list = "";

    my @files = <$path/*>;
    foreach my $file (@files) {
	my @file_names = File::Spec->splitdir($file);
	my $file_name = $file_names[-1];
	
	my $file_strip = substr( $file, length($path)+1 );

	if (-d $file) { 
	    $folders_list .= '<a href="' . $file_strip . 
		'" class="list-group-item"><span class="glyphicon ' .
		'glyphicon-folder-close" />&nbsp;' . $file_name . '</a>';
	} elsif ($file !~ m'index.html') {
	    $files_list .= '<a href="' . $file_strip . 
		'" class="list-group-item"><span class="glyphicon ' .
		'glyphicon-file" />&nbsp;' . $file_name . '</a>';
	}
    }	
    
    my $html_ret = '
      <h3>' . $path_join . '</h3>

      <br />

      <p>No index found. Here is the content of the directory:</p>
      <br />

      <div class="panel panel-default">
        <div class="panel-heading"><b>Sub-folders</b></div>
          <div class="panel-body">
            <div class="list-group">
              ' .
	      $folders_list . '
            </div>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading"><b>Files</b></div>
          <div class="panel-body">
            <div class="list-group">
              ' .
		  $files_list . '
            </div>
          </div>
        </div>';
    $html_ret .= "";
    
    return $html_ret;
}


sub build_content_inc(@) {
    my $inc_file = shift;
    my $html_ret = "";
    
    open( my $fh, '<', $inc_file) or die "Could not open file [$inc_file] $!";
    while (my $row = <$fh>) {
	$html_ret .= $row;
    }
    close $fh;    
    
    return $html_ret;
}


1;
