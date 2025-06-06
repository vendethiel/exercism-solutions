"
Matrix manipulation helper
"
Class {
	#name : 'Matrix',
	#superclass : 'Object',
	#category : 'Exercise@Matrix',
	#package : 'Exercise@Matrix'
}

{ #category : 'example' }
Matrix >> input: str atColumn: col [
	^ (self parse: str) collect: [ :row | row at: col ]
]

{ #category : 'example' }
Matrix >> input: str atRow: row [
	^ (self parse: str) at: row
]

{ #category : 'parsing' }
Matrix >> line: line [
	^ (line findTokens: ' ') asArray collect: [ :i | i asNumber ]
]

{ #category : 'parsing' }
Matrix >> parse: str [
	^ (str findTokens: String cr) asArray collect: [ :line | self line: line ]
]
