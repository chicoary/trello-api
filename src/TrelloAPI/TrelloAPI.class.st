Class {
	#name : #TrelloAPI,
	#superclass : #Object,
	#instVars : [
		'options',
		'authorization',
		'endpoint',
		'prefix'
	],
	#classInstVars : [
		'authorizations'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloAPI class >> authorization: aTrelloAuthorization [ 
	^ self new initializeAuthorization: aTrelloAuthorization 
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> authorizedFor: anAuthorizeName [ 
	^ self new 
		initializeAuthorization: (authorizations at: anAuthorizeName) 
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> initialize [
	authorizations := Dictionary new
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> register: aTrelloAuthorization as: anAuthorizationName [ 
	authorizations at: anAuthorizationName put: aTrelloAuthorization
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> revokeTokenFor: anAuthorizationName [
	| result tokens token key authorization |
	authorization := authorizations at: anAuthorizationName.
	tokens := self tokens.
	token := authorization token.
	key := authorization key.
	result := (
		tokens/token
			key: key
	) delete.
	^ result
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> search [
	^ TrelloSearch new
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> tokens [
	^ TrelloTokens new
]

{ #category : #'as yet unclassified' }
TrelloAPI >> / aEndpointString [ 
	^ self endpointFor: aEndpointString
]

{ #category : #'as yet unclassified' }
TrelloAPI >> endpoint: anEndpointString [ 
	endpoint := anEndpointString
]

{ #category : #'as yet unclassified' }
TrelloAPI >> endpointFor: anEndpointString [
	^ anEndpointString asSymbol value: self
	
]

{ #category : #'as yet unclassified' }
TrelloAPI >> get [
	| response code url |
	url := self mountUrl.
	response := ZnEasy get: url.
	code := response code.
	^ code = 200
		ifFalse: [ self signalHTTPError: response statusLine ]
		ifTrue: [ STON fromString: response contents ]
]

{ #category : #initialization }
TrelloAPI >> initialize [
	prefix := 'https://api.trello.com/1'.
	options := ''
]

{ #category : #'as yet unclassified' }
TrelloAPI >> initializeAuthorization: aTrelloAuthorization [ 
	authorization := aTrelloAuthorization string
]

{ #category : #'as yet unclassified' }
TrelloAPI >> mountUrl [
	^ prefix , endpoint , options, authorization
]

{ #category : #'as yet unclassified' }
TrelloAPI >> options: aCollection [ 
	options := String streamContents: [ :stream |
		aCollection pairsDo: [ :key :value | 
			stream nextPut: $&; nextPutAll: key; nextPut: $=; nextPutAll: value asString.
		].
		stream contents
	]
]

{ #category : #'as yet unclassified' }
TrelloAPI >> search: aQueryString [ 
	self endpoint: ('/search?query={1}' format: { aQueryString })
]

{ #category : #'as yet unclassified' }
TrelloAPI >> searchMembers: aQueryString [ 
	endpoint := '/search/members/?query={1}' format: { aQueryString }
]

{ #category : #'as yet unclassified' }
TrelloAPI >> signalHTTPError: aStatusLine [ 
	(TrelloHTTPError statusLine: aStatusLine) signal
]
