---
tags:  photo watir
title: page-object API should be more similar to watir API
---
![Random photo: Rijeka, Croatia.](/assets/2012/page-object-api-should-be-more-similar-to-watir-api.jpg "Random photo: Rijeka, Croatia.")

I have just created [issue 102](https://github.com/cheezy/page-object/issues/102) for [page-object gem](https://github.com/cheezy/page-object). After I wrote it, I thought it would be a good blog post too, so I am reposting it here. If you agree, or not, please comment at GitHub issue, not here.

------------------------------------------------------------------------

I am pretty sure I am not the only one that has experience with watir API, and gets confused because page-object gem uses different names for some page elements.

Examples:

<table border="1">
<tr>
<th>HTML</th>
<th>watir</th>
<th>page-object</th>
</tr>
<tr>
<td>td</td>
<td>td</td>
<td>cell</td>
</tr>
<tr>
<td>hidden</td>
<td>hidden</td>
<td>hidden_field</td>
</tr>
<tr>
<td>img</td>
<td>img</td>
<td>image</td>
</tr>
<tr>
<td>a</td>
<td>a</td>
<td>link</td>
</tr>
<tr>
<td>li</td>
<td>li</td>
<td>list_item</td>
</tr>
<tr>
<td>ol</td>
<td>ol</td>
<td>ordered_list</td>
</tr>
<tr>
<td>p</td>
<td>p</td>
<td>paragraph</td>
</tr>
<tr>
<td>input type="radio"</td>
<td>radio</td>
<td>radio_button</td>
</tr>
<tr>
<td>select</td>
<td>select</td>
<td>select_list</td>
</tr>
<tr>
<td>td</td>
<td>td</td>
<td>cell</td>
</tr>
<tr>
<td>textarea</td>
<td>textarea</td>
<td>text_area</td>
</tr>
<tr>
<td>ul</td>
<td>ul</td>
<td>unordered_list</td>
</tr>
</table>

I am all for making the API human-friendly, that is what watir tried to do in the beginning. After a few years we have noticed that people are getting confused with the API that sometimes uses the same names as HTML, and sometimes does not.

I would suggest that you leave the existing API as is and to create aliases for the people that are familiar with HTML and watir APIs.

Example: we should be able to access unordered list with both `unordered_list` and `ul`.

For more people thinking page-object API should be more similar to watir API, take a look at Alister's [Roll your own page objects](http://watirmelon.com/2012/06/04/roll-your-own-page-objects/) blog post (and comments).
