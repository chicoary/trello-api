# Pharo Smalltalk library for interaction with Trello API

## Introduction

The TrelloAPI package, written in Pharo Smalltalk, allows searching and interaction through the Trello Restful API.

The messages in Smalltalk to interact with Trello aim for a formal similarity very close to the [API documentation](https://developers.trello.com/reference#introduction).

In the message that corresponds to the endpoint [/search](https://developers.trello.com/reference#search-1) and the example below shows how the Trello API documentation is emulated.

```smalltalk
 (trelloAPI endpoint: '/search?query=Pharo') get
```

or

```smalltalk
(trelloAPI search: 'Pharo') get.
```

Additional parameters can be entered:

```smalltalk
(trelloAPI endpoint: '/search?query=Pharo&cards_limit=2') get
```

or

```smalltalk
(trelloAPI 
    search: 'Pharo'; 
    options: #(
        cards_limit 2
    ) 
) get
```

## Authorization

Before you can use the API you must inform the API Key and the Token.
You can get both by following the instructions at [Key API & Tokens](https://developers.trello.com/reference#api-key-tokens).

Then run the following script in Playground:

```smalltalk
TrelloAPI 
    register: (
      TrelloAuthorization 
        key: 'db9e904fa729a15ba38adb5a1fbf8bae' 
        token: '06a02a35f1cb0e67c9b6486a1f122653fe1fda4999fba2d7c8940f8bc4304252'
    )
    as: 'chicoary'.
```

**Important**:
	Be careful not to expose your API Key and Token. Do not create code where the Key API and Token are hardcoded and can be exposed in Github after a commit/push. If you do it by accident use the code below to revoke the token in Playground:
	
```smalltalk
TrelloAPI revokeTokenFor: 'çhicoary'
```

## Creation of a TrelloAPI instance

```smalltalk
trelloAPI := TrelloAPI authorizedFor: 'çhicoary' 
```
