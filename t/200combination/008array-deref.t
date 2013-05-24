#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/array-deref.dt -o array-deref `;
is(@res, 0, 'No compilation errors');

@res = `./array-deref`;
is($?, 0, 'Program executed successfully');

chomp for @res;
is_deeply(\@res, [
    '1', '2', '3'
], 'Got expected results');

`rm array-deref`;

1;