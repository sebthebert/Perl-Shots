#!/usr/bin/perl

use strict;
use warnings;

=head1 NAME

perldata_special_literals.pl - Samples of Perl Special literals 

=head1 DESCRIPTION

Special literals (http://perldoc.perl.org/perldata.html)

- __PACKAGE__
- __FILE__
- __LINE__
- __DATA__

=cut

printf("\nPrint this message from package '%s' file '%s' at line %d\n",
    __PACKAGE__, __FILE__, __LINE__);

while (<DATA>)
{
    print $_;
}

=head1 AUTHOR

Sebastien Thebert <sebthebert@gmail.com>

=cut

__DATA__
This is data 
after __DATA__ special literals
