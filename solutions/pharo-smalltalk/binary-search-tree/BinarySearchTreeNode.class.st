Class {
	#name : 'BinarySearchTreeNode',
	#superclass : 'Object',
	#instVars : [
		'left',
		'data',
		'right'
	],
	#category : 'Exercise@BinarySearchTree',
	#package : 'Exercise@BinarySearchTree'
}

{ #category : 'instance creation' }
BinarySearchTreeNode class >> newFromData: aString [ 
	^ self new data: aString
]

{ #category : 'adding' }
BinarySearchTreeNode >> add: s [
	|cur new|
	cur := data asNumber.
	new := s asNumber.
	new <= cur
		ifTrue: [ self left: s ]
		ifFalse: [ self right: s ].
]

{ #category : 'accessing' }
BinarySearchTreeNode >> data [

	^ data
]

{ #category : 'accessing' }
BinarySearchTreeNode >> data: anObject [

	data := anObject
]

{ #category : 'accessing' }
BinarySearchTreeNode >> left [

	^ left
]

{ #category : 'accessing' }
BinarySearchTreeNode >> left: s [
	left
		ifNil: [ left := self class newFromData: s ]
		ifNotNil: [ left add: s ]
]

{ #category : 'accessing' }
BinarySearchTreeNode >> right [

	^ right
]

{ #category : 'accessing' }
BinarySearchTreeNode >> right: s [
	right
		ifNil: [ right := self class newFromData: s ]
		ifNotNil: [ right add: s ]
]

{ #category : 'array' }
BinarySearchTreeNode >> sortedData [
	^ Array streamContents: [ :out |
		self sortedData: out
	]
]

{ #category : 'arrays' }
BinarySearchTreeNode >> sortedData: out [
	left ifNotNil: [ left sortedData: out ].
	out nextPut: data.
	right ifNotNil: [ right sortedData: out ].
]
