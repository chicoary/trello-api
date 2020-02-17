Class {
	#name : #TrelloAPI,
	#superclass : #Object,
	#instVars : [
		'options'
	],
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloAPI class >> search [
	^ TrelloSearch new
]

{ #category : #'as yet unclassified' }
TrelloAPI class >> searchMembers [
	^ TrelloSearchMembers new
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
		ifFalse: [ self signalHTTPErrorCode: code ]
		ifTrue: [ result := STON fromString: response contents ]
]

{ #category : #'as yet unclassified' }
TrelloAPI >> includeOptionsTo: anUrl [ 
  
	"| stream |"
	"stream := WriteStream on: String empty."
	
	options ifNil: [ ^ anUrl ].
	
	^ String streamContents: [ :stream |
		stream nextPutAll: anUrl.
		options keysAndValuesDo: [ :key :value | 
			stream nextPut: $&; nextPutAll: key; nextPut: $=; nextPutAll: value asString.
		].
		stream contents 
	]
]

{ #category : #'as yet unclassified' }
TrelloAPI >> key [

	^ 'db9e904fa729a15bc38adb5a1fbf8bae'
]

{ #category : #'as yet unclassified' }
TrelloAPI >> signalHTTPErrorCode: aCode [ 
	(TrelloHTTPError code: aCode) signal
]

{ #category : #'as yet unclassified' }
TrelloAPI >> token [

	^ '3dc4847107774faa5512f42126c69ddfc1fc556416b8c0065a03e2ef665ac89c'
]
