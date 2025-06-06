Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'Exercise@Die',
	#package : 'Exercise@Die'
}

{ #category : 'instance initialization' }
Die class >> withFaces: faces [
	^ self new faces: faces
]

{ #category : 'accessing' }
Die >> faces [
	^ faces
]

{ #category : 'accessing' }
Die >> faces: anInteger [ 
	faces := anInteger
]

{ #category : 'accessing' }
Die >> initialize [
	faces := 6
]

{ #category : 'random' }
Die >> roll [
	^ (1 to: faces) atRandom
]
