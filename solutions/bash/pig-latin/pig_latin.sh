#!/usr/bin/env bash

res=""

for word in "$@"
do
    if [[ $word =~ ^[aiueo].*$ || ${word:0:2} = "yt" || ${word:0:2} = "xr" ]]
    then
        res+="${word}ay "
    elif [[ $word =~ ^([^aiueo]+)(y.*)$ ]]
    then
        res+="${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay "
    elif [[ $word =~ ^([^aiueo]*qu)([aiueo].+)$ ]]
    then
        res+="${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay "
    elif [[ $word =~ ^([^aiueo]+)([aiueo].+)$ ]]
    then
        res+="${BASH_REMATCH[2]}${BASH_REMATCH[1]}ay "
    fi
done
echo "${res% }"