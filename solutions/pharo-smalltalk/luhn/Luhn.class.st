"
Luhn checker
"
Class {
	#name : 'Luhn',
	#superclass : 'Object',
	#category : 'Exercise@Luhn',
	#package : 'Exercise@Luhn'
}

{ #category : 'math functions' }
Luhn >> nine: n [
	^ n + n > 9
		ifTrue: [ n + n - 9 ]
		ifFalse: [ n + n ]		
]

{ #category : 'math functions' }
Luhn >> toLuhn: s [
	|even|
	even := s size even.
	^ (s asArray collectWithIndex: [ :e :i |
		(i even = even)
			ifTrue: [ e asDigit ]
			ifFalse: [ self nine: e asDigit ]
	]) sum
]

{ #category : 'math functions' }
Luhn >> validValue: s [
	|clean|
	"Check that's it's all 0-9\s"
	clean := (s copyWithout: Character space) detect: [ :l | l isDigit not ]
		ifFound: [ ^false ].

	clean size <= 1 ifTrue: [ ^false ].
	^ (self toLuhn: clean) isDivisibleBy: 10
]
