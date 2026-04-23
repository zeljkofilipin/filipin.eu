---
tags:  TODO
title: Would My Watir Tests Run With Firewatir?
---
I saw this question at [watir-general](http://groups.google.com/group/watir-general/).

Short story is, there is no simple solution at the moment. I am just porting my tests from Watir to Firewatir and I have noticed two major differences:

1.  Firewatir does not see page text the same way as Watir does:
    - Watir would see "logged in as name".
    - Firewatir would see "logged in as\n\nname".
2.  Firefox sees relative urls in links, while Internet Explorer sees apsolute paths:
    - Watir would see "page.htm".
    - Firewatir would see "domain.com/page.htm".

I created a separate branch of my tests for Firewatir, until I see what should be changed in original tests to make them compatible with both Watir and Firewatir. If I can not make them work at both, I do not think that maintaining two branches will be much work.

If you are using id's for identifying page elements, I think most of your test should work.
