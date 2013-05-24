#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/struct-rec-problem.dt -o struct-rec-problem `;
is(@res, 0, 'No compilation errors');

@res = `./struct-rec-problem`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [
'10', '20',
], 'Got expected results');

`rm struct-rec-problem`;

1;