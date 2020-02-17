Class {
	#name : #TrelloHTTPError,
	#superclass : #Error,
	#instVars : [
		'code'
	],
	#category : #'TrelloAPI-Exception'
}

{ #category : #'as yet unclassified' }
TrelloHTTPError class >> code: aCode [ 
	^ self new code: aCode 
]

{ #category : #'as yet unclassified' }
TrelloHTTPError >> code: aCode [ 
	code := aCode
]

{ #category : #accessing }
TrelloHTTPError >> description [ 	
	^ 'HTTP Code: ', code asString 
]
