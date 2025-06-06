"
Bowling score calculator
"
Class {
	#name : 'Bowling',
	#superclass : 'Object',
	#category : 'Exercise@Bowling',
	#package : 'Exercise@Bowling'
}

{ #category : 'mathematical functions' }
Bowling >> checkSize: frames [
	|last extra wanted|
	frames size < 10 ifTrue: [ ^self ].
	last := frames at: 10.
	wanted := 10 + last bonusRolls.
	extra := 10 + (((frames allButFirst: 10) collect: #throws) sum: #yourself ifEmpty: 0).
	extra < wanted
		ifTrue: [ Error signal: 'Score cannot be taken until the end of the game' ].
	extra > wanted
		ifTrue: [ Error signal: 'Cannot roll after game is over' ].
	
]

{ #category : 'mathematical functions' }
Bowling >> scoreAfterRolling: rolls [
	|frames|
	rolls size < 10 ifTrue: [ Error signal: 'Score cannot be taken until the end of the game' ].
	frames := self splitFrames: rolls.
	self checkSize: frames.
	"loop to 10, ignore last 2 potential hits"
	^ 1 to: 10 sum: [ :i | |frame next second|
		frame := frames at: i.
		next := frames at: i + 1 ifInvalid: nil.
		second := frames at: i + 2 ifInvalid: nil.
		frame pinsWithNext: next andSecond: second.
	].
]

{ #category : 'mathematical functions' }
Bowling >> scoreRolling: n after: rolls [
	|frames|
	n < 0 ifTrue: [ Error signal: 'Negative roll is invalid' ].
	n > 10 ifTrue: [ Error signal: 'Pin count exceeds pins on the lane' ].
	frames := self splitFrames: (rolls copyWith: n).
	frames last pins > 10 ifTrue: [ Error signal: 'Pin count exceeds pins on the lane' ].
	self checkSize: frames.
]

{ #category : 'mathematical functions' }
Bowling >> splitFrames: rolls [
	^ Array streamContents: [ :out |
		|i|
		i := 1.
		[i <= rolls size] whileTrue: [
			|roll|
			roll := rolls at: i.
			i := i + 1.
			roll isBowlingStrike
				ifTrue: [ out nextPut: BowlingFrame strike ]
				ifFalse: [
					|next|
					next := rolls at: i ifInvalid: nil.
					out nextPut: (BowlingFrame from: roll and: next).
					i := i + 1. "skip next"
				]
		].
	]
]
