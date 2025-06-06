"
Tournament Result Printer
"
Class {
	#name : 'TournamentPrinter',
	#superclass : 'Object',
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'accessing' }
TournamentPrinter >> header [
	^ 'Team                           | MP |  W |  D |  L |  P'
]

{ #category : 'accessing' }
TournamentPrinter >> print: data [
	self sort: data.
	^ {self header} , (data collect: [:team | self team: team])
]

{ #category : 'accessing' }
TournamentPrinter >> sort: data [
	data sort: [ :a :b |
		(a points = b points)
			ifTrue: [ a name < b name ]
			ifFalse: [ a points > b points ]
	]
]

{ #category : 'accessing' }
TournamentPrinter >> team: team [
	^ '{1} | {2} | {3} | {4} | {5} | {6}' format: {
		team name padRightTo: 30.
		team mp asString padLeftTo: 2.
		team w asString padLeftTo: 2.
		team d asString padLeftTo: 2.
		team l asString padLeftTo: 2.
		team points asString padLeftTo: 2.
	}
]
