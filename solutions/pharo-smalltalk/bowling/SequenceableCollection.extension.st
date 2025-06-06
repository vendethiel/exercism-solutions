Extension { #name : #SequenceableCollection }

{ #category : '*Exercise@Bowling' }
SequenceableCollection >> at: n ifInvalid: default [
	^ (n <= self size)
		ifTrue: [ self at: n ]
		ifFalse: [ default ]
]
