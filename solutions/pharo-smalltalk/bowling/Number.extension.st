Extension { #name : #Number }

{ #category : '*Exercise@Bowling' }
Number >> zeroIfNil [
	^ self
]

{ #category : '*Exercise@Bowling' }
Number >> isBowlingStrike [
	^ self = 10
]

{ #category : '*Exercise@Bowling' }
Number >> to: n sum: block [
	|total|
	total := 0.
	self to: n do: [ :i |
		total := total + (block value: i).
	].
	^ total.
]
