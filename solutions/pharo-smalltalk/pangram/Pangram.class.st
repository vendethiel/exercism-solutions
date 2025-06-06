"
Pangram checker
"
Class {
	#name : 'Pangram',
	#superclass : 'Object',
	#category : 'Exercise@Pangram',
	#package : 'Exercise@Pangram'
}

{ #category : 'testing' }
Pangram >> isPangramSentence: s [ 
	^ s asLowercase onlyLetters asSet size = 26
]
