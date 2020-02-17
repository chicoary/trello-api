Class {
	#name : #TrelloBoards,
	#superclass : #TrelloSearchCollections,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloBoards >> get [
	self options at: #modelTypes put: #boards.
	^ super get at: #boards
	
]
