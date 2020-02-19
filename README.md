# Pharo Smalltalk library for interaction with Trello API.

## Introduction

The TrelloAPI package, written in Pharo Smalltalk, allows searching and interaction through the Trello Restful API.

The messages in Smalltalk to interact with Trello aim for a formal similarity very close to the [API documentation](https://developers.trello.com/reference#introduction).

In the message that corresponds to the endpoint [/search](https://developers.trello.com/reference#search-1) and the example below shows how the Trello API documentation is emulated.

```smalltalk
TrelloAPI search all 
  query: 'Pharo';
  options: #(
    cards_limit 2
  );
  get.
```

## Authorizatiion

Before you can use the API you must inform the API Key and the Token.
You can get both by following the instructions at [Key API & Tokens](https://developers.trello.com/reference#api-key-tokens). Then run the following script in Playground:

```smalltalk
TrelloAPI 
	initializeKey: apiKeyString 
	token: tokenString.
```
