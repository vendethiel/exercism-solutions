"
Verse outputter
"
Class {
	#name : 'TwelveDays',
	#superclass : 'Object',
	#classInstVars : [
		'verses',
		'ordinal'
	],
	#category : 'Exercise@TwelveDays',
	#package : 'Exercise@TwelveDays'
}

{ #category : 'class initialization' }
TwelveDays class >> initialize [
	verses := #( 'a Partridge in a Pear Tree' 'two Turtle Doves' 'three French Hens' 'four Calling Birds' 'five Gold Rings' 'six Geese-a-Laying' 'seven Swans-a-Swimming' 'eight Maids-a-Milking' 'nine Ladies Dancing' 'ten Lords-a-Leaping' 'eleven Pipers Piping' 'twelve Drummers Drumming' ).
	ordinal := #('first' 'second' 'third' 'fourth' 'fifth' 'sixth' 'seventh' 'eighth' 'ninth' 'tenth' 'eleventh' 'twelfth')
]

{ #category : 'accessing' }
TwelveDays class >> ordinal: n [ 
	^ ordinal at: n
]

{ #category : 'test data' }
TwelveDays class >> verses [
	^ verses
]

{ #category : 'test data' }
TwelveDays >> reciteStartVerse: start endVerse: end [ 
	| cur |
	cur := (self class verses copyFrom: start to: end).
	^ cur collectWithIndex: [ :e :i | self verse: i + start ]
]

{ #category : 'test data' }
TwelveDays >> verse: idx [
	| gifts |
	gifts := (self class verses takeFirst: idx - 1) reversed joinUsing: ', ' last: ', and '.
	^ 'On the ' , (self class ordinal: (idx - 1)) , ' day of Christmas my true love gave to me: ' , gifts , '.'
]
