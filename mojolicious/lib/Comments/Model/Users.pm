package Comments::Model::Users;

use Mojo::JSON qw(decode_json encode_json);
use strict;
use warnings;

use Data::Dumper;

my $pass_file = './users.json';

my $users;

sub new { 
    my $self = shift;

    my $pass_str;

    open my $fh, '<', $pass_file or die "Could not open users file [$pass_file].\n";
    while (<$fh>) { chomp; $pass_str .= $_; }

    $users = decode_json( $pass_str );

    print Dumper($users);

    bless {}, $self;
}

sub check {
  my ($self, $user, $pass) = @_;

  # Success
  return 1 if ( exists($users->{$user}) && $users->{$user}->{'pwd'} eq $pass );

  # Fail
  return undef;
}

sub projects {
  my ($self, $user) = @_;

  if (exists($users->{$user})) {
      return $users->{$user}->{'projects'};
  }

  return undef;
}

1;
