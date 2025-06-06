"
Acronymize
"
Class {
	#name : 'Acronym',
	#superclass : 'Object',
	#category : 'Exercise@Acronym',
	#package : 'Exercise@Acronym'
}

{ #category : 'string-manipulation' }
Acronym >> abbreviatePhrase: phrase [ 
	^ ((phrase copyWithoutAll: '_.') findTokens: '- ') collect: [ :s|s first asUppercase ] as: String
]
