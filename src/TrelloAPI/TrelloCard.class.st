Class {
	#name : #TrelloCard,
	#superclass : #TrelloAPI,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloCard >> / aString [ 
	^ TrelloCardId new
		id: aString 
]
