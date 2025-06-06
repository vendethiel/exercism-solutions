unit module SecretHandshake;

sub handshake($number) is export {
    my @actions = do gather {
        take 'wink' if $number +& 0b1;
        take 'double blink' if $number +& 0b10;
        take 'close your eyes' if $number +& 0b100;
        take 'jump' if $number +& 0b1000;
    }
    @actions.=reverse if $number +& 0b10000;
    @actions
}
