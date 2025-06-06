Extension { #name : #Character }

{ #category : '*Exercise@AtbashCipher' }
Character >> atbashShift [
	^ self isLetter
		ifTrue: [ (97 + (26 - 1 - (self charCode - 97))) asCharacter ]
		ifFalse: [ self ]
]
