Extension { #name : #CTArray2D }

{ #category : '*Exercise@Minesweeper' }
CTArray2D >> at: point ifInvalid: value [
	"If rowNumber,columnNumber is a valid index for the receiver, answer the corresponding element. Otherwise, answer value."

	(point y between: 1 and: self numberOfRows) ifFalse: [ ^ value ].
	(point x between: 1 and: self numberOfColumns) ifFalse: [ ^ value ].
	^self at: point
]
