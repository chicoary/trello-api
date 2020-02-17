Class {
	#name : #TrelloMembers,
	#superclass : #TrelloSearchCollections,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloMembers >> get [
	self options at: #modelTypes put: #members.
	^ super get at: #members
]

{ #category : #'as yet unclassified' }
TrelloMembers >> query [
	^ query
]

{ #category : #'as yet unclassified' }
TrelloMembers >> query: aString [ 
	query := aString 
]
