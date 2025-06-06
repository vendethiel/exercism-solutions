"
Forth Interpeter
"
Class {
	#name : 'ForthInterpreter',
	#superclass : 'Object',
	#instVars : [
		'stack',
		'aliases'
	],
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@Forth',
	#package : 'Exercise@Forth'
}

{ #category : 'class initialization' }
ForthInterpreter class >> initialize [
	mapping := {
		';' -> #semicolon.
		'+' -> #plus.
		'-' -> #minus.
		'*' -> #times.
		'/' -> #div.
		'over' -> #over.
		'swap' -> #swap.
		'dup' -> #dup.
		'drop' -> #drop.
	} asDictionary
]

{ #category : 'accessing' }
ForthInterpreter class >> mapping [
	^ mapping
]

{ #category : 'aliasing' }
ForthInterpreter >> alias: k to: xs [
	k isAllDigits ifTrue: [ Error signal: 'illegal operation' ].
	aliases at: k asLowercase put: ({xs. aliases copy})
]

{ #category : 'evaluation' }
ForthInterpreter >> all: xs [
	self all: xs under: aliases
]

{ #category : 'evaluation' }
ForthInterpreter >> all: xs under: local [
	xs do: [ :x | self interpret: x under: local ]
]

{ #category : 'evaluation' }
ForthInterpreter >> div [
	stack add: (self pop2 reduce: [ :a :b |
		a = 0 ifTrue: [ Error signal: 'divide by zero' ].
		(b / a) floor
	])
]

{ #category : 'evaluation' }
ForthInterpreter >> drop [
	self pop
]

{ #category : 'evaluation' }
ForthInterpreter >> dup [
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack add: stack last
]

{ #category : 'initialization' }
ForthInterpreter >> initialize [
	stack := OrderedCollection new.
	aliases := Dictionary new.
]

{ #category : 'evaluation' }
ForthInterpreter >> interpret: x [
	self interpret: x under: aliases
]

{ #category : 'evaluation' }
ForthInterpreter >> interpret: xx under: locals [
	|x|
	x := xx asLowercase.
	x isAllDigits
		ifTrue: [ stack add: x asNumber ]
		ifFalse: [
			locals at: x
				ifPresent: [ :xs | self all: xs first under: xs last ]
				ifAbsent: [ self mapped: x ]
		]
]

{ #category : 'evaluation' }
ForthInterpreter >> mapped: x [
	self class mapping at: x
		ifPresent: [ :sym | self perform: sym ]
		ifAbsent: [ Error signal: 'undefined operation' ]
]

{ #category : 'evaluation' }
ForthInterpreter >> minus [
	stack add: (self pop2 reduce: [ :a :b | b - a ])
]

{ #category : 'evaluation' }
ForthInterpreter >> over [
	|temp|
	temp := self pop2.
	stack
		add: temp last;
		add: temp first;
		add: temp last.
]

{ #category : 'evaluation' }
ForthInterpreter >> plus [
	stack add: (self pop2 reduce: [ :a :b | a + b ])
]

{ #category : 'removing' }
ForthInterpreter >> pop [
	stack ifEmpty: [ Error signal: 'empty stack' ].
	^ stack removeLast
]

{ #category : 'removing' }
ForthInterpreter >> pop2 [
	stack ifEmpty: [ Error signal: 'empty stack' ].
	stack size = 1 ifTrue: [ Error signal: 'only one value on the stack' ].
	^ { stack removeLast. stack removeLast }
]

{ #category : 'evaluation' }
ForthInterpreter >> stack [
	^ stack asArray
]

{ #category : 'evaluation' }
ForthInterpreter >> swap [
	|temp|
	temp := self pop2.
	stack
		add: temp first;
		add: temp last.
]

{ #category : 'evaluation' }
ForthInterpreter >> times [
	stack add: (self pop2 reduce: [ :a :b | a * b ])
]
