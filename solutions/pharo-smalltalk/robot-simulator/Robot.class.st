"
Robot object simulator
"
Class {
	#name : 'Robot',
	#superclass : 'Object',
	#instVars : [
		'direction',
		'x',
		'y'
	],
	#category : 'Exercise@RobotSimulator',
	#package : 'Exercise@RobotSimulator'
}

{ #category : 'instance creation' }
Robot class >> newFacing: direction atX: x atY: y [ 
	^ self new
		facing: direction;
		x: x;
		y: y.
]

{ #category : 'simulation' }
Robot >> A [
	self x: x + direction offsetX.
	self y: y + direction offsetY.
]

{ #category : 'simulation' }
Robot >> L [
	self facing: direction left
]

{ #category : 'simulation' }
Robot >> R [
	self facing: direction right
]

{ #category : 'perform' }
Robot >> doInstructed: c [
	self perform:
		((self class methodsInProtocol: #simulation)
			detect: [ :method | method selector asString = c asString ]
		) selector
]

{ #category : 'instance initialization' }
Robot >> facing: newDir [
	direction := newDir.
]

{ #category : 'fields description' }
Robot >> synthesis [
	|position|
	position := Dictionary new
		add: ('x'->x);
		add: ('y'->y);
		yourself.
	^ Dictionary new
		add: ('direction'->direction name);
		add: ('position'->position);
		yourself
]

{ #category : 'accessing' }
Robot >> x: newX [ 
	x := newX
]

{ #category : 'accessing' }
Robot >> y: newY [ 
	y := newY
]
