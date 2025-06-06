BEGIN {
    split("Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry", names, " ")
    i = -1
    for (n in names) {
        if (name == names[n]) {
            i = n - 1
            break
        }
    }
    if (i == -1) {
        print "Invalid student" > "/dev/stderr"
        exit 1
    }
}
{
    if (length($0) < i * 2) {
        print "Invalid line length" > "/dev/stderr"
        exit 1
    }
    xs[NR] = substr($0, i * 2 + 1, 1) " " substr($0, i * 2 + 2, 1)
    gsub(/G/, "grass", xs[NR])
    gsub(/C/, "clover", xs[NR])
    gsub(/R/, "radishes", xs[NR])
    gsub(/V/, "violets", xs[NR])
}
END {
    print xs[1] " " xs[2]
}