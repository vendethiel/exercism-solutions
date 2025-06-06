"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestExerciseRobotSimulator',
	#superclass : 'PackageManifest',
	#category : 'Exercise@RobotSimulator-Manifest',
	#package : 'Exercise@RobotSimulator',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestExerciseRobotSimulator class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#Robot)) #'2024-05-08T20:15:24.204261+02:00') )
]
