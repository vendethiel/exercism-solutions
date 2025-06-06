"
Word counter
"
Class {
	#name : 'WordCount',
	#superclass : 'Object',
	#category : 'Exercise@WordCount',
	#package : 'Exercise@WordCount'
}

{ #category : 'string-manipulation' }
WordCount >> countWordsSentence: s [
	|ws clean|
	ws := ' :?!@$%^&,.',Character cr asString.
	clean := '^''|\W''|''\W|''$' asRegex copy: s translatingMatchesUsing: [:x | x copyWithout: $' ].
	^ (clean asLowercase findTokens: ws) asBag asDictionary
]
