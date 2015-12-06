use Test;
use Tolerance;
use v6;

is(1.2345 ± 1, 0.2345..2.2345, '± num basic' );
is(1.2345 ± -1, 2.2345..0.2345, '± num reverse' );
is(1.2345 ± 0, 1.2345..1.2345, '± zero' );

ok(67.89 ≈ 67.80, '≈ within num default of ± 0.1');
ok(67.89 ≈ 67.99, '≈ on lower num default of ± 0.1');
ok(67.89 ≈ 67.79, '≈ on upper num default of ± 0.1');
todo('rakudo bug?  See RT#126826.');
ok(67.89 !≈ 67.9900000000000000000000001, '!≈ outside num default of ± 0.1');

ok(2 ≈ 1 ± 3, '≈ ± within num');
ok(2 ≈ 3 ± 1, '≈ ± on lower num');
ok(2 ≈ 1 ± 1, '≈ ± on upper num basic');

5 ≈ 5 :desc<≈ as basic test op>;
5 ≈ 5 ± 1 :desc('≈ ± as less basic test op');
5 ≈ 5 :desc;

done-testing;

# vim:ft=perl6
