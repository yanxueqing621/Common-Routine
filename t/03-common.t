#! /usr/bin/env perl
use Modern::Perl;
use Test::More;

my ($module, @methods);

BEGIN {
  $module = "Common::Routine";
  @methods = qw/max min sum mean median var sd trim
            ltrim rtrim ceil floor round format_number/;
  use_ok($module, @methods);
}


for my $method (@methods) {
  can_ok($module, $method);
}

my @list = 1..10;

is (max(@list), 10, "max");
is (min(@list), 1, "min");
is (sum(@list), 55, "sum");
is (mean(@list), 5.5, "mean");
is (median(@list), 5.5, "median");
is (var(@list), 9.16666666666667, "var");
is (sd(@list), 3.02765035409749, "sd");

my $str = "  abc  ";
is (trim($str), "abc", "trim");
is (ltrim($str), "abc  ", "ltrim");
is (rtrim($str), "  abc", "rtrim");

my $num = 3.56;
is (round($num), 4, "round");
cmp_ok (format_number($num, 1), "eq", 3.6, "format_number" );

done_testing;
