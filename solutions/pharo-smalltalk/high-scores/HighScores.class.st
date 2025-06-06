Class {
	#name : 'HighScores',
	#superclass : 'Object',
	#instVars : [
		'scores'
	],
	#category : 'Exercise@HighScores',
	#package : 'Exercise@HighScores'
}

{ #category : 'adding' }
HighScores >> addScores: newScores [ 
	scores addAll: newScores
]

{ #category : 'initialization' }
HighScores >> initialize [
	scores := OrderedCollection new
]

{ #category : 'arrays' }
HighScores >> latestScore [
	^ scores last
]

{ #category : 'as yet unclassified' }
HighScores >> personalBestScores [
	^ scores max
]

{ #category : 'arrays' }
HighScores >> personalTopThreeScores [
	^ (scores sorted reverse first: (3 min: scores size)) asArray
]

{ #category : 'accessing' }
HighScores >> scores [
	^ scores asArray
]
