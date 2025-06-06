"
row = x
column = y
"
Class {
	#name : 'RowColumnPoint',
	#superclass : 'Point',
	#category : 'Exercise@WordSearch',
	#package : 'Exercise@WordSearch'
}

{ #category : 'as yet unclassified' }
RowColumnPoint class >> withRow: row andColumn: column [
	^ self new row: row; column: column; yourself
]

{ #category : 'accessing' }
RowColumnPoint >> column [
	^ y
]

{ #category : 'accessing' }
RowColumnPoint >> column: c [
	self setX: x setY: c
]

{ #category : 'accessing' }
RowColumnPoint >> row [
	^ x
]

{ #category : 'accessing' }
RowColumnPoint >> row: r [
	self setX: r setY: y
]
