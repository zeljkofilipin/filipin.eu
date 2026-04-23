---
tags:  code
title: Troubleshooting SMTP Issues with Telnet
---
I have really bad memory. I have to write this down. I just know I will forget it, but need it later.

I had to find out why one user did not receive any mail from us. I tried the usual things, but all looked fine. My colleague suggested to troubleshoot it with telnet. I found good article about [troubleshooting SMTP issues](http://www.novell.com/coolsolutions/trench/9879.html). What I did:

- open command prompt
- find server {% highlight shell %}
>nslookup -querytype=MX [domain]
...
Non-authoritative answer:
[domain] MX preference = [integer], mail exchanger = [subdomain].[domain]
...
{% endhighlight %}
- connect to that machine with telnet {% highlight shell %}
>telnet [subdomain].[domain] 25
{% endhighlight %}
- good {% highlight shell %}
220 SMTP Proxy Server Ready
{% endhighlight %}
- not so good {% highlight shell %}
554 Transaction Failed Listed in connection control deny list
{% endhighlight %}
