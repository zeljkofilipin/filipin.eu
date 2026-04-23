---
tags:  code
title: First Steps in ASP.NET
---
![asp.png](/assets/2007/first-steps-in-aspnet.png "asp.png")

My colleague is using [ASP.NET](http://msdn2.microsoft.com/en-us/asp.net/default.aspx). I decided to learn basics of it. After all, you have to [know your enemy](http://www.youtube.com/watch?v=wzkGHoOp3AQ). As it usually goes, pretty soon I got into trouble. [Internet Information Services](http://www.microsoft.com/WindowsServer2003/iis/default.mspx) (IIS 5.1) at my machine (Windows XP Professional, Service Pack 2) was processing server code of asp pages, but not of aspx. Internet Explorer would show HTML portion of aspx page, but server code was ignored. Firefox was showing asp pages, but for aspx pages I was getting "open with" pop-up.

What went wrong? [.NET Framework](http://msdn2.microsoft.com/en-us/netframework/default.aspx) and IIS are installed.

I started looking at Internet Information Services (Start &gt; All Programs &gt; Administrative Tools &gt; Internet Information Services). At ASP.NET tab of Web Sites Properties window (Internet Information Services &gt; local computer &gt; Web Sites &gt; right click &gt; Properties ) I saw that ASP.NET version is not selected, so I selected 2.0.50727 (1.1.4322 was also available).

No luck. I started getting this error page.

> Server Application Unavailable

Time to ask my [developer](http://en.wikipedia.org/wiki/Artillery) for help. He said I should create virtual directory.

- at C:\Inetpub\wwwroot\\ create directory asp
- Internet Information Services &gt; local computer &gt; Web Sites &gt; Default Web Site &gt; right click &gt; New &gt; Virtual Directory... &gt; enter alias ("asp" sounds good) &gt; browse to directory &gt; make sure "Read" and "Run scripts (such as ASP)" checkboxes are checked
- Internet Information Services &gt; local computer &gt; Web Sites &gt; Default Web Site &gt; virtual directory alias ("asp", remember) &gt; right click &gt; Properties &gt; ASP.NET &gt; ASP.NET version &gt; 2.0.50727

Then I got different error message.

> Failed to access IIS metabase.

According to [Failed to access IIS metabase](http://blog.devstone.com/Aaron/archive/2006/05/08/1586.aspx) blog post from R. Aaron Zupancic, the problem was:

> You may have installed IIS after installing the .NET framework.

True. I installed .NET framework immediately after I installed Windows, and I installed IIS later when I needed it. Solution? Open command prompt, go to C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727 and execute

{% highlight shell %}
aspnet_regiis -i
{% endhighlight %}

Everything works fine now. Firefox needed some time to start recognizing aspx pages (I was still getting "open with" pop-up), but now it works.
