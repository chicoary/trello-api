Class {
	#name : #TrelloOrganizations,
	#superclass : #TrelloSearchCollections,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloOrganizations >> get [
	self options at: #modelTypes put: #organizations.
	^ super get at: #organizations
]
