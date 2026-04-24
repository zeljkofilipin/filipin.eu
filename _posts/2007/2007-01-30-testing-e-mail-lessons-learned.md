---
tags:  testing
title: 'Testing E-mail: Lessons Learned'
---
Lately I have been testing e-mail functionality of web application. This is the fourth post about that experience. Last week I wrote about [tools I use for e-mail testing](/testing-e-mail-tools/).

I suggest that you start with little steps, and I mean really little steps.

I assume that you have a test suite that tests web interface of your application. Some tests cause e-mails to be sent. But, until now, you have ignored that e-mails.

First, check if your application sends correct number of mails (see, really little steps). For example, if you are testing forum application, after start a discussion test is performed, check if every member of forum gets e-mail (depending on each member's settings).

Then, after you have checked number of e-mails after all your tests, start checking if e-mail headers (from, to, subject) are correct for every mail that is sent. After that is done, start checking body, and then attachments.

I think it is better to test only some properties of e-mail but for larger number of e-mails, than testing all properties of e-mail, but for small number of e-mails.

Of course, this is only my advice based on my recent experience. Adjust your tests to your context.
