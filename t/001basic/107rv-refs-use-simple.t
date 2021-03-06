#!/usr/bin/perl

use warnings;
use strict;
$ENV{"DALE_TEST_ARGS"} ||= "";
my $test_dir = $ENV{"DALE_TEST_DIR"} || ".";
$ENV{PATH} .= ":.";

use Data::Dumper;
use Test::More tests => 3;

my @res = `dalec $ENV{"DALE_TEST_ARGS"} $test_dir/t/src/rv-refs-use-simple.dt -o rv-refs-use-simple`;
is(@res, 0, 'No compilation errors');

@res = `./rv-refs-use-simple`;
is($?, 0, 'Program executed successfully');

chomp for @res;

is_deeply(\@res, [
'1', '2'
], 'Got expected results');

`rm rv-refs-use-simple`;

1;
