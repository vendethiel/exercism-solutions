"
Collats Conjecture
"
Class {
	#name : 'CollatzConjecture',
	#superclass : 'Object',
	#category : 'Exercise@CollatzConjecture',
	#package : 'Exercise@CollatzConjecture'
}

{ #category : 'mathematical functions' }
CollatzConjecture >> doStep: n [
	^ n even
		ifTrue: [ n / 2 ]
		ifFalse: [ n * 3 + 1 ]
]

{ #category : 'mathematical functions' }
CollatzConjecture >> stepsFrom: n [
	n <= 0 ifTrue: [ Error signal: 'Only positive numbers are allowed' ].
	^  n = 1
		ifTrue: [ 0 ]
		ifFalse: [ 1 + (self stepsFrom: (self doStep: n)) ]
]
