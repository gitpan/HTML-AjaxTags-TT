=head1 NAME

HTML::AjaxTags::TT - AjaxTags for Template Toolkit 

=head1 SYNOPSIS

  use HTML::AjaxTags:TT;

=head1 DESCRIPTION

Because of the way Template Toolkit handles named parameters when calling functions, HTML::AjaxTags::TT must be used to embed HTML::AjaxTags within a template file.

=cut




package HTML::AjaxTags::TT;


use strict;
use warnings;
use HTML::AjaxTags;

our $AUTOLOAD;
our $VERSION = '0.03';


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

