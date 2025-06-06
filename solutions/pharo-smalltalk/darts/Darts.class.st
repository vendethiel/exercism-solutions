"
Dart points calculator
"
Class {
	#name : 'Darts',
	#superclass : 'Object',
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'math functions' }
Darts >> scoreX: x y: y [ 
	(DistanceCalculator ofX: x y: y)
		ifAbove: 10 then: [ ^0 ];
		ifAbove: 5 then: [ ^1 ];
		ifAbove: 1 then: [ ^5 ];
		else: [ ^10 ].
]
