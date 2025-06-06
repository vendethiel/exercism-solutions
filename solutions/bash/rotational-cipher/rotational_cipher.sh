#!/usr/bin/env bash

replacel="abcdefghijklmnopqrstuvwxyz"
replaceu="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
rl="${replacel:$2}${replacel::$2}"
ru="${replaceu:$2}${replaceu::$2}"
sed "y/$replacel$replaceu/$rl$ru/" <<< "$1"
