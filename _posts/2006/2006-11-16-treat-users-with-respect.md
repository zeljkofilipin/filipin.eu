---
tags:  TODO
title: Treat Users With Respect
---
Yesterday I blogged how [TortoiseSVN 1.4.1 Crashes](/tortoisesvn-141-crashes/). I could not just click "Send" button at error report window because I have recently [reinstalled windows](/tools/) and I did not have default e-mail client configured (I use Gmail only). As a tester, I know a value of error report, so I wanted to send it. Also, I really like TortoiseSVN so I wanted to contribute. Configuring Outlook Express to use Gmail servers took some time, but fortunately I have done it already, so I knew where to find [documentation](http://mail.google.com/support/bin/answer.py?ctx=%67mail&hl=en&answer=12103).

I usually send error reports (especially when all I have to do is click a button), but there is usually no response. The exception is [Arachno Ruby IDE](http://www.ruby-ide.com/), but that is another story.

This morning, I was really (pleasantly) surprised when I found this in my inbox (posted with permission):

> It's a bug in Subversion when using the neon 0.26.2 library. I'm currently working with the Subversion guys on a fix for this. In the meantime, either deactivate SSPI authentication on the server or downgrade to TSVN 1.4.0. Sorry for the inconvenience.
>
> Stefan  
>   
> `--`  
> `       ___       "De Chelonian Mobile"`  
> `  oo  // \\      TortoiseSVN`  
> `(_,\/ \_/ \     The coolest Interface to`  
> `   \ \_/_\_/>    (Sub)Version Control`  
> `   /_/   \_\     http://tortoisesvn.net`  

Please notice the turtle in the signature, I really worked hard to reproduce it as in original, but with limited succes (I used [SimpleCode](http://www.simplebits.com/cgi-bin/simplecode.pl)).

Not only did I get the response, but there was also two workarounds for my problem. I do not have access to servers, and I have already downgraded to 1.4.0, but it was nice of him to let me know. Actually, after he gave me permission to post his response, he (once more) apologized for not having a fix "because we lack a test environment with a windows domain". 1.4.0 works fine for me, I upgraded by mistake (that is also another story), so as far as I am concerned, they can take their time. Also, I will surely send them all error reports from now on.

If you treat your users with respect, they will help you make better software.
