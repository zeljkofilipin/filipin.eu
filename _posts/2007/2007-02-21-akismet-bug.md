---
tags:  TODO
title: Akismet Bug
---
![Akismet Bug](/assets/askimet_t.png)

I started to get a lot of spam comments, and yesterday I installed [Askimet](http://akismet.com/). This morning, I found a bug in Askimet. Don't you just love to start a day with a bug? :)

This is bug report I sent.

> I think I found a bug.
>
> I have WordPress 2.1 and Akismet 2.0.
>
> At "/wp-admin/edit-comments.php?page=akismet-admin" page (Comments &gt; Akismet Spam) I have 51 spam comment, just enough for two pages.
>
> There I can click "2" or "Next Page »" link that leads me to "wp-admin/edit-comments.php?page=akismet-admin&apage=2" page.
>
> There are links "« Previous Page" and "1" that lead to "wp-admin/edit-comments.php?page=akismet-admin&apage=" page (please notice that the number "1" is missing at the end of the url).
>
> At that page I get this error message:
>
> "WordPress database error: \[You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-50, 0' at line 1\]  
> SELECT \* FROM wp\_comments WHERE comment\_approved = 'spam' ORDER BY comment\_date DESC LIMIT -50, 0"
>
> I guess that is because I am at page "\[...\]&apage=" and it should be "\[...\]&apage=1" (again, the number "1" is missing at the end of the url).
>
> Links "2" or "Next Page »" point to "\[...\]&apage=2" and links "« Previous Page" and "1" point to "\[...\]&apage=" instead of "\[...\]&apage=1" (once more, just to be sure, the number "1" is missing at the end of the url).
