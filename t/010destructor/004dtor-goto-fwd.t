#!/usr/bin/perl

use warnings;
use strict;
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/dtor-goto-fwd.dt -o dtor-goto-fwd `;
is_deeply(\@res, [], 'No compilation errors');
@res = `./dtor-goto-fwd`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [ 
    'destroying 0.000000',
    'Moving to mylabel2',
    'Got to mylabel2',
    'destroying 0.000000',
], 'Got correct results');

`rm dtor-goto-fwd`;

1;