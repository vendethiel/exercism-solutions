"
Tournament Data Muncher
"
Class {
	#name : 'TournamentComputer',
	#superclass : 'Object',
	#instVars : [
		'data'
	],
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'initialization' }
TournamentComputer >> initialize [
	data := OrderedDictionary new
]

{ #category : 'accessing' }
TournamentComputer >> process: result [
	(self team: result from) ingest: result outcome.
	(self team: result to) ingest: result outcome opposite.
]

{ #category : 'accessing' }
TournamentComputer >> team: name [
	^ data at: name ifAbsentPut: [ TournamentTeam newNamed: name ]
]

{ #category : 'accessing' }
TournamentComputer >> values [
	^ data values
]
