Class {
	#name : 'BowlingStrike',
	#superclass : 'BowlingFrame',
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'accessing' }
BowlingStrike >> a [
	^ 10
]

{ #category : 'accessing' }
BowlingStrike >> bonusRolls [
	^ 2
]

{ #category : 'accessing structure variables' }
BowlingStrike >> pins [
	^ 10.
]

{ #category : 'mathematical functions' }
BowlingStrike >> pinsWithNext: next andSecond: second [
	^ self pins + (next twoThrowsWith: second)
]

{ #category : 'mathematical functions' }
BowlingStrike >> throws [
	^ 1
]

{ #category : 'mathematical functions' }
BowlingStrike >> twoThrowsWith: other [
	^ 10 + other a
]
