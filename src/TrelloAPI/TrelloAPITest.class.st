"
A TrelloAPITest is a test class for testing the behavior of TrelloAPI
"
Class {
	#name : #TrelloAPITest,
	#superclass : #TestCase,
	#category : #'TrelloAPI-Tests'
}

{ #category : #tests }
TrelloAPITest >> testSearchAll [
	| result |
	result := TrelloAPI search all 
		query: 'Pharo';
		get.
	self assert: [((result at: #cards) collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']]. 
	
]

{ #category : #tests }
TrelloAPITest >> testSearchAllWithOptions [
	| result |
	result := TrelloAPI search all 
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
	result := TrelloAPI search boards 
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :board | board at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchCards [
	| result |
	result := TrelloAPI search cards 
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :card | card at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchMembers [
	| result |
	result := TrelloAPI search members 
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :member | member at: #name ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchOrganizations [
	| result |
	result := TrelloAPI search organizations
		query: 'Pharo';
		get.
	self assert: [(result collect: [ :organization | organization at: #displayName ]) allSatisfy: [ :name | name includesSubstring: 'Pharo']].
]

{ #category : #tests }
TrelloAPITest >> testSearchSearchSlashMembers [
	| result |
	result := TrelloAPI searchMembers 
		query: 'Martins';
		get.
	self assert: [(result collect: [ :member | member at: #fullName ]) allSatisfy: [ :name | 
			name asUppercase includesSubstring: 'Martins' asUppercase]].
]
