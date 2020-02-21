Class {
	#name : #TrelloSearch,
	#superclass : #TrelloAPI,
	#instVars : [
		'query'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloSearch >> all [
	"nothing"
]

{ #category : #'as yet unclassified' }
TrelloSearch >> boards [
	^ TrelloBoards authorization: authorization 
]

{ #category : #'as yet unclassified' }
TrelloSearch >> buildSearchUrl [
	| url |
	url := self defaultSearchUrl
		format:
			{self query.
			self key.
			self token}.
	^ url
]

{ #category : #'as yet unclassified' }
TrelloSearch >> cards [
	^ TrelloCards authorization: authorization 
]

{ #category : #'as yet unclassified' }
TrelloSearch >> defaultSearchUrl [
	^ 'https://api.trello.com/1/search?query={1}&key={2}&token={3}'
]

{ #category : #'as yet unclassified' }
TrelloSearch >> get [
	| url |
	url := self buildSearchUrl.
	url := self includeOptionsTo: url.
	^ self getResultFrom: url
]

{ #category : #'as yet unclassified' }
TrelloSearch >> members [
	^ TrelloMembers authorization: authorization 
]

{ #category : #'as yet unclassified' }
TrelloSearch >> options: aCollection [ 
	
	options := self dictionaryFrom: aCollection
]

{ #category : #'as yet unclassified' }
TrelloSearch >> organizations [

	^ TrelloOrganizations authorization: authorization
]

{ #category : #accessing }
TrelloSearch >> query [
	^ query
]

{ #category : #'as yet unclassified' }
TrelloSearch >> query: aString [ 
	query := aString
]
