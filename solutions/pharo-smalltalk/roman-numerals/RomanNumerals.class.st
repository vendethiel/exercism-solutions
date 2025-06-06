Class {
	#name : #RomanNumerals,
	#superclass : #Object,
    #instVars : [ 'number', 'string' ],
	#category : #'Exercise@RomanNumerals'
}

RomanNumerals >> single: n as: s [
    (number >= n) ifTrue: [
        number := number - n.
        string := string , s.
    ]
]

RomanNumerals >> triple: n as: s [
    self
        single: n as: s;
        single: n as: s;
        single: n as: s.
]

RomanNumerals >> romanNumber: n [
    number := n.
    string := ''.
    self
        triple: 1000 as: 'M';
        single: 900 as: 'CM';
        triple: 500 as: 'D';
        single: 400 as: 'CD';
        triple: 100 as: 'C';
        single: 90 as: 'XC';
        triple: 50 as: 'L';
        single: 40 as: 'XL';
        triple: 10 as: 'X';
        single: 9 as: 'IX';
        single: 5 as: 'V';
        single: 4 as: 'IV';
        triple: 1 as: 'I'.
    ^ string
]
