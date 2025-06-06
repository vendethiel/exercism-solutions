Class {
	#name : 'BowlingFrame',
	#superclass : 'Object',
	#classInstVars : [
		'strike'
	],
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'instance creation' }
BowlingFrame class >> from: a and: b [ 
	^ (a + b zeroIfNil) isBowlingStrike
		ifTrue: [ BowlingSpare from: a and: b ]
		ifFalse: [ BowlingOpen from: a and: b ]
]

{ #category : 'instance creation' }
BowlingFrame class >> strike [
	strike ifNil: [ strike := BowlingStrike new ].
	^ strike.
]
