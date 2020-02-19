Class {
	#name : #TrelloHTTPError,
	#superclass : #Error,
	#instVars : [
		'statusLine'
	],
	#category : #'TrelloAPI-Exception'
}

{ #category : #'as yet unclassified' }
TrelloHTTPError class >> code: aCode [ 
	^ self new code: aCode 
]

{ #category : #'as yet unclassified' }
TrelloHTTPError class >> statusLine: aStatusLine [ 
	^ self new statusLine: aStatusLine 
]

{ #category : #accessing }
TrelloHTTPError >> description [ 	
	^ 'HTTP Error Code: ', statusLine code asString, ' Reason: ', statusLine reason
]

{ #category : #'as yet unclassified' }
TrelloHTTPError >> statusLine: aStatusLine [
	statusLine := aStatusLine
]
