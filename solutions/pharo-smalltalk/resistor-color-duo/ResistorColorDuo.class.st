"
Adds color values
"
Class {
	#name : 'ResistorColorDuo',
	#superclass : 'Object',
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@ResistorColorDuo',
	#package : 'Exercise@ResistorColorDuo'
}

{ #category : 'class initialization' }
ResistorColorDuo class >> initialize [
	mapping := {
		'black'.
		'brown'.
		'red'.
		'orange'.
		'yellow'.
		'green'.
		'blue'.
		'violet'.
		'grey'.
		'white'.
	}
]

{ #category : 'accessing' }
ResistorColorDuo class >> mapping [
	^ mapping
]

{ #category : 'color' }
ResistorColorDuo >> valueOf: x [
	^ (self class mapping indexOf: x ifAbsent: [ Error signal: 'Invalid color' ]) - 1
]

{ #category : 'color' }
ResistorColorDuo >> valueWithColors: xs [
	^ ('' join: ((xs takeFirst: 2) collect: [ :x | (self valueOf: x) asString ])) asNumber
]
