#!/usr/bin/perl

=head1 NAME

mod_Term_ANSIColor.pl - Demo for Term::ANSIColor module 

=head1 DESCRIPTION

More info on CPAN -> http://search.cpan.org/perldoc?Term::ANSIColor

=cut

use strict;
use warnings;

use Term::ANSIColor;

print colored('This text is in red.', 'red' ), "\n";
print colored('This one in green.', 'green' ), "\n";
print colored('This one in blue.', 'blue' ), "\n";
printf("%s %s %s\n", colored('R', 'red'), colored('G', 'green'), colored('B', 'blue'));

print colored ['yellow on_magenta'], 'Yellow on magenta.', "\n";
print colored ['red on_white'], 'Red on white.', "\n";
print colored ['black on_white'], 'Black on white.', "\n";
    
=head1 AUTHOR

Sebastien Thebert <sebthebert@gmail.com>

=cut
