unit module PhoneNumber;

sub clean-number ($number) is export {
    die "letters not permitted" if $number ~~ /<[a..z A..Z]>/;
    die "punctuations not permitted" if $number ~~ /'@'/;
    my @numbers = map +*, $number ~~ m:g/(\d)/;
    given @numbers {
        when * > 11 { die "must not be greater than 11 digits" }
        when * < 10 { die "must not be fewer than 10 digits" }
        when 11 {
            die "11 digits must start with 1" unless @numbers[0] == 1;
            @numbers.shift;
        }
    }
    die "area code cannot start with zero" if @numbers[0] == 0;
    die "area code cannot start with one" if @numbers[0] == 1;
    die "exchange code cannot start with zero" if @numbers[3] == 0;
    die "exchange code cannot start with one" if @numbers[3] == 1;
    join '', @numbers
}
