Class {
	#name : 'BowlingOpen',
	#superclass : 'BowlingFrame',
	#instVars : [
		'a',
		'b'
	],
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'instance creation' }
BowlingOpen class >> from: a and: b [
	^ self new
		a: a;
		b: b;
		yourself
]

{ #category : 'accessing' }
BowlingOpen >> a [
	^ a
]

{ #category : 'accessing - structure variables' }
BowlingOpen >> a: value [
	a := value.
]

{ #category : 'accessing - structure variables' }
BowlingOpen >> b: value [
	b := value.
]

{ #category : 'accessing' }
BowlingOpen >> bonusRolls [
	^ 0
]

{ #category : 'accessing - structure variables' }
BowlingOpen >> pins [
	^ a + b zeroIfNil
]

{ #category : 'mathematical functions' }
BowlingOpen >> pinsWithNext: _ andSecond: __ [
	^ self pins
]

{ #category : 'mathematical functions' }
BowlingOpen >> throws [
	b ifNil: [ ^1 ].
	^ 2
]

{ #category : 'mathematical functions' }
BowlingOpen >> twoThrowsWith: _ [
	^ self pins
]
