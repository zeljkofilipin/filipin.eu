---
tags:  TODO testing
title: 'Testing E-mail: Introduction'
---
Lately I have been testing e-mail functionality of one application. I will post my experience in two or three articles. This is the second one. Yesterday I blogged about [how to install SMTP server](/testing-e-mail-install-smtp-server/).

Testing is lots of fun. You do something, see what your application does and decide if it is correct behaviour.

Testing e-mail functionality of web applications is lots of fun, too. Also, it can be very time consuming.

Say, for example, you start a discussion at a forum. After discussion is started, forum members receive e-mail saying that new message is started. You could get the same e-mail, or just a confirmation e-mail saying that your contribution was successful. Some members maybe do not receive e-mails immediately after discussion is added, but receive a digest. Every 5, 10, 20 messages; daily, weekly, monthly digest. Some decided that they do not want any e-mail notification.

Another functionality of that forum could be that it receives e-mail. When member of forum sends an e-mail to forums e-mail address, discussion is started, it is visible at web interface, and members of forum receive e-mail notification, regarding of their preferences.

You can test all that. The boring part is waiting... and waiting... more waiting... and some more waiting. You get the point.

If you have Gmail account, you can use it for testing. If you have Gmail address username@gmail.com, just add +something between username and @gmail.com. Like this username+something@gmail.com. Anything you sent to that address will end up in your inbox. That way you can use one account for multiple users.

I would recommend that just for quick test. In my experience, sent e-mail will be delivered somewhere between a few seconds and a few hours. Rarely, even a few days. And the waiting part was really a problem to me.

There is a quicker way:

- Sending e-mail: [install SMTP Server](/testing-e-mail-install-smtp-server/) at your machine.
- Receiving e-mail (manual): set up application in a way that all mail is delivered to a folder at the same server were web application is, so you can quickly check it (no delays).
- Receiving e-mail (automated): set up POP3 server that will get all mail from that folder.

I do not know how to do that set up, I was lucky enough to have a colleague who did it for me. :)

I will provide more details on automated testing of e-mail functionality in the next post.
