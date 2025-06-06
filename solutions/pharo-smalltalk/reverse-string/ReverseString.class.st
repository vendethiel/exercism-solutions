Class {
	#name : 'ReverseString',
	#superclass : 'Object',
	#category : 'Exercise@ReverseString',
	#package : 'Exercise@ReverseString'
}

{ #category : 'string-manipulation' }
ReverseString >> reverseValue: s [
	s size < 2 ifTrue: [ ^s ].
	^ s last asString, (self reverseValue: s allButFirst allButLast) , s first asString
]
