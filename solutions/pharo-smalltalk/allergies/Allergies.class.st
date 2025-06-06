"
Allergies computer
"
Class {
	#name : 'Allergies',
	#superclass : 'Object',
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@Allergies',
	#package : 'Exercise@Allergies'
}

{ #category : 'class initialization' }
Allergies class >> initialize [ 
	mapping := {
		'eggs' -> 1.
		'peanuts' -> 2.
		'shellfish' -> 4.
		'strawberries' -> 8.
		'tomatoes' -> 16.
		'chocolate' -> 32.
		'pollen' -> 64.
		'cats' -> 128.
	} asOrderedDictionary 
]

{ #category : 'accessing' }
Allergies class >> mapping [
  ^ mapping
]

{ #category : 'testing' }
Allergies >> allergicToItem: str forScore: n [ 
	^ (self class mapping at: str) & n > 0
]

{ #category : 'testing' }
Allergies >> allergyListForScore: n [
	^ self class mapping keys select: [ :x | self allergicToItem: x forScore: n ]
]
