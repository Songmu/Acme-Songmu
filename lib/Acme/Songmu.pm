package Acme::Songmu;
use 5.010;
use strict;
use warnings;
use utf8;
use Encode;

our $VERSION = "0.01";

use Time::Piece ();
use Class::Accessor::Lite::Lazy 0.03 (
    ro      => [qw/birthday first_name last_name/],
    ro_lazy => {
        age => sub {
            int(
                (Time::Piece->localtime->strftime('%Y%m%d') -
                    shift->birthday->strftime('%Y%m%d')
                ) / 10000)
        },
    },
);

sub instance {
    state $_instance = bless {
        birthday   => Time::Piece->strptime('1980-06-05', '%Y-%m-%d'),
        first_name => 'Masayuki',
        last_name  => 'Matsuki',
    }, __PACKAGE__;
}

sub name {
    my $self = shift;
    sprintf '%s %s', $self->first_name, $self->last_name;
}

sub gmu {
    say encode_utf8 'ぐむー';
}

1;
__END__

=encoding utf-8

=head1 NAME

Acme::Songmu - It's new $module

=head1 SYNOPSIS

    use Acme::Songmu;

=head1 DESCRIPTION

Acme::Songmu is ...

=head1 LICENSE

Copyright (C) Songmu.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Songmu E<lt>y.songmu@gmail.comE<gt>

=cut

