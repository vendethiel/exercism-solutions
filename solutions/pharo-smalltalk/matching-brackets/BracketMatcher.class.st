"
Bracket matcher impl
"
Class {
	#name : 'BracketMatcher',
	#superclass : 'Object',
	#instVars : [
		'stack'
	],
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@MatchingBrackets',
	#package : 'Exercise@MatchingBrackets'
}

{ #category : 'class initialization' }
BracketMatcher class >> initialize [
	mapping := { '(' -> ')'. '[' -> ']'. '{' -> '}' } asDictionary
]

{ #category : 'accessing' }
BracketMatcher class >> mapping [
	^ mapping
]

{ #category : 'initialization' }
BracketMatcher >> initialize [
	stack := OrderedCollection new.
]

{ #category : 'testing' }
BracketMatcher >> isEmpty [
	^ stack isEmpty
]

{ #category : 'accessing' }
BracketMatcher >> match: x [
	self class mapping
		at: (x asString) ifPresent: [ stack add: x asString. ^false ].
	(self class mapping
		keyAtValue: (x asString) ifAbsent: [ nil ])
		ifNotNil: [ :matching |
			stack ifEmpty: [ ^true ].
			stack removeLast = matching
				ifFalse: [ ^true ]
		].
	^ false.
]
