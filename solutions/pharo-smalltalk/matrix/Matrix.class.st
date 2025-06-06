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
	^ ((line findTokens: ' ') collect: [ :i | i asNumber ]) asArray
]

{ #category : 'parsing' }
Matrix >> parse: str [
	^ ((str findTokens: String cr) collect: [ :line | self line: line ]) asArray 
]
