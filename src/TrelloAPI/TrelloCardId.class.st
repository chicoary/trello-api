Class {
	#name : #TrelloCardId,
	#superclass : #TrelloCard,
	#instVars : [
		'id'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloCardId >> buildCardByIdUrl [
	| url |
	url := self defaultCardByIdUrl
		format:
			{self id.
			self key.
			self token}.
	^ url
]

{ #category : #'actions api' }
TrelloCardId >> get [
	| url |
	url := self buildCardByIdUrl.
	url := self includeOptionsTo: url.
	^ self getResultFrom: url
]

{ #category : #accessing }
TrelloCardId >> id [
	^ id
]

{ #category : #accessing }
TrelloCardId >> id: anObject [
	id := anObject
]
