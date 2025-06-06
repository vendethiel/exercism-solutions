"
Raindrop to string
"
Class {
	#name : 'Raindrops',
	#superclass : 'Object',
	#category : 'Exercise@Raindrops',
	#package : 'Exercise@Raindrops'
}

{ #category : 'strings' }
Raindrops >> convertNumber: n [
	| s |
	s := ''.
	(n isDivisibleBy: 3) ifTrue: [ s := s , 'Pling' ].
	(n isDivisibleBy: 5) ifTrue: [ s := s , 'Plang' ].
	(n isDivisibleBy: 7) ifTrue: [ s := s , 'Plong' ].
	s isEmpty ifTrue: [ s := n asString ].
	^ s.
]
