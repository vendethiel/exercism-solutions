"
Space age calculator
"
Class {
	#name : 'SpaceAge',
	#superclass : 'Object',
	#classInstVars : [
		'mapping'
	],
	#category : 'Exercise@SpaceAge',
	#package : 'Exercise@SpaceAge'
}

{ #category : 'class initialization' }
SpaceAge class >> initialize [
	mapping := { 
		'Mercury' -> 0.2408467.
		'Venus' -> 0.61519726.
		'Earth' -> 1.0.
		'Mars' -> 1.8808158.
		'Jupiter' -> 11.862615.
		'Saturn' -> 29.447498.
		'Uranus' -> 84.016846.
		'Neptune' -> 164.79132.
	} asDictionary
]

{ #category : 'mathematical operations' }
SpaceAge class >> planetPeriod: planet [ 
	^ mapping at: planet
]

{ #category : 'mathematical functions' }
SpaceAge >> ageOnPlanet: planet at: seconds [
	^ seconds * (1 / (self class planetPeriod: planet)) / 31557600
]
