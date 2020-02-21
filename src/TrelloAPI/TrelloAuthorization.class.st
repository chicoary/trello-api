Class {
	#name : #TrelloAuthorization,
	#superclass : #Object,
	#instVars : [
		'key',
		'token'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloAuthorization class >> key: aKeyString token: aTokenString [
	^ self new initializeKey: aKeyString andToken: aTokenString
]

{ #category : #'as yet unclassified' }
TrelloAuthorization >> initializeKey: aKeyString andToken: aTokenString [
	key := aKeyString.
	token := aTokenString
]

{ #category : #'as yet unclassified' }
TrelloAuthorization >> key [
	^ key
]

{ #category : #'as yet unclassified' }
TrelloAuthorization >> string [
	^ '&key={1}&token={2}' format: { key. token }
]

{ #category : #'as yet unclassified' }
TrelloAuthorization >> token [
	^ token
]
