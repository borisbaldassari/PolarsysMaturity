package Comments::Controller::Comments;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;
use JSON qw( decode_json encode_json );

# Include library for Publishing
use lib "../scripts/publish/";
use Castalia::PublishPolarSys;

my $dir_data = "../projects/";
my $publish_conf = "../scripts/publish/polarsys_maturity_assessment_prod.json";

# Entry page
sub welcome {
    my $self = shift;

    my %projects;
    my @comment_files = <$dir_data/*/*_comments.json>;
    foreach my $file (@comment_files) {
	$file =~ m!.*/([^_/]+)_comments.json!;
	my $project = $1;
	my $json;
	do { 
	    local $/;
	    open my $fhm, "<", $file;
	    $json = <$fhm>;
	    close $fhm;
	};
	# Decode the entire JSON
	my $raw = decode_json( $json );
	
	$projects{$project} = scalar @{$raw->{"comments"}};
    }
    
    my $json;
    do { 
        local $/;
        open my $fhm, "<", $publish_conf;
        $json = <$fhm>;
    	close $fhm;
    };
    
    # Decode the entire JSON
    my $json_conf = decode_json( $json );
    
    my $menu_ref = $json_conf->{"menu"};

    foreach my $entry (@{$menu_ref}) {
	if ($entry->{"name"} =~ m!Projects!) {
	    foreach my $proj (@{$entry->{"children"}}) {
		my $project_name = $proj->{"name"};
		my $project_id = $proj->{"id"};
		if ( not exists $projects{$project_id} ) {
		    $projects{$project_id} = 0;
		}
	    }
	}
    }

    $self->stash(
	projects => \%projects
        );    

    # Render template "comments/welcome.html.ep" with message
    $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

sub logged_in {
    my $self = shift;
    
    return 1 if $self->session('user');  

    $self->redirect_to('/comments/login_needed');
    return undef;
    
}


sub login_post {
    my $self = shift;

    my $user = $self->param('user') || 'ff';
    my $pass = $self->param('password') || '';

    print Dumper($user);
    print Dumper($pass);

    # If wrong login/pass then render comments/login_needed.html.ep
    return $self->render( template => 'comments/login_needed' ) unless $self->users->check($user, $pass);

    # If correct login/pass then log it and set session user field.
    $self->app->log->info('User [' . $user . '] logged_in.');
    $self->session(user => $user);

    # Render template "comments/login_post.html.ep"
    $self->redirect_to( 'welcome' );
    
}

sub logout {
    my $self = shift;

    # Write a message to log about this logout.
    my $user = $self->session('user');
    $self->app->log->info('User [' . $user . '] logged_out.');

    $self->session(expires => 1);
    $self->redirect_to('welcome');
    
}


# This action reads all comments for a given project and displays them.
sub read {
    my $self = shift;

    my $project = $self->param('id');

    my $file = $dir_data . "/" . $project . "/" . $project . "_comments.json";

    my @comments;
    if (-e $file) {
	my $json;
	do { 
	    local $/;
	    open my $fhm, "<", $file;
	    $json = <$fhm>;
	    close $fhm;
	};
	
	# Decode the entire JSON
	my $raw = decode_json( $json );
	@comments = @{$raw->{"comments"}};
    } else {
	
    }
     
    $self->stash(
	comments => \@comments
        );

    # Render template "comments/read.html.ep" with message
    $self->render();

}


# This action reads existing comments, adds the new entered comment,
# and writes things in the same json file.
sub write_post {
    my $self = shift;
    
    my $project = $self->param('id');
    my $in_user = $self->session('user');
    my $in_author = $self->param('author');
    my $in_text = $self->param('text');
    my $in_id = time();
    my $in_time = localtime();

    my $file = $dir_data . "/" . $project . "/" . $project . "_comments.json";

    # Read original json file
    my $raw;
    if (-e $file) {
	my $json;
	do { 
	    local $/;
	    open my $fhm, "<", $file;
	    $json = <$fhm>;
	    close $fhm;
	};
	# Decode the entire JSON
	$raw = decode_json( $json );
    } else {
	$raw = {
	    "name" => "$project",
#	    "comments" => []
	};
    }

    # Create a new comment entry
    my $comment = {
	"id" => $in_id,
	"user" => $in_user,
	"author" => $in_author,
	"date" => $in_time,
	"text" => $in_text
    };
    push(@{$raw->{"comments"}}, $comment);

    # Encode the entire JSON and write it to file.
    my $json_out = encode_json( $raw );
    do { 
        local $/;
        open my $fhm, ">", $file;
        print $fhm $json_out;
    	close $fhm;
    };

    # Write a message to log about this comment.
    $self->app->log->info('User [' . $in_user . '] has created comment id [' . $in_id . ']..');
    
    my $message = "Wrote comment to [$file].";
     
    $self->stash( in_author => $in_author );
    $self->stash( in_time => $in_time );
    $self->stash( in_text => $in_text );
    $self->stash( project => $project );

    # Render template "comments/write_post.html.ep" with message
    $self->render(msg => $message);
}

1;
