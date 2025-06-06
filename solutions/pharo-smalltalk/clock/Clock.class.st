Class {
	#name : 'Clock',
	#superclass : 'Object',
	#instVars : [
		'hour',
		'minute'
	],
	#category : 'Exercise@Clock',
	#package : 'Exercise@Clock'
}

{ #category : 'instance creation' }
Clock class >> hour: h minute: m [ 
	^ self new
		hour: h;
		minute: m;
		yourself
]

{ #category : 'arithmetic' }
Clock >> + m [
	self minute: minute + m
]

{ #category : 'arithmetic' }
Clock >> - m [
	self minute: minute - m
]

{ #category : 'comparing' }
Clock >> = o [
	^ (self hour = o hour) & (self minute = o minute)
]

{ #category : 'converting' }
Clock >> asString [
	^ hour asTwoCharacterString , ':', minute asTwoCharacterString
]

{ #category : 'accessing' }
Clock >> hour [
	^ hour
]

{ #category : 'accessing' }
Clock >> hour: h [
	hour := h % 24
]

{ #category : 'accessing' }
Clock >> minute [
	^ minute
]

{ #category : 'accessing' }
Clock >> minute: nn [
	|n|
	n := nn.
	[ n < 0 ] whileTrue: [ 
		n := n + 60.
		self hour: hour - 1
	 ].
	self hour: hour + (n / 60) floor.
	minute := n % 60
]
