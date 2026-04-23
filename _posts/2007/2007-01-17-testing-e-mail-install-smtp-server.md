---
tags:  TODO
title: 'Testing E-mail: Install SMTP Server'
---
I will be writing about testing e-mail functionality of web applications in the next post or two. If you are serious about testing e-mail functionality, the first step is to install SMTP server at your machine. This is tested on Windows XP Professional, service pack 2. You will need Windows operating system CD.

Make sure you are logged in as administrator, or start Add or Remove Programs as administrator:

- go to Control Panel
- highlight Add or Remove Programs
- hold Shift key at keyboard
- press right mouse key
- select Run as...
- select administrator account
- enter password if necessary
- press button OK

At Add or Remove Programs:

- click Add/Remove Windows Components
- select Internet Information Services (IIS)
- click Details...
- check SMTP service check box
- Common Files, Internet Information Services Snap-in and World Wide Web Service will automatically select
- do not deselect anything
- finish installation
- you will be prompted to insert Windows operating system CD

I am using Ruby's [Net::SMTP](http://www.ruby-doc.org/stdlib/libdoc/net/smtp/rdoc/index.html) library for sending e-mail. I tried to send an e-mail and got this exception:

`Exception: 550 5.7.1 Unable to relay for community@site`

You need to change a setting or two:

- go to Internet Information Services (in Administrative Tools)
- right click Default SMTP Virtual Server
- click Properties
- select Access tab (second from the left)
- click button Relay... (bottom right)
- select Only the list below radio button
- click button Add...
- add 127.0.0.1

Many thanks to my colleague who helped me to install and adjust my SMTP server.
