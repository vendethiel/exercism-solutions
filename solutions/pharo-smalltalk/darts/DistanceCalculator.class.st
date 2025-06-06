"
Dart distance calculator
"
Class {
	#name : 'DistanceCalculator',
	#superclass : 'Object',
	#instVars : [
		'value'
	],
	#category : 'Exercise@Darts',
	#package : 'Exercise@Darts'
}

{ #category : 'instance creation' }
DistanceCalculator class >> ofX: x y: y [ 
	^ self new value: (x squared + y squared) sqrt
]

{ #category : 'accessing' }
DistanceCalculator >> else: elseBlock [ 
	elseBlock value
]

{ #category : 'defining conditions' }
DistanceCalculator >> ifAbove: ceil then: thenBlock [ 
	(value > ceil) ifTrue: thenBlock
]

{ #category : 'initialization' }
DistanceCalculator >> value: newValue [
	value := newValue
]
