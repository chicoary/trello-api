Class {
	#name : #TrelloSearchCollections,
	#superclass : #TrelloSearch,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloSearchCollections >> options [
	^ options ifNil: [ options := Dictionary new ]
]
