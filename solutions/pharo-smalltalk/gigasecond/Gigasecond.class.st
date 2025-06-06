Class {
	#name : 'Gigasecond',
	#superclass : 'Object',
	#category : 'Exercise@Gigasecond',
	#package : 'Exercise@Gigasecond'
}

{ #category : 'adding' }
Gigasecond >> addMoment: aString [ 
	^ self print: (DateAndTime readFrom: aString readStream) + (1000000000 asSeconds).
]

{ #category : 'printing' }
Gigasecond >> print: date [ 
	^ String streamContents: [:c |
		date printYMDOn: c.
		c nextPutAll: 'T'.
		date printHMSOn: c.
	].
]
