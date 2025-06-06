"
sieve
"
Class {
	#name : 'Sieve',
	#superclass : 'Object',
	#category : 'Exercise@Sieve',
	#package : 'Exercise@Sieve'
}

{ #category : 'prime' }
Sieve >> primesLimit: n [ 
	^ Integer primesUpTo: (1 + n)
]
