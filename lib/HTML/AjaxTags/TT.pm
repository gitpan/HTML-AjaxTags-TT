package HTML::AjaxTags::TT;


use strict;
use warnings;
use USiOasis::Ajax;

our $AUTOLOAD;
our $VERSION = '0.01';


sub new {
    my $class = shift;
    bless {
        ajax => new HTML::AjaxTags,
    }, $class;
}


sub AUTOLOAD {
  return if $AUTOLOAD =~ /::DESTROY$/;
  my $self = shift;
  my $param = shift;

  my $name = $AUTOLOAD;
  $name =~ s/.*://;   # strip fully-qualified portion

  $self->{ajax}->$name(%$param);
}

1;

