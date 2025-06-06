#!/usr/bin/env bash
UPTO="$1"
check() {
    CUR=$1
    for((i=2; i<=CUR/2; i++))
    do
      ans=$(( CUR%i ))
      if [ $ans -eq 0 ]
      then
        return 1
      fi
    done
    return 0
}
for ((x = 2; x <= UPTO; x++))
do
    check $x && echo $x
done | xargs