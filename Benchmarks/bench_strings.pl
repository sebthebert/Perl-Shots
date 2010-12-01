#!/usr/bin/perl

=head1 NAME

bench_strings.pl

=head1 DESCRIPTION

Benchmark related to StackOverflow question: http://stackoverflow.com/q/3104493/24820

=cut

use strict;
use warnings;

use Benchmark qw(cmpthese timethese);

my $bench = timethese(
    $ARGV[1],
    {

        multi_concat => sub {
            my $string =
                "Hi, I am a very long and chatty string that just won't";
            $string .= " quit.  I'm going to keep going, and going, and going,";
            $string .=
                " kind of like the Energizer bunny.  What are you going to";
            $string .= " do about it?";
        },

        one_concat => sub {
            my $string =
                  "Hi, I am a very long and chatty string that just won't"
                . " quit.  I'm going to keep going, and going, and going,"
                . " kind of like the Energizer bunny.  What are you going to"
                . " do about it?";
        },

        join => sub {
            my $string = join('',
                "Hi, I am a very long and chatty string that just won't",
                " quit.  I'm going to keep going, and going, and going,",
                " kind of like the Energizer bunny.  What are you going to",
                " do about it?");
        },

    }
);

cmpthese $bench;

=head1 AUTHOR

Sebastien Thebert <sebthebert@gmail.com>

=cut
