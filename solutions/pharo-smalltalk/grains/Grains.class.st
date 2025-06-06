Class {
	#name : 'Grains',
	#superclass : 'Object',
	#category : 'Exercise@Grains',
	#package : 'Exercise@Grains'
}

{ #category : 'accessing' }
Grains >> atSquare: n [
	n < 1 ifTrue: [ Error signal: 'square must be between 1 and 64' ].
	n > 64 ifTrue: [ Error signal: 'square must be between 1 and 64' ].
	n = 1 ifTrue: [ ^ 1 ].
	^ 2 * (self atSquare: (n - 1))
]

{ #category : 'accessing' }
Grains >> total [
	| x |
	x := 0.
	1 to: 64 do: [ :n | x := x + (self atSquare: n) ].
	^ x
]
