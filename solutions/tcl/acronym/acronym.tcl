proc abbreviate {phrase} {
    set str {}
    foreach sub [split $phrase { -}] {
        set clean [string trim $sub {_}]
        set str "$str[string toupper [string index $clean 0]]"
    }
    set str
}
