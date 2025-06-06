Class {
	#name : 'TournamentOutcome',
	#superclass : 'Object',
	#instVars : [
		'opposite'
	],
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'accessing' }
TournamentOutcome class >> initialize [
	|win loss draw|
	win := TournamentWin new.
	loss := TournamentLoss new.
	draw := TournamentDraw new.
	
	win opposite: loss.
	loss opposite: win.
	draw opposite: draw.
	
	mapping := (Dictionary new
		at: 'win' put: win;
		at: 'loss' put: loss;
		at: 'draw' put: draw;
		yourself
	).
]

{ #category : 'accessing' }
TournamentOutcome class >> of: outcome [
	mapping ifNil: [ self initialize ].
	^ mapping at: outcome
]

{ #category : 'accessing' }
TournamentOutcome >> opposite [
	^ opposite
]

{ #category : 'instance variables' }
TournamentOutcome >> opposite: opp [
	opposite := opp
]
