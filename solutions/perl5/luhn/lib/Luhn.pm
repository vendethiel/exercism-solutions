package Luhn;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    my $i = 0;
    my $x = 0;
    $number =~ tr/ //ds;
    say $number;
    length($number) < 2 and return 0;
    $number =~ /^\d+$/ or return 0;
    for my $char (split '', reverse $number) {
        if ($i++ % 2) {
            $char *= 2;
            $x += $char > 9 ? $char - 9 : $char;
        } else {
            $x += $char;
        }
    }
    return $x % 10 == 0;
}
