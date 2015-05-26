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

  $self->helper(users => sub { state $users = Comments::Model::Users->new });

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->any('/comments/')->to('comments#welcome')->name('welcome');
  $r->any('/comments/r/#id')->to('comments#read');
  $r->get('/comments/login')->to( template => 'comments/login' );
  $r->post('/comments/login')->to( 'comments#login_post' );
  $r->any('/comments/login_needed')->to( template => 'comments/login_needed' );
  $r->any('/comments/logout')->to('comments#logout');

  my $auth = $r->under('/comments/w/')->to('comments#logged_in');
  
  $auth->get('/#id')
      ->to( template => 'comments/write' )
      ->name('write');
  
  $auth->post('/#id')
      ->to('comments#write_post')
      ->name('write_post');

}

1;
