package Comments;

use Mojo::Base 'Mojolicious';
use Mojo::Log;

use Comments::Model::Users;


# This method will run once at server start
sub startup {
  my $self = shift;

  $self->secrets(['Secrets of PolarSys Maturity Assessment']);

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Use application logger
  $self->app->log->info('Comments application started.');

  # Initialise helper for Users module.
  $self->helper(users => sub { state $users = Comments::Model::Users->new });

  # Router
  my $r = $self->routes;

  # Non-protected routes 

  # Welcome page
  $r->any('/comments/')->to('comments#welcome')->name('welcome');

  # Route to read comments
  $r->any('/comments/r/#project')->to('comments#read');

  # Route to login (displays form)
  $r->get('/comments/login')->to( template => 'comments/login' );

  # Route to login (authenticates data)
  $r->post('/comments/login')->to( 'comments#login_post' );

  # Route to protected area (i.e. custom 403)
  $r->any('/comments/login_needed')->to( template => 'comments/login_needed' );

  # Route to logout
  $r->any('/comments/logout')->to('comments#logout');


  # Everything under comments/w needs authentication
  my $auth = $r->under('/comments/w/')->to('comments#logged_in');
  
  # Route for comment writing (displays form).
  $auth->get('/#project')
      ->to( template => 'comments/write' )
      ->name('write');
  
  # Route for comment writing (saves changes).
  $auth->post('/#project')
      ->to('comments#write_post')
      ->name('write_post');

  # Everything under comments/e needs authentication
  $auth = $r->under('/comments/e/')->to('comments#logged_in');
  
  # Route for comment editing (displays form).
  $auth->get('/#project/:id')
      ->to('comments#edit')
      ->name('edit');
  
  # Route for comment editing (saves changes).
  $auth->post('/#project/:id')
      ->to('comments#edit_post')
      ->name('edit_post');

  # Everything under comments/d needs authentication
  $auth = $r->under('/comments/d/')->to('comments#logged_in');
  
  # Route for comment deleting (displays form).
  $auth->get('/#project/:id')
      ->to('comments#delete')
      ->name('delete');
  
  # Route for comment deleting (saves changes).
  $auth->post('/#project/:id')
      ->to('comments#delete_post')
      ->name('delete_post');

}

1;
