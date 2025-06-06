"
RomanNumber represents a roman number being built
"
Class {
	#name : 'RomanNumber',
	#superclass : 'Object',
	#instVars : [
		'number',
		'string'
	],
	#category : 'Exercise@RomanNumerals',
	#package : 'Exercise@RomanNumerals'
}

{ #category : 'instance creation' }
RomanNumber class >> from: n [
	^self new init: n
]

{ #category : 'numeric' }
RomanNumber >> change: n to: s [
    [number >= n] whileTrue: [
        number := number - n.
        string := string , s.
    ]
]

{ #category : 'instance initialization' }
RomanNumber >> init: n [
	number := n.
	string := ''.
]

{ #category : 'numeric' }
RomanNumber >> value [
	^ string
]
