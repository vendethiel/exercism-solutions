"
RomanNumerals helps compute roman numerals
"
Class {
	#name : 'RomanNumerals',
	#superclass : 'Object',
	#category : 'Exercise@RomanNumerals',
	#package : 'Exercise@RomanNumerals'
}

{ #category : 'numeric' }
RomanNumerals >> romanNumber: n [
	 "Computes the roman number"
    |num|
    num := RomanNumber from: n.
	 num
        change: 1000 to: 'M';
        change: 900 to: 'CM';
        change: 500 to: 'D';
        change: 400 to: 'CD';
        change: 100 to: 'C';
        change: 90 to: 'XC';
        change: 50 to: 'L';
        change: 40 to: 'XL';
        change: 10 to: 'X';
        change: 9 to: 'IX';
        change: 5 to: 'V';
        change: 4 to: 'IV';
        change: 1 to: 'I'.
    ^ num value.
]
