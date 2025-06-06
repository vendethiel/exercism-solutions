proc to-offset {letter} {
  expr [scan $letter %c] - 65 
}
proc from-offset {idx} {
  format %c [expr $idx + 65]
}
proc prev {l} {
  from-offset [expr [to-offset $letter]-1]
}

proc diamond {letter} {
  set offset [to-offset $letter]
  set ls {}
  for {set i 0} {$i <= $offset} {incr i} {
    set cur [from-offset $i]
    set line [string repeat " " [expr 1+2*$offset]]
    set line [string replace $line [expr $offset-$i] [expr $offset-$i] $cur]
    set line [string replace $line [expr $offset+$i] [expr $offset+$i] $cur]
    lappend ls $line
  }
  set ls [concat $ls [lrange [lreverse $ls] 1 end]]
  join $ls \n
}
