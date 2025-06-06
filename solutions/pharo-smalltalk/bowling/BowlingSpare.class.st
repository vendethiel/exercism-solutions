Class {
	#name : 'BowlingSpare',
	#superclass : 'BowlingFrame',
	#instVars : [
		'a',
		'b'
	],
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'instance creation' }
BowlingSpare class >> from: a and: b [
	^ self new
		a: a;
		b: b;
		yourself
]

{ #category : 'accessing' }
BowlingSpare >> a [
	^ a
]

{ #category : 'accessing structure variables' }
BowlingSpare >> a: value [
	a := value.
]

{ #category : 'accessing structure variables' }
BowlingSpare >> b: value [
	b := value.
]

{ #category : 'accessing' }
BowlingSpare >> bonusRolls [
	^ 1
]

{ #category : 'accessing structure variables' }
BowlingSpare >> pins [
	^ 10
]

{ #category : 'mathematical functions' }
BowlingSpare >> pinsWithNext: next andSecond: _ [
	^ self pins + next a
]

{ #category : 'accessing structure variables' }
BowlingSpare >> throws [
	^ 2
]

{ #category : 'mathematical functions' }
BowlingSpare >> twoThrowsWith: _ [
	^ self pins
]
