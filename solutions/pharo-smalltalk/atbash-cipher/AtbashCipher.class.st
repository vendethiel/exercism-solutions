"
Atbash Cipher
"
Class {
	#name : 'AtbashCipher',
	#superclass : 'Object',
	#category : 'Exercise@AtbashCipher',
	#package : 'Exercise@AtbashCipher'
}

{ #category : 'encryption' }
AtbashCipher >> decodePhrase: cyphered [
	^ (cyphered copyWithout: Character space) collect: #atbashShift
]

{ #category : 'encryption' }
AtbashCipher >> encodePhrase: cypher [
	^ ' ' join: (((cypher select: #isAlphaNumeric) groupsOf: 5) collect: [:grp | grp asLowercase collect: #atbashShift as: String])
]
