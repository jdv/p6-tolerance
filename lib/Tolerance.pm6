use Test;
use v6;

module Tolerance {
    sub infix:<!≈> ($a, $b, :$desc) is export { ! infix:<≈>($a, $b, :$desc) }

    sub infix:<≈> ($a, $b is copy, :$desc is copy) is export {
        $b = $b-0.1 .. $b+0.1 if $b ~~ Numeric;

        $desc = '' if $desc === Bool::True;;

        my $ok = $a ~~ $b;

        return $ok without $desc;

        unless ok($ok, $desc) {
            diag("expected: $b.gist()");
            diag("got:      $a");
        }

        return $ok;
    }

    sub infix:<±> ($num, $tolerance) is tighter(&infix:<≈>) is export {
        $num-$tolerance .. $num+$tolerance
    }
}
