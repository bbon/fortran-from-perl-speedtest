#! /usr/bin/perl
use strict;
use warnings;

use FFI::Platypus 2.00;
use Benchmark;

my $ffi = FFI::Platypus->new(
  api  => 2,
  lang => 'Fortran',
  lib  => './testlib.so',
);

$ffi->attach(f77_polynom => ['double*'] => 'double');

my $cycles = 10_000_000;
my $arg = 0.5;

sub perl_polynom {
    return 100 -5*$_[0] + 7*$_[0]**2 - $_[0]**3 - 6.5*$_[0]**4
        + 3.14*$_[0]**5 - 7*$_[0]**6 - 6.4*$_[0]**7 - 0.1*$_[0]**8;
}

my $res = undef;
my $t0 = Benchmark->new;

for (1..$cycles) {
    $res = perl_polynom($arg);
}

my $t1 = Benchmark->new;
my $td = timediff($t1, $t0);
print "Perl:",timestr($td),"\n";
print "Result: $res\n\n";

#########################

$res = undef;
$t0 = Benchmark->new;

for (1..$cycles) {
    $res = f77_polynom(\$arg);
}

$t1 = Benchmark->new;
$td = timediff($t1, $t0);
print "Fortran:",timestr($td),"\n";
print "Result: $res\n";
