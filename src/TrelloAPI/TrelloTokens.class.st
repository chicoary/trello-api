Class {
	#name : #TrelloTokens,
	#superclass : #TrelloAPI,
	#instVars : [
		'token',
		'key'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloTokens >> / aTokenString [ 
	token := aTokenString 
]

{ #category : #'as yet unclassified' }
TrelloTokens >> delete [
	| url |
	url := 'https://api.trello.com/1/tokens/{2}/?key={1}' format: { key. token }.
	^ ZnClient new
   		url: url;
   		"method: #DELETE;
   		execute;"
		delete;
   		response.
]

{ #category : #'as yet unclassified' }
TrelloTokens >> key: aKeyString [ 
	key := aKeyString 
]
