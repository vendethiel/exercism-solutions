"
Direction data
"
Class {
	#name : 'Direction',
	#superclass : 'Object',
	#instVars : [
		'name',
		'offsetX',
		'offsetY',
		'left',
		'right'
	],
	#classInstVars : [
		'mappings'
	],
	#category : 'Exercise@RobotSimulator',
	#package : 'Exercise@RobotSimulator'
}

{ #category : 'instance creation' }
Direction class >> fromString: name [
	^ mappings at: name
]

{ #category : 'accessing' }
Direction class >> initialize [
	|north east south west|
	north := self new name: 'north'; offsetX: 0; offsetY: 1.
	east := self new name: 'east'; offsetX: 1; offsetY: 0.
	south := self new name: 'south'; offsetX: 0; offsetY: -1.
	west := self new name: 'west'; offsetX: -1; offsetY: 0.
	
	north left: west; right: east.
	east left: north; right: south.
	south left: east; right: west.
	west left: south; right: north.

	mappings := { 'north' -> north. 'east' -> east. 'south' -> south. 'west' -> west } asDictionary
]

{ #category : 'accessing' }
Direction class >> mappings [
	mappings ifNil: [ self initialize ].
	^ mappings
]

{ #category : 'accessing' }
Direction >> left [
	^ left
]

{ #category : 'accessing' }
Direction >> left: aString [ 
	left := aString
]

{ #category : 'accessing' }
Direction >> name [
	^ name
]

{ #category : 'accessing' }
Direction >> name: aString [ 
	name := aString
]

{ #category : 'accessing' }
Direction >> offsetX [
	^ offsetX
]

{ #category : 'accessing' }
Direction >> offsetX: anInteger [ 
	offsetX := anInteger
]

{ #category : 'accessing' }
Direction >> offsetY [
	^ offsetY
]

{ #category : 'accessing' }
Direction >> offsetY: anInteger [ 
	offsetY := anInteger
]

{ #category : 'accessing' }
Direction >> right [
	^ right
]

{ #category : 'accessing' }
Direction >> right: aString [ 
	right := aString
]
