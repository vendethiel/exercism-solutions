{
    gsub(/[^[:alnum:]]/, "")
    split(toupper($0), chars, "")
    for (i=1; i <= length(chars); i++) {
        if (seen[chars[i]]++) {
            print "false"
            exit
        }
    }
    print "true"
    exit
}