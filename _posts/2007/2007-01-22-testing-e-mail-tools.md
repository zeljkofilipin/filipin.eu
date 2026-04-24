---
tags:  testing
title: 'Testing E-mail: Tools'
---
Lately I have been testing e-mail functionality of one application. In the beginning I though that I would write two or three posts about that experience. Now I think there will be more, but not much more. I prefer more shorter articles that two or three longer ones. I am all about little steps, as you will shortly see.

This is the third article. Last week I wrote a little [introduction](/testing-e-mail-introduction/) and [how to install SMTP server](/testing-e-mail-install-smtp-server/).

As I wrote the [last year](/test-if-application-sends-correct-e-mails/), when testing e-mail, I am using [Ruby](http://www.ruby-lang.org/en/) and this Ruby libraries:

- receive e-mail - [Net::POP3](http://www.ruby-doc.org/stdlib/libdoc/net/pop/rdoc/index.html)
- send e-mail - [Net::SMTP](http://www.ruby-doc.org/stdlib/libdoc/net/smtp/rdoc/index.html)
- create (before sending) and parse e-mail (after receiving) - [TMail](http://i.loveruby.net/en/projects/tmail/)
