# Pharo Smalltalk library for interaction with Trello API.

The TrelloAPI package, written in Pharo Smalltalk, allows searching and interaction through the Trello restful api.

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
