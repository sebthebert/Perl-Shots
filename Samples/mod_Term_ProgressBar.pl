#!/usr/bin/perl

=head1 NAME

mod_Term_ProgressBar.pl - Demo for Term::ProgressBar module 

=head1 DESCRIPTION

More info on CPAN -> http://search.cpan.org/perldoc?Term::ProgressBar

=cut

use strict;
use warnings;

use Readonly;
use Term::ProgressBar 2.00;

Readonly my $MAX => 10;

my $progress = Term::ProgressBar->new(
    {name => 'Work in progress', count => $MAX, ETA => 'linear'});

for (0 .. $MAX)
{
    sleep 1;
    $progress->update($_);
}

=head1 AUTHOR

Sebastien Thebert <sebthebert@gmail.com>

=cut  
