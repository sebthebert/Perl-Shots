#!/usr/bin/perl

=head1 NAME

=head1 SYNOPSIS

[options]

=head1 OPTIONS

=over 4

=item B<-h,--help>

Prints Help

=item B<--verbose>

Sets verbosity

=back

=cut

use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;

my %opt = ();

GetOptions(
	'h|help' => \$opt{help},
	'verbose' => \$opt{verbose},
	);

pod2usage(1) if $opt{help};

=head1 AUTHORS

=cut
