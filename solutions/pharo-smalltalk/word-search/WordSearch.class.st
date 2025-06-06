"
Word Search Impl class
"
Class {
	#name : 'WordSearch',
	#superclass : 'Object',
	#category : 'Exercise@WordSearch',
	#package : 'Exercise@WordSearch'
}

{ #category : 'search' }
WordSearch >> bottomLeftToTopRightSearch: aString inGrid: grid [ 
	^ (self topLeftToBottomRightSearch: aString inGrid: grid reverse)
		ifNotNil: [ :r | r rowOffset: grid size ]
]

{ #category : 'search' }
WordSearch >> bottomRightToTopLeftSearch: aString inGrid: grid [ 
	^ (self topLeftToBottomRightSearch: aString reversed inGrid: grid) ifNotNil: [ :r | r swapRows swapColumns ]
]

{ #category : 'search' }
WordSearch >> bottomToTopSearch: aString inGrid: grid [ 
	^ (self topToBottomSearch: aString reversed inGrid: grid) ifNotNil: [ :r | r swapRows ]
]

{ #category : 'search' }
WordSearch >> find: aString inGrid: grid from: i and: j [
	aString withIndexDo: [ :l :offset |
		|r io jo|
		io := i + offset - 1.
		jo := j + offset - 1.
		(io > grid size) ifTrue: [ ^nil ].
		(jo > grid first size) ifTrue: [ ^nil ].
		r := (grid at: io) at: jo.
		(l = r) ifFalse: [ ^nil ]
	].
	^ WordSearchResult fromRow: i column: j toRow: i + aString size - 1 column: j + aString size - 1
]

{ #category : 'search' }
WordSearch >> ltrSearch: aString inGrid: grid [ 
	grid withIndexDo: [:el :i |
		|r|
		r := el findString: aString.
		(r > 0) ifTrue: [ 
			^ WordSearchResult fromRow: i column: r toRow: i column: r + aString size - 1.
		 ]
	].
	^ nil
]

{ #category : 'search' }
WordSearch >> rtlSearch: aString inGrid: grid [ 
	^ (self ltrSearch: aString reversed inGrid: grid) ifNotNil: [ :r | r swapColumns ]
]

{ #category : 'search' }
WordSearch >> search: aString inGrid: aCollection [ 
	(self ltrSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self rtlSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self topToBottomSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self bottomToTopSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self topLeftToBottomRightSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self bottomRightToTopLeftSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self topRightToBottomLeftSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	(self bottomLeftToTopRightSearch: aString inGrid: aCollection) ifNotNil: [ :r | ^r ].
	^ nil
]

{ #category : 'search' }
WordSearch >> searchWordsToSearchFor: xs grid: grid [ 
	|coll|
	coll := Dictionary new.
	xs do: [ :el |
		coll at: el put: (self search: el inGrid: grid).
	 ].
^ coll.
]

{ #category : 'search' }
WordSearch >> topLeftToBottomRightSearch: aString inGrid: grid [ 
	1 to: grid size do: [ :i |
		1 to: grid first size do: [ :j |
			(self find: aString inGrid: grid from: i and: j) ifNotNil: [ :r | ^r ].
		]
	].
	^ nil
]

{ #category : 'search' }
WordSearch >> topRightToBottomLeftSearch: aString inGrid: grid [ 
	^ (self topLeftToBottomRightSearch: aString inGrid: (grid collect: #reverse))
		ifNotNil: [ :r | r columnOffset: grid size ]
]

{ #category : 'search' }
WordSearch >> topToBottomSearch: aString inGrid: grid [ 
	grid ifEmpty: [ ^nil ].
	1 to: grid first size do: [ :i |
		|col r|
		col := '' join: (grid collect: [:c | c at: i]).
		r := col findString: aString.
		(r > 0) ifTrue: [ 
			^ WordSearchResult fromRow: r column: i toRow: r + aString size - 1 column: i.
		 ]
	 ].
	^ nil.
]
