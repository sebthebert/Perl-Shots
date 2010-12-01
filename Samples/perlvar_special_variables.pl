#!/usr/bin/perl

use strict;
use warnings;

=head1 NAME

perlvar_special_variables.pl - Samples of Perl Special variables 

=head1 DESCRIPTION

Special variables (http://perldoc.perl.org/perlvar.html)

- $. / $NR / $INPUT_LINE_NUMBER
    Current line number for the last filehandle accessed.

=cut

use English '-no_match_vars';

if (defined open my $file, '<', __FILE__)
{
    while (my $line = <$file>)
    {
        printf("%03d: %s", $INPUT_LINE_NUMBER, $line);
    }
    close $file;
}

=head1 AUTHOR

Sebastien Thebert <sebthebert@gmail.com>

=cut
