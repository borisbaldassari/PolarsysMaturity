package Comments::Controller::Comments;
use Mojo::Base 'Mojolicious::Controller';

use Data::Dumper;
use JSON qw( decode_json encode_json );

# Include library for Publishing
use lib "../scripts/publish/";
use Castalia::PublishPolarSys;

my $dir_data = "../projects/";
my $publish_conf = "../scripts/publish/polarsys_maturity_assessment_prod.json";

#
# Utility to read json from a file name.
#
sub read_json($) {
    my $file = shift || "";

    my $json;

    do { 
	local $/;
	open my $fhm, "<", $file or die "Could not read json file [$file].\n";
	$json = <$fhm>;
	close $fhm;
    };
    
    # Decode the entire JSON
    return decode_json( $json );
}


#
# Utility to write json data into a file.
#
sub write_json($$) {
    my $data = shift || "";
    my $file = shift || "";
    

    my $json_out = encode_json( $data );
    do { 
        local $/;
        open my $fhm, ">", $file or die "Could not write json file [$file].\n";
        print $fhm $json_out;
    	close $fhm;
    };
}


#
# Entry page
# Displays the list of projects from comment data files, with number of comments.
# 
sub welcome {
    my $self = shift;

    my %projects;

    # Find comment data files for all projets in $dir_data/
    my @comment_files = <$dir_data/*/*_comments.json>;
    foreach my $file (@comment_files) {
	# For each file, 
	$file =~ m!.*/([^_/]+)_comments.json!;
	my $project = $1;
	my $raw = &read_json($file);
	
	$projects{$project} = scalar @{$raw->{"comments"}};
    }
    
    # Open configuration file.
    my $json_conf = &read_json($publish_conf);
    
    # Find "Projects" in menu entries to get the project that do not have yet
    # a json comments data file.
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

    # Prepare data for template.
    $self->stash(
	projects => \%projects
        );    

    # Render template "comments/welcome.html.ep" with message
    $self->render();
}


#
# Checks for the user auth. Called every time a protected page is encountered.
#
sub logged_in {
    my $self = shift;
    
    return 1 if $self->session('user');  

    $self->redirect_to('/comments/login_needed');
    return undef;
    
}


#
# Check login/password and setup the auth cookie if ok.
#
sub login_post {
    my $self = shift;

    my $user = $self->param('user') || '';
    my $pass = $self->param('password') || '';

    # If wrong login/pass then render comments/login_needed.html.ep
    return $self->render( template => 'comments/login_needed' ) unless $self->users->check($user, $pass);

    # If correct login/pass then log it and set session user field.
    $self->app->log->info('User [' . $user . '] logged_in.');
    $self->session(user => $user);

    # Render template "comments/login_post.html.ep"
    $self->redirect_to( 'welcome' );
    
}


#
# Reset the auth cookie. Called when accessing the logout page.
# All subsequent requests to logged_in will return undef.
#
sub logout {
    my $self = shift;

    # Write a message to log about this logout.
    my $user = $self->session('user');
    $self->app->log->info('User [' . $user . '] logged_out.');

    $self->session(expires => 1);
    $self->redirect_to('welcome');
    
}


#
# This action reads all comments for a given project and displays them.
#
sub read {
    my $self = shift;

    my $project = $self->param('project');

    my $file = $dir_data . "/" . $project . "/" . $project . "_comments.json";

    my @comments;
    if (-e $file) {
	my $raw = &read_json($file);
	@comments = @{$raw->{"comments"}};
    } 
     
    # Prepare data for template.
    $self->stash(
	comments => \@comments
        );

    # Render template "comments/read.html.ep" with message
    $self->render();

}


