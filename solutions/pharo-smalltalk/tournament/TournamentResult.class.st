"
Tournament Match Result
"
Class {
	#name : 'TournamentResult',
	#superclass : 'Object',
	#instVars : [
		'from',
		'to',
		'outcome'
	],
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'instance creation' }
TournamentResult class >> newFromParts: parts [
	^ self new
		from: parts first;
		to: parts second;
		outcome: (TournamentOutcome of: parts third);
		yourself
]

{ #category : 'accessing' }
TournamentResult >> from [
	^ from
]

{ #category : 'accessing' }
TournamentResult >> from: aString [ 
	from := aString
]

{ #category : 'accessing' }
TournamentResult >> outcome [
	^ outcome
]

{ #category : 'accessing' }
TournamentResult >> outcome: newOutcome [ 
	outcome := newOutcome
]

{ #category : 'accessing' }
TournamentResult >> to [
	^ to
]

{ #category : 'accessing' }
TournamentResult >> to: aString [ 
	to := aString
]
