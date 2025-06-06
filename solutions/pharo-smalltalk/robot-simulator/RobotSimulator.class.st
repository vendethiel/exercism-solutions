"
Robot Simulator Starter
"
Class {
	#name : 'RobotSimulator',
	#superclass : 'Object',
	#instVars : [
		'robot'
	],
	#category : 'Exercise@RobotSimulator',
	#package : 'Exercise@RobotSimulator'
}

{ #category : 'perform' }
RobotSimulator >> sendInstructions: instructions [
	instructions do: [ :i | robot doInstructed: i ].
	^ robot synthesis.
]

{ #category : 'instance creation' }
RobotSimulator >> startFacing: dir atPosition: position [ 
	|direction|
	direction := Direction fromString: dir.
	robot := Robot newFacing: direction atX: (position at: 'x') atY: (position at: 'y').
	^ robot synthesis
]
