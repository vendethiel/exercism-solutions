Class {
	#name : 'Binary',
	#superclass : 'Object',
	#category : 'Exercise@Binary',
	#package : 'Exercise@Binary'
}

{ #category : 'tests - binary' }
Binary >> decimalFromBinary: s [ 
	^ ((s reversed asArray) withIndexCollect: [ :l :i |
		('01' includes: l) ifFalse: [ ^ nil ].
		l asString asNumber * (2 raisedTo: i - 1)
	]) sum
]
