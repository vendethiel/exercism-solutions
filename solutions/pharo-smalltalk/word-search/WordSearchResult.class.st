Class {
	#name : 'WordSearchResult',
	#superclass : 'Object',
	#instVars : [
		'start',
		'end'
	],
	#category : 'Exercise@WordSearch',
	#package : 'Exercise@WordSearch'
}

{ #category : 'instance creation' }
WordSearchResult class >> fromRow: rs column: cs toRow: re column: ce [ 
	|start end|
	start := RowColumnPoint withRow: rs andColumn: cs.
	end := RowColumnPoint withRow: re andColumn: ce.
	^ self withStart: start andEnd: end.
]

{ #category : 'as yet unclassified' }
WordSearchResult class >> withStart: s andEnd: e [ 
	^ self new start: s; end: e; yourself
]

{ #category : 'mutation' }
WordSearchResult >> columnOffset: anInteger [ 
	self start column: anInteger + 1 - start column.
	self end column: anInteger + 1 - end column.
]

{ #category : 'accessing' }
WordSearchResult >> end [
	^ end
]

{ #category : 'accessing' }
WordSearchResult >> end: aRowColumnPoint [ 
	end := aRowColumnPoint
]

{ #category : 'mutation' }
WordSearchResult >> rowOffset: anInteger [ 
	self start row: anInteger + 1 - start row.
	self end row: anInteger + 1 - end row.
]

{ #category : 'accessing' }
WordSearchResult >> start [
	^ start
]

{ #category : 'accessing' }
WordSearchResult >> start: aRowColumnPoint [ 
	start := aRowColumnPoint
]

{ #category : 'mutation' }
WordSearchResult >> swapColumns [
	|startCol endCol|
	startCol := start column.
	endCol := end column.
	start column: endCol.
	end column: startCol
]

{ #category : 'mutation' }
WordSearchResult >> swapRows [
	|startRow endRow|
	startRow := start row.
	endRow := end row.
	start row: endRow.
	end row: startRow.
]
