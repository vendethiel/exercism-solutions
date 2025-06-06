Class {
	#name : 'CircularBuffer',
	#superclass : 'Object',
	#instVars : [
		'data',
		'capacity'
	],
	#category : 'Exercise@CircularBuffer',
	#package : 'Exercise@CircularBuffer'
}

{ #category : 'accessing' }
CircularBuffer >> capacity: n [
	data := OrderedCollection new.
	capacity := n.
]

{ #category : 'meta-object-protocol' }
CircularBuffer >> clear [
	data := OrderedCollection new.
]

{ #category : 'testing' }
CircularBuffer >> isFull [
	^ data size = capacity
]

{ #category : 'writing' }
CircularBuffer >> overwrite: n [
	self isFull ifTrue: [ self read ].
	self write: n
]

{ #category : 'meta-object-protocol' }
CircularBuffer >> read [
	^ data removeFirst
]

{ #category : 'writing' }
CircularBuffer >> write: n [
	self isFull ifTrue: [ Error signal: 'too big' ].
	data add: n
]
