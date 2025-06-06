"
Diamond display
"
Class {
	#name : 'Diamond',
	#superclass : 'Object',
	#category : 'Exercise@Diamond',
	#package : 'Exercise@Diamond'
}

{ #category : 'string-manipulation' }
Diamond >> midSpaceFor: i [
	^ ((i - 1) * 2) - 1
]

{ #category : 'string-manipulation' }
Diamond >> mirror: xs [
	^ xs,xs allButLast reverse
]

{ #category : 'string-manipulation' }
Diamond >> rowsLetter: l [
	|range idx xs|
	range := $A to: $Z.
	idx := range indexOf: l first.
	xs := (1 to: idx) with: (range first: idx) collect: [ :i :e |
		|c sp mid|
		c := e asString.
		sp := ' ' repeat: idx - i.
		mid := i > 1
			ifTrue: [ c, (' ' repeat: (self midSpaceFor: i)) ]
			ifFalse: [ '' ].
		sp,mid,c,sp
	].
	^ self mirror: xs
]
