Class {
	#name : 'BinarySearchTree',
	#superclass : 'Object',
	#instVars : [
		'data'
	],
	#category : 'Exercise@BinarySearchTree',
	#package : 'Exercise@BinarySearchTree'
}

{ #category : 'tree' }
BinarySearchTree >> treeData: xs [
	|root|
	root := BinarySearchTreeNode newFromData: xs first.
	xs allButFirst do: [ :x | root add: x ].
	^ root.
]
