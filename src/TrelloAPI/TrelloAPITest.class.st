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
	trelloAPI := TrelloAPI  authorizedFor: #chicoary
]

{ #category : #tests }
TrelloAPITest >> testSearchAll [
	| result |
	result := trelloAPI search all 
		query: 'Pharo';
		get.
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	
]

{ #category : #tests }
TrelloAPITest >> testSearchAllWithOptions [
	| result |
	result := trelloAPI search all 
		query: 'Pharo';
		options: #(
			cards_limit 2
		);
		get.
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	self assert: (result at: #cards) size equals: 2. 
	
]

{ #category : #tests }
TrelloAPITest >> testSearchBoards [
	| result |
	result := trelloAPI search boards 
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :board | board at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchCards [
	| result |
	result := trelloAPI search cards 
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchMembers [
	| result |
	result := trelloAPI search members 
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :member | member at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchOrganizations [
	| result |
	result := trelloAPI search organizations
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :organization | organization at: #displayName ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchSearchSlashMembers [
	| result |
	result := trelloAPI searchMembers 
		query: 'Martins';
		get.
	self assert: [(result collect: [ :member | member at: #fullName ]) allSatisfy: [ :name | 
			name asUppercase includesSubstring: 'Martins' asUppercase]].
]
