"
Minesweeper mine counter
"
Class {
	#name : 'Minesweeper',
	#superclass : 'Object',
	#category : 'Exercise@Minesweeper',
	#package : 'Exercise@Minesweeper'
}

{ #category : 'mathematical functions' }
Minesweeper >> annotateMinefield: terrain [
	|array|
	"CTArray2D doesn't support #() or #('')"
	(terrain isEmpty) ifTrue: [ ^terrain ].
	(terrain first isEmpty) ifTrue: [ ^terrain ].

	array := CTArray2D fromRows: (terrain collect: #asArray) pad: $*.
	array rowsAndColumnsPut: [:row :col |
		"WTB rowsAndColumnsValuesPut"
		(array atColumn: col atRow: row) isBomb
			ifTrue: [ $* ]
			ifFalse: [
				|bombs |
				bombs := (col@row) eightNeighbors count: [ :neighbor |
					(array at: neighbor ifInvalid: Character space) isBomb
				].
				bombs = 0
					ifTrue: [ Character space ]
					ifFalse: [ bombs asDigitCharacter ]
			]
	].
	^ array rows collect: [ :row | '' join: row ]
]
