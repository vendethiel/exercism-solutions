"
Tournament Team
"
Class {
	#name : 'TournamentTeam',
	#superclass : 'Object',
	#instVars : [
		'name',
		'mp',
		'w',
		'd',
		'l',
		'p'
	],
	#category : 'Exercise@Tournament',
	#package : 'Exercise@Tournament'
}

{ #category : 'instance creation' }
TournamentTeam class >> newNamed: aString [ 
	^ self new name: aString.
]

{ #category : 'accessing' }
TournamentTeam >> d [
	^ d
]

{ #category : 'data manipulation' }
TournamentTeam >> ingest: result [
	mp := mp + 1.
	w := w + result w.
	l := l + result l.
	d := d + result d.
	p := p + result points.
]

{ #category : 'initialization' }
TournamentTeam >> initialize [
	mp := w := d := l := p := 0.
]

{ #category : 'accessing' }
TournamentTeam >> l [
	^ l
]

{ #category : 'accessing' }
TournamentTeam >> mp [
	^ mp
]

{ #category : 'accessing' }
TournamentTeam >> name [
	^ name
]

{ #category : 'accessing' }
TournamentTeam >> name: aString [ 
	name := aString
]

{ #category : 'accessing' }
TournamentTeam >> points [
	^ p
]

{ #category : 'accessing' }
TournamentTeam >> w [
	^ w
]
