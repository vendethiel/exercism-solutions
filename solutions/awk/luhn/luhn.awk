
/[^0-9 ]/ { print "false"; next }
/^ ?. ?$/ { print "false"; next }
{
    gsub(" ", "", $0)
    split($0, chars, "")
    for (i=1; i <= length($0); i++) {
        n = chars[i]
        if (i%2 != length($0)%2) {
            n += n
            n = n > 9 ? n - 9 : n
        }
        x += n
    }
    print(x % 10 ? "false" : "true")
}