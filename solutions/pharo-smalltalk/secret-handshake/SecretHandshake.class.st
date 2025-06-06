"
Handshake coder
"
Class {
	#name : 'SecretHandshake',
	#superclass : 'Object',
	#category : 'Exercise@SecretHandshake',
	#package : 'Exercise@SecretHandshake'
}

{ #category : 'bit manipulation' }
SecretHandshake >> commandsNumber: n [
	|commands handshake|
	commands := #('wink' 'double blink' 'close your eyes' 'jump').
	handshake := (1 to: 4) select: [ :x |
		|mask|
		mask := 1 << (x - 1).
		(n bitAnd: mask) = mask
	] thenCollect: [ :x | commands at: x ].
	^ n > 16
		ifTrue: [ handshake reverse ]
		ifFalse: [ handshake ]
]
