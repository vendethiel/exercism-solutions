namespace eval dnd {
    namespace export character ability modifier
    namespace ensemble create

    proc randRange {min max} {
        set range [expr {$max - $min + 1}]
        return [expr {$min + int(rand() * $range)}]
    }

    proc doTimes {n f} {
        set xs [list]
        for {set i 0} {$i < $n} {incr i} {
            lappend xs [eval $f]
        }
        return $xs
    }

    proc modifier {score} {
        return [expr {int(floor(($score - 10) / 2))}]
    }

    proc ability {} {
        set nums [doTimes 4 {randRange 1 6}]
        set min [tcl::mathfunc::min {*}$nums]
        set sum [tcl::mathop::+ {*}$nums]
        return [expr {$sum - $min}]
    }

    variable statnames {charisma constitution dexterity intelligence strength wisdom}
    proc character {} {
        set values [doTimes [llength [set [namespace current]::statnames]] ability]
        set stats [dict create]
        foreach k [set [namespace current]::statnames] v $values {dict set stats $k $v}
        dict set stats hitpoints [expr 10 + [modifier [dict get $stats constitution]]]
        return $stats
    }
}
