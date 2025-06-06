"
isbn number checker
"
Class {
	#name : 'IsbnVerifier',
	#superclass : 'Object',
	#category : 'Exercise@IsbnVerifier',
	#package : 'Exercise@IsbnVerifier'
}

{ #category : 'testing' }
IsbnVerifier >> isValidIsbn: aString [ 
	|clean chars|
	clean := aString \ '-'.
	clean size = 10 ifFalse: [ ^false ].
	chars := clean asArray collectWithIndex: [ :x :i |
		(x asString = 'X') & (i = clean size)
			ifTrue: [10]
			ifFalse: [
				"if it's not an X, it has to be a digit"
				x isDigit ifFalse: [ ^false ].
				x asString asNumber
			]
	].
	^ (chars reverse collectWithIndex: [ :e :i | e * i ]) sum % 11 = 0.
]
