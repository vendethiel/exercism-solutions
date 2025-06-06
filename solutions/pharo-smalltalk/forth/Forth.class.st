"
Forth Interpeter starter
"
Class {
	#name : 'Forth',
	#superclass : 'Object',
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'code evaluation' }
Forth >> eval: parts in: interpreter [
	parts first = ':'
		ifTrue: [
			parts removeFirst.
			parts removeLast. 
			interpreter alias: (parts first) to: (parts allButFirst)
		]
		ifFalse: [ interpreter all: parts ]
]

{ #category : 'code evaluation' }
Forth >> evaluateInstructions: xs [ 
	| interpreter |
	interpreter := ForthInterpreter new.
	xs do: [:x | self eval: (x findTokens: ' ') in: interpreter ].
	^ interpreter stack
]
