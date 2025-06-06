package KindergartenGarden;

use v5.40;

use List::Util qw/first/;
use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

my @students = qw/Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry/;

my sub indexof($needle, @haystack) {
    first { $haystack[$_] eq $needle } 0..$#haystack
}

sub plants($diagram, $student) {
    my $idx = indexof $student, @students;
    die "No such student: $student" if $idx == -1;
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );
    my @seen;
    for my $line (split "\n", $diagram) {
        my $start = $idx * 2;
        die "Line length invalid" if length($line) < $start + 1;
        push @seen, @plants{ split "", substr $line, $start, 2 };
    }
    [@seen]
}

1;
