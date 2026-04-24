---
tags:  TODO testing watir
title: Test If Application Sends Correct E-mails
---
Interesting question appeared today at [wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/) mailing list.

> my application has sent an email to outlook. i want watir to open outlook, open the mail and get the mail data like from text and so on.

I also have to test my application to see if it sends correct e-mails. So I knew the answer.

> You do not have to open Outlook to see your mail. You can read you e-mail from ruby.
>
> \- receive e-mail - [Net::POP3](http://www.ruby-doc.org/stdlib/libdoc/net/pop/rdoc/index.html)  
> - send e-mail - [Net::SMTP](http://www.ruby-doc.org/stdlib/libdoc/net/smtp/rdoc/index.html)  
> - create (before sending) and parse e-mail (from file, after receiving) - [TMail](http://i.loveruby.net/en/projects/tmail/)
>
> Net::POP3 and Net::SMTP are included in Ruby. TMail needs installation. I had a problem with TMail installation, and I contacted author. He recommended this procedure, and now it works.
>
> `ruby setup.rb config --without-ext`  
> `ruby setup.rb setup`  
> `ruby setup.rb install`
