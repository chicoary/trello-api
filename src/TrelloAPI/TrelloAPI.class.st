Class {
	#name : #TrelloAPI,
	#superclass : #Object,
	#instVars : [
		'options'
	],
	#classInstVars : [
		'token',
		'key'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #initialization }
TrelloAPI class >> initializeKey: aKeyString token: aTokenString [
	key := aKeyString.
	token := aTokenString 
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> key [

	^ key
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> revokeToken [
	| result tokens token key |
	tokens := TrelloAPI tokens.
	token := TrelloAPI token.
	key := TrelloAPI key.
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
TrelloAPI class >> searchMembers [
	^ TrelloSearchMembers new
]

{ #category : #accessing }
TrelloAPI class >> token [
	^ token
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> tokens [
	^ TrelloTokens new
]

{ #category : #'as yet unclassified' }
TrelloAPI >> dictionaryFrom: aCollection [ 

	"
	(TrelloSearch new dictionaryFrom: #(a alfa b beta)) >>> {#a->#alfa. #b->#beta} asDictionary
	"

	^ (aCollection pairsCollect: [ :key :value | key -> value ]) asDictionary
]

{ #category : #'as yet unclassified' }
TrelloAPI >> getResultFrom: url [
	| response result code |
	response := ZnEasy get: url.
	code := response code.
	^ code = 200
		ifFalse: [ self signalHTTPErrorCode: response statusLine ]
		ifTrue: [ result := STON fromString: response contents ]
]

{ #category : #'as yet unclassified' }
TrelloAPI >> includeOptionsTo: anUrl [ 
	
	options ifNil: [ ^ anUrl ].
	
	^ String streamContents: [ :stream |
		stream nextPutAll: anUrl.
		options keysAndValuesDo: [ :key :value | 
			stream nextPut: $&; nextPutAll: key; nextPut: $=; nextPutAll: value asString.
		].
		stream contents 
	]
]

{ #category : #accessing }
TrelloAPI >> key [ 
	^ TrelloAPI key
]

{ #category : #'as yet unclassified' }
TrelloAPI >> signalHTTPErrorCode: aStatusLine [ 
	(TrelloHTTPError statusLine: aStatusLine) signal
]

{ #category : #accessing }
TrelloAPI >> token [ 
	^ TrelloAPI token
]
