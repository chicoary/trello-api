"
The unit tests here are for documentation of how the library is used and not genuine test cases.
"
Class {
	#name : #TrelloAPITest,
	#superclass : #TestCase,
	#instVars : [
		'trelloAPI'
	],
	#category : #'TrelloAPI-Tests'
}

{ #category : #running }
TrelloAPITest >> setUp [ 
	super setUp.
	trelloAPI := TrelloAPI  authorizedFor: #chicoary
]

{ #category : #tests }
TrelloAPITest >> testRevokeToken [
	self fail. "To prevent accidents"
	TrelloAPI revokeTokenFor: #chicoary.
	
	self should: [
		trelloAPI search all 
			query: 'Pharo';
			get
	] 
	raise: TrelloHTTPError.
	
]

{ #category : #tests }
TrelloAPITest >> testSearch [
	| result |
	result := (trelloAPI endpoint: '/search?query=Pharo') get.
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	
]

{ #category : #tests }
TrelloAPITest >> testSearch2 [
	| result |
	result := (trelloAPI search: 'Pharo') get.
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	
]

{ #category : #tests }
TrelloAPITest >> testSearchSearchMembers [
	| result | 
	result := (trelloAPI endpoint: '/search/members/?query=Martins') get.
	self assert: [(result collect: [ :member | member at: #fullName ]) allSatisfy: [ :name | 
			name asUppercase includesSubstring: 'Martins' asUppercase]].
]

{ #category : #tests }
TrelloAPITest >> testSearchSearchMembers2 [
	| result | 
	result := (trelloAPI searchMembers: 'Martins') get.
	self assert: [(result collect: [ :member | member at: #fullName ]) allSatisfy: [ :name | 
			name asUppercase includesSubstring: 'Martins' asUppercase]].
	
]

{ #category : #tests }
TrelloAPITest >> testSearchSearchMembersWithOptions [
	| result | 
	result := (trelloAPI endpoint: '/search/members/?query=Martins&limit=2') get.
	self assert: [(result collect: [ :member | member at: #fullName ]) allSatisfy: [ :name | 
			name asUppercase includesSubstring: 'Martins' asUppercase]].
	self assert: result size equals: 2.
]

{ #category : #tests }
TrelloAPITest >> testSearchSearchMembersWithOptions2 [
	| result | 
	result := (trelloAPI 
		searchMembers: 'Martins'; 
		options: #(
			limit 2
		) 
	) get.
	self assert: [(result collect: [ :member | member at: #fullName ]) allSatisfy: [ :name | 
			name asUppercase includesSubstring: 'Martins' asUppercase]].
	self assert: result size equals: 2.
]

{ #category : #tests }
TrelloAPITest >> testSearchWithOptions [
	| result |
	result := (trelloAPI endpoint: '/search?query=Pharo&cards_limit=2') get.
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	self assert: (result at: #cards) size equals: 2. 
	
]

{ #category : #tests }
TrelloAPITest >> testSearchWithOptions2 [
	| result |
	result := (trelloAPI 
		search: 'Pharo'; 
		options: #(
			cards_limit 2
		) 
	) get.
	
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	self assert: (result at: #cards) size equals: 2. 
	
]
