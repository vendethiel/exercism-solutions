Class {
	#name : 'SumOfMultiples',
	#superclass : 'Object',
	#category : 'Exercise@SumOfMultiples',
	#package : 'Exercise@SumOfMultiples'
}

{ #category : 'math functions' }
SumOfMultiples >> sumFactors: factors limit: level [ 
	^ (Array streamContents: [ :array |
		1 to: (level - 1) do: [ :n |
			(factors anySatisfy: [ :factor | n isDivisibleBy: factor ])
				ifTrue: [ array nextPut: n ]
		]
	]) sum: #yourself ifEmpty: 0
]
