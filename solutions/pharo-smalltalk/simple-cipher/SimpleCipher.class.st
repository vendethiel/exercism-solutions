Class {
	#name : 'SimpleCipher',
	#superclass : 'Object',
	#instVars : [
		'key'
	],
	#category : 'Exercise@SimpleCipher',
	#package : 'Exercise@SimpleCipher'
}

{ #category : 'strings' }
SimpleCipher >> alphabetOffset: c [
	^ c charCode - $a charCode
]

{ #category : 'converting' }
SimpleCipher >> decode: s [
	^ s collectWithIndex: [ :e :i | self decode: e at: i ]
]

{ #category : 'cipher' }
SimpleCipher >> decode: char at: idx [
	|curo keyo|
	curo := self alphabetOffset: char.
	keyo := self alphabetOffset: (self keyAt: idx).
	^ self toLetter: curo - keyo.
]

{ #category : 'converting' }
SimpleCipher >> encode: s [
	^ s collectWithIndex: [ :e :i | self encode: e at: i ].
]

{ #category : 'cipher' }
SimpleCipher >> encode: char at: idx [
	|curo keyo|
	curo := self alphabetOffset: char.
	keyo := self alphabetOffset: (self keyAt: idx).
	^ self toLetter: curo + keyo.
]

{ #category : 'accessing' }
SimpleCipher >> initialize [ 
	key := 'aaaaaaaaaa'
]

{ #category : 'accessing' }
SimpleCipher >> key [
	^ key
]

{ #category : 'accessing' }
SimpleCipher >> key: aString [ 
	key := aString
]

{ #category : 'accessing' }
SimpleCipher >> keyAt: nn [
	|n|
	n := nn.
	"dumbest division ever"
	[ n > key size ] whileTrue: [ n := n - key size ].
	^ key at: n.
]

{ #category : 'cipher' }
SimpleCipher >> toLetter: n [
	^ ($a charCode + (n % 26)) asCharacter
]
