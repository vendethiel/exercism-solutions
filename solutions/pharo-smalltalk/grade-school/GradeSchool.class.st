"
Grad school management
"
Class {
	#name : 'GradeSchool',
	#superclass : 'Object',
	#instVars : [
		'students'
	],
	#category : 'Exercise@GradeSchool',
	#package : 'Exercise@GradeSchool'
}

{ #category : 'adding' }
GradeSchool >> addStudent: student [
	students add: student
]

{ #category : 'adding' }
GradeSchool >> addStudents: xs [
	xs do: [ :student | self addStudent: student ].
	students :=
	((students groupedBy: [ :student | student last ])
			values
			flatCollect: [ :sub | sub sort: [ :a :b | a first <= b first ] ])
		sort: [ :a :b | a last <= b last ]
]

{ #category : 'as yet unclassified' }
GradeSchool >> desiredGrade: n [
	^ students select: [ :student | student last = n ] thenCollect: [ :student | student first ]
]

{ #category : 'initialization' }
GradeSchool >> initialize [
	students := OrderedCollection new
]

{ #category : 'accessing' }
GradeSchool >> roster [
	^ students asArray collect: [ :student | student first ]
]
