Class {
	#name : 'Hamming',
	#superclass : 'Object',
	#category : 'Exercise@Hamming',
	#package : 'Exercise@Hamming'
}

{ #category : 'strings' }
Hamming >> distanceStrand1: aString strand2: bString [
	|i|
	i := 0.
	(aString size = bString size) ifFalse: [
		aString ifEmpty: [ Error signal: 'left strand must not be empty' ].
		bString ifEmpty: [ Error signal: 'right strand must not be empty' ].
		Error signal: 'left and right strands must be of equal length'
	].
	aString with: bString do: [ :x :y | x = y ifFalse: [ i := i + 1 ] ].
	^ i
]
