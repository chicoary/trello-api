Class {
	#name : #TrelloCards,
	#superclass : #TrelloSearchCollections,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloCards >> get [
	self options at: #modelTypes put: #cards.
	^ super get at: #cards
]

{ #category : #'as yet unclassified' }
TrelloCards >> query [
	^ query
]

{ #category : #'as yet unclassified' }
TrelloCards >> query: aString [ 
	query := aString 
]
