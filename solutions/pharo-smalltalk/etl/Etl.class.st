"
ETL transformations
"
Class {
	#name : 'Etl',
	#superclass : 'Object',
	#category : 'Exercise@Etl',
	#package : 'Exercise@Etl'
}

{ #category : 'transformation' }
Etl >> transformData: mapping [
	|dict|
	dict := Dictionary new.
	mapping keysAndValuesDo: [ :k :xs |
		xs do: [ :x | dict at: x asLowercase put: k asNumber ]
	].
	^dict
]
