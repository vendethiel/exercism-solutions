Class {
	#name : 'Proverb',
	#superclass : 'Object',
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@Proverb',
	#package : 'Exercise@Proverb'
}

{ #category : 'testing' }
Proverb >> reciteStrings: xs [ 
	xs size < 1 ifTrue: [ ^ #() ].
	^ (xs overlappingPairsCollect: [ :x :y | 'For want of a ',x,' the ',y,' was lost.' ])
		copyWith: 'And all for the want of a ',xs first,'.'
]
