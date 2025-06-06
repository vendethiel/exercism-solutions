"
Tournament Result Parser
"
Class {
	#name : 'TournamentParser',
	#superclass : 'Object',
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'parsing' }
TournamentParser >> parseLine: line [
	|parts|
	parts := line findTokens: ';'.
	parts size = 3 ifFalse: [ Error signal: 'wrong format' ].
	^ TournamentResult newFromParts: parts
]
