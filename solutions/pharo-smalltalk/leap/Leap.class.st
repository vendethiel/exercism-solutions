Class {
	#name : 'Leap',
	#superclass : 'Object',
	#category : 'Exercise@Leap',
	#package : 'Exercise@Leap'
}

{ #category : 'numeric' }
Leap >> leapYear: n [ 
	^ (n isDivisibleBy: 4) & ((n isDivisibleBy: 100) not | (n isDivisibleBy: 400))
]
