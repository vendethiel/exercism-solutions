Class {
	#name : 'FlattenArray',
	#superclass : 'Object',
	#category : 'Exercise@FlattenArray',
	#package : 'Exercise@FlattenArray'
}

{ #category : 'converting - arrays' }
FlattenArray >> flattenArray: xs [ 
	^ xs isArray 
		ifTrue: [ xs flattened copyWithout: nil ]
		ifFalse: [ xs ]
]
