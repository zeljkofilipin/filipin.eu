---
tags:  TODO image software
title: 'Search Companion: The Indexing Service query cannot be completed successfully because the volumes you have specified are not indexed.'
---
![sc.png](/assets/2007/search-companion-the-indexing-service-query-cannot-be-completed-successfully-because-the-volumes-you-have-specified-are-not-indexed.png)

I usually search application logs using Windows Explorer and it works fine. But this time, I tried to search for string *@domain* and Search Companion pop up appeared with error message "The Indexing Service query cannot be completed successfully because the volumes you have specified are not indexed." I knew that there was nothing wrong with indexing because all other searches were working fine.

Google search found a page [Unsolved Annoyances](http://www.compusmart.ab.ca/fenske/annoy.htm) that said you will get that error message if you search for strings that start with either of following characthers: !#@
