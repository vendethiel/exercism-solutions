Class {
	#name : 'Isogram',
	#superclass : 'Object',
	#category : 'Exercise@Isogram',
	#package : 'Exercise@Isogram'
}

{ #category : 'testing' }
Isogram >> isIsogramPhrase: str [ 
	|seen|
	seen := Set new.
	str asLowercase onlyLetters do: [:c |
		seen addIfNotPresent: c ifPresentDo: [ ^ false ]
	].
	^ true
]
