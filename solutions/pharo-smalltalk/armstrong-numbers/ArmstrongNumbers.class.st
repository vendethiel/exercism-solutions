"
Armstrong number check
"
Class {
	#name : 'ArmstrongNumbers',
	#superclass : 'Object',
	#category : 'Exercise@ArmstrongNumbers',
	#package : 'Exercise@ArmstrongNumbers'
}

{ #category : 'api' }
ArmstrongNumbers >> digits: n [ 
	^ n asString collect: [ :d | d asString asNumber ] as: Array
]

{ #category : 'testing' }
ArmstrongNumbers >> isArmstrongNumber: n [ 
	|digits|
	digits := self digits: n.
	^ (digits collect: [ :x | x ** digits size ]) sum = n
]
