#!perl
#
# does each sentence parse with camxes? and other sanity checks

use 5.28.0;
use Test2::V0;

my $legal_chars = qr/[ ',.abcdefgijklmnoprstuvxyz]/;

my $file = $ENV{THE_RUINS} // 'ruins';
open my $jfh, '<', $file or bail_out "could not open '$file': $!";

local $/ = "\n\n";
while ( readline $jfh ) {
    next if m{^\\};
    s/#[^\n]+//g;
    s/\n/ /g;
    s/\s{2,}//g;
    s/\s+$//;

    ok(length);    # shouldn't be any empty lines

    unless ( ok(m/^$legal_chars+$/) ) {
        my $bad    = $_ =~ s/$legal_chars+//gr;
        my $prefix = substr $_, 0, 16;
        diag "unknown '$bad' in line starting with $prefix";
        last;
    }

    # see comments in 'ruins' about this, could be a camxes bug?
    diag "KLUGE adjusting ka'enai..." if s/ka'enai/ka'e/g;

    my $status = system {'camxes'} 'camxes', $_;
    unless ( is( $status, 0 ) ) {
        diag ">>>$_<<<";
        # camxes isn't fast on my system so stop on failure
        last;
    }
}

done_testing;