#
# This action reads existing comments, adds the new comment,
# and writes things in the same json file.
#
sub write_post {
    my $self = shift;
    
    my $project = $self->param('project');
    my $in_user = $self->session('user');
    my $in_author = $self->param('author');
    my $in_text = $self->param('text');
    my $in_id = time();
    my $in_time = localtime();

    my $file = $dir_data . "/" . $project . "/" . $project . "_comments.json";

    # Read original json file
    my $raw;
    if (-e $file) {
	$raw = &read_json($file);
    } else {
	# If the file does not exist create an empty file.
	$raw = {
	    "name" => "$project",
	    "comments" => []
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
    &write_json( $raw, $file );

    # Write a message to log about this comment.
    $self->app->log->info('User [' . $in_user . '] has created comment id [' . $in_id . ']..');
    
    my $message = "Wrote comment to [$file].";
     
    # Prepare data for template rendering.
    $self->stash( in_author => $in_author );
    $self->stash( in_time => $in_time );
    $self->stash( in_text => $in_text );
    $self->stash( project => $project );

    # Render template "comments/write_post.html.ep" with message
    $self->render(msg => $message);
}


#
# This action displays the current comment for editing.
#
sub edit {
    my $self = shift;
    
    my $in_id = $self->param('id');
    my $in_project = $self->param('project');
    my $in_user = $self->session('user');
    my $in_author = "None";
    my $in_date = "None";
    my $in_text = "None";
    
    my $file = $dir_data . "/" . $in_project . "/" . $in_project . "_comments.json";

    # Read original json file
    my $raw;
    if (-e $file) {
	$raw = &read_json($file);
    } else {
	# If the file does not exist die.
	return undef;
    }
    
    foreach my $comment (@{$raw->{'comments'}}) {
	if ($comment->{'id'} =~ m!^${in_id}$!) {
	    print "Found comment.\n";
	    $in_text = $comment->{"text"};
	    $in_author = $comment->{"author"};
	    $in_date = $comment->{"date"};
	    last
	};
    } 

    # Write a message to log about this comment.
    $self->app->log->info('User [' . $in_user . '] editing comment id [' . $in_id . ']..');
    
    # Prepare data for template rendering.
    $self->stash(
	in_author => $in_author,
	in_id => $in_id,
	in_text => $in_text,
	in_project => $in_project,
        );

    # Render template "comments/edit.html.ep" 
    $self->render();
}


#
# This action reads existing comments, edit the comment with the right id,
# and writes things in the same json file.
#
sub edit_post {
    my $self = shift;
    
    my $in_id = $self->param('id');
    my $in_project = $self->param('project');
    my $in_user = $self->session('user');
    my $in_text = $self->param('text');
    my $in_time = localtime($in_id);

    my $file = $dir_data . "/" . $in_project . "/" . $in_project . "_comments.json";

    # Read original json file
    my $raw;
    if (-e $file) {
	$raw = &read_json($file);
    } else {
	# If the file does not exist die.
	return undef;
    }

    foreach my $comment (@{$raw->{'comments'}}) {
	if ($comment->{'id'} =~ m!^${in_id}$!) {
	    # Create a new comment entry
	    $comment->{"text"} = $in_text;
	    last
	};
    } 

    # Encode the entire JSON and write it to file.
    &write_json( $raw, $file );

    # Write a message to log about this comment.
    $self->app->log->info('User [' . $in_user . '] has created comment id [' . $in_id . ']..');
    
    my $message = "Wrote comment to [$file].";
     
    # Prepare data for template rendering.
    $self->stash( in_time => $in_time );
    $self->stash( in_id => $in_id );
    $self->stash( in_text => $in_text );
    $self->stash( project => $in_project );

    # Render template "comments/edit_post.html.ep" with message
    $self->render(msg => $message);
}


#
# This action displays the current comment for deleting.
#
sub delete {
    my $self = shift;
    
    my $in_id = $self->param('id');
    my $in_project = $self->param('project');
    my $in_user = $self->session('user');
    my $in_author = "None";
    my $in_date = "None";
    my $in_text = "None";
    
    my $file = $dir_data . "/" . $in_project . "/" . $in_project . "_comments.json";

    # Read original json file
    my $raw;
    if (-e $file) {
	$raw = &read_json($file);
    } else {
	# If the file does not exist die.
	print "Can not find file [$file].\n";
	return undef;
    }
    
    foreach my $comment (@{$raw->{'comments'}}) {
	if ($comment->{'id'} =~ m!^${in_id}$!) {
	    print "Found comment.\n";
	    $in_text = $comment->{"text"};
	    $in_author = $comment->{"author"};
	    $in_date = $comment->{"date"};
	    last
	};
    } 

    # Write a message to log about this comment.
    $self->app->log->info('User [' . $in_user . '] editing comment id [' . $in_id . ']..');
    
    # Prepare data for template rendering.
    $self->stash(
	in_author => $in_author,
	in_id => $in_id,
	in_text => $in_text,
	in_project => $in_project,
        );

    # Render template "comments/delete.html.ep" 
    $self->render();
}


#
# This action reads existing comments, delete the comment with the right id,
# and writes things in the same json file.
#
sub delete_post {
    my $self = shift;

    my $in_id = $self->param('id');
    my $in_project = $self->param('project');
    my $in_user = $self->session('user');
    my $in_author = $self->param('author');
    my $in_text = $self->param('text');
    my $in_time = localtime($in_id);

    print "DBG in_id $in_id.\n";
    print "DBG in_project $in_project.\n";
    
    my $file = $dir_data . "/" . $in_project . "/" . $in_project . "_comments.json";

    # Read original json file
    my $raw;
    if (-e $file) {
	print "DBG reading [$file] json file.\n";
	$raw = &read_json($file);
    } else {
	# If the file does not exist die.
	return undef;
    }

    print Dumper($raw);

    my @comments = @{$raw->{'comments'}};
    my $index = -1;
    my $comments_index = scalar(@comments) - 1;
    print "DBG scalar is $comments_index.\n";
    foreach my $i ( 0 .. $comments_index ) {
	my $comment = $raw->{'comments'}->[$i];
	print "DBG $i [" . $comment->{'id'} . "] and [" . $in_id . "]\n";
	if ($comment->{'id'} =~ m!^${in_id}$!) {
	    $index = $i;
	    last
	};
    } 

    print "DBG Index for deletion is $index.\n";

    splice @comments, $index, 1;
    @{$raw->{'comments'}} = @comments;

    print Dumper($raw);

    # Encode the entire JSON and write it to file.
    &write_json( $raw, $file );

    # Write a message to log about this comment.
    $self->app->log->info('User [' . $in_user . '] has deleted comment id [' . $in_id . ']..');
    
    my $message = "Deleted comment from [$file].";
     
    # Render template "comments/delete_post.html.ep" with message
    $self->redirect_to("/comments/r/${in_project}");
}

1;
