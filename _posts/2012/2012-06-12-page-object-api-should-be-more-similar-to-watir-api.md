---
tags:  image watir
title: page-object API should be more similar to watir API
---
![Random photo: Rijeka, Croatia.](/assets/2012/page-object-api-should-be-more-similar-to-watir-api.jpg "Random photo: Rijeka, Croatia.")

I have just created [issue 102](https://github.com/cheezy/page-object/issues/102) for [page-object gem](https://github.com/cheezy/page-object). After I wrote it, I thought it would be a good blog post too, so I am reposting it here. If you agree, or not, please comment at GitHub issue, not here.

------------------------------------------------------------------------

I am pretty sure I am not the only one that has experience with watir API, and gets confused because page-object gem uses different names for some page elements.

Examples:

| HTML               | watir    | page-object    |
| ------------------ | -------- | -------------- |
| td                 | td       | cell           |
| hidden             | hidden   | hidden_field   |
| img                | img      | image          |
| a                  | a        | link           |
| li                 | li       | list_item      |
| ol                 | ol       | ordered_list   |
| p                  | p        | paragraph      |
| input type="radio" | radio    | radio_button   |
| select             | select   | select_list    |
| td                 | td       | cell           |
| textarea           | textarea | text_area      |
| ul                 | ul       | unordered_list |

I am all for making the API human-friendly, that is what watir tried to do in the beginning. After a few years we have noticed that people are getting confused with the API that sometimes uses the same names as HTML, and sometimes does not.

I would suggest that you leave the existing API as is and to create aliases for the people that are familiar with HTML and watir APIs.

Example: we should be able to access unordered list with both `unordered_list` and `ul`.

For more people thinking page-object API should be more similar to watir API, take a look at Alister's [Roll your own page objects](http://watirmelon.com/2012/06/04/roll-your-own-page-objects/) blog post (and comments).
