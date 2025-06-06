"
Tournament Compute Helper
"
Class {
	#name : 'Tournament',
	#superclass : 'Object',
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'printing' }
Tournament >> compute: lines [
	|computer|
	computer := TournamentComputer new.
	lines do: [ :line | computer process: line ].
	^ computer values
]

{ #category : 'printing' }
Tournament >> parse: lines [
	|parser|
	parser := TournamentParser new.
	^ lines collect: [ :line | parser parseLine: line ]
]

{ #category : 'printing' }
Tournament >> print: values [
	^ TournamentPrinter new print: values
]

{ #category : 'printing' }
Tournament >> tallyRows: rows [
	^ self print: (self compute: (self parse: rows))
]
