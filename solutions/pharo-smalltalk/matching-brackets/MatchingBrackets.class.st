"
Bracket matcher
"
Class {
	#name : 'MatchingBrackets',
	#superclass : 'Object',
	#category : 'Exercise@MatchingBrackets',
	#package : 'Exercise@MatchingBrackets'
}

{ #category : 'testing' }
MatchingBrackets >> isPaired: string [
	|matcher|
	matcher := BracketMatcher new.
	(string anySatisfy: [ :x | matcher match: x ]) ifTrue: [^false].
	^ matcher isEmpty
]
