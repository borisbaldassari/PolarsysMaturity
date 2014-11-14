
package Castalia::PublishStatic;

use strict;
use warnings;
use JSON qw( decode_json encode_json );

use Exporter qw(import);
 
our @EXPORT_OK = qw( build_page read_json );#get_HTML_start get_HTML_end build_title build_crumbs build_menu build_content_dir build_content_inc build_home);

# Piece of HTML that be printed at the beginning of every HTML  document.
my $html_start = <<'EOHS';
<!doctype html>
  <!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
  <!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
  <!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
  <!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="/css/plugins/timeline.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <!-- link href="/css/plugins/morris.css" rel="stylesheet" -->

    <!-- Custom Fonts -->
    <link href="/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Our CSS sheets -->
    <link rel="stylesheet" href="/css/main.css">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <body>
    <div id="#wrapper">

EOHS
#'


# Piece of HTML that be printed at the end of every HTML document.
my $html_end = <<'EOHE';
    </div>

    <!--[if lt IE 7]>
    <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Google Analytics: change UA-XXXXX-X to be your site ID. -->
    <script>
      (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
      function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
      e=o.createElement(i);r=o.getElementsByTagName(i)[0];
      e.src='//www.google-analytics.com/analytics.js';
      r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
      ga('create','UA-XXXXX-X');ga('send','pageview');
    </script>

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <!-- script src="/js/plugins/morris/raphael.min.js"></script>
    <script src="/js/plugins/morris/morris.min.js"></script>
    <script src="/js/plugins/morris/morris-data.js"></script -->

    <!-- Custom Theme JavaScript -->
    <script src="/js/sb-admin-2.js"></script>

    
    <!-- JavaScripts -->
    <!-- script src="/bower_components/modernizr/modernizr.js"></script-->
    
    <!-- script src="/bower_components/bootstrap/js/affix.js"></script>
    <script src="/bower_components/bootstrap/js/alert.js"></script>
    <script src="/bower_components/bootstrap/js/dropdown.js"></script>
    <script src="/bower_components/bootstrap/js/tooltip.js"></script>
    <script src="/bower_components/bootstrap/js/modal.js"></script>
    <script src="/bower_components/bootstrap/js/transition.js"></script>
    <script src="/bower_components/bootstrap/js/button.js"></script>
    <script src="/bower_components/bootstrap/js/popover.js"></script>
    <script src="/bower_components/bootstrap/js/carousel.js"></script>
    <script src="/bower_components/bootstrap/js/scrollspy.js"></script>
    <script src="/bower_components/bootstrap/js/collapse.js"></script>
    <script src="/bower_components/bootstrap/js/tab.js"></script -->
        
</body>
</html>
EOHE
#'

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
    $html_ret .= &build_title("PolarSys Maturity Assessment Dashboard &mdash; " . $title);
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
          <!-- div class="navbar-inner" -->
          <!-- div class="container" -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><big>' . $title . '</big></a>
              </div>
            <!-- /div -->
            <!-- /div -->
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
    $html_ret .= '
                    <li><a class="active" href="/">Home</a></li>';

    foreach my $entry (@{$array_ref}) {
	$html_ret .= '
                    <li><a href="' . $entry->{'url'} . '">' . 
		    $entry->{"name"};
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
    
    return $html_ret;
}


sub build_content_dir($) {
    my $path = shift;
    my @path  = File::Spec->splitdir($path);
    
    my $dir_name = $path[-1];
    print "  * Writing index for [$dir_name].\n";
    
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
      <div id="page-wrapper">
      <div class="row">
      <div class="col-lg-12">
      <h3>' . $path_join . '</h3>
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
          </div>
        </div>
      </div>
    </div>';
    $html_ret .= "";
    
    return $html_ret;
}

sub build_home($) {
    my $path = shift;
    my @path  = File::Spec->splitdir($path);
    
    my $dir_name = $path[-1];
    print "  * Writing home page for [$dir_name].\n";
    
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
	} elsif ($file =~ m!\.inc$!) {
	    # Remove .inc extension if available.
	    $file_strip =~ s/\.inc$/\.html/;
	    $file_name =~ s/\.inc$/\.html/;

	    $files_list .= '<a href="' . $file_strip . 
		'" class="list-group-item"><span class="glyphicon ' .
		'glyphicon-file" />&nbsp;' . $file_name . '</a>';
	} else {
	    print "ERR: cannot recognise file $file.\n";
	}
    }	
    
    my $html_ret = '
      <div id="page-wrapper">
      <div class="row">
      <div class="col-lg-12">
      <h3>' . $path_join . '</h3>
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
          </div>
        </div>
      </div>
    </div>';
    $html_ret .= "";
    
    return $html_ret;
}

sub build_content_inc(@) {
    my $inc_file = shift;
    my $html_ret = "";
    
    print "  * Writing content for [$inc_file].\n";
    
    open( my $fh, '<', $inc_file) or die "Could not open file [$inc_file] $!";
    while (my $row = <$fh>) {
	$html_ret .= $row;
    }
    close $fh;    
    
    return $html_ret;
}


1;
