Class {
	#name : #TrelloSearchMembers,
	#superclass : #TrelloSearch,
	#category : #'TrelloAPI-Core'
}

{ #category : #'as yet unclassified' }
TrelloSearchMembers >> defaultSearchUrl [
	^ 'https://api.trello.com/1/search/members/?query={1}&key={2}&token={3}'
]
