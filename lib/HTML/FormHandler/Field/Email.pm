package HTML::FormHandler::Field::Email;
# ABSTRACT: validates email using Email::Valid

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Text';
use Email::Valid;
our $VERSION = '0.02';

apply(
    [
        {
            transform => sub { lc( $_[0] ) }
        },
        {
            check => sub { Email::Valid->address( $_[0] ) },
            message => [ 'Email should be of the format [_1]', 'someuser@example.com' ]
        }
    ]
);

=head1 DESCRIPTION

Validates that the input looks like an email address uisng L<Email::Valid>.
Widget type is 'text'.

=head1 DEPENDENCIES

L<Email::Valid>

=cut

__PACKAGE__->meta->make_immutable;
use namespace::autoclean;
1;
