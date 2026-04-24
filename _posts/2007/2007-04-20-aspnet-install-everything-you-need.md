---
tags:  software
title: ASP.NET - Install Everything You Need
---
Recently [I started to play with ASP.NET](/first-steps-in-aspnet). I found [asp.net](http://www.asp.net/), The Official Microsoft ASP.NET 2.0 Site. The first thing you have to do is to install required software.

In my opinion, they made the installation to complicated for total beginner. There are too many choices. I wish they had something like [Instant Rails](http://instantrails.rubyforge.org/wiki/wiki.pl). I lost some time figuring it out, so I decided to share my experience. Maybe it will help somebody. If you have comments, improvements, or if I did something wrong, please leave a comment.

At asp.net home page there is link GET ASP.NET. It leads to Essential Downloads page. There they say you need Microsoft .NET Framework Version 2.0 (framework) and Visual Web Developer 2005 Express Edition ([IDE](http://en.wikipedia.org/wiki/Integrated_development_environment)). Language version was easy to choose (English), but do I need Framework or SDK version of framework? That was also easily answered when I saw

> If you are new to web development, select the Framework download.

The truth is that you do not have to download framework. It will automatically be downloaded when you download IDE. I selected English version of IDE.

Download page opens with four *easy* steps.

The first step was to check if my computer meets the System Requirements. It did. That was easy enough. Also, uninstall any previous versions of SQL Server 2005, IDE and framework. I did not have any installed.

The second step is to download IDE. But, there is just to many options. Six. I just want to download an IDE for language I do not know nothing about, and they make me choose. I just knew that my colleague uses ASP.NET and C#. And at that page there are Visual Web Developer and Visual C# IDE-s. Later I found out that I do not need Visual C#. (But after I downloaded and installed it. Do not make the same mistake.)

After download (Visual Web Developer is what you need), execute downloaded file. Of course, you have to be logged in as administrator. At the third screen of installation wizard there is option to also download and install Microsoft MSDN 2005 Express Edition and Microsoft SQL Server 2005 Express Edition x86. You need only SQL Server. At the next screen I noticed that Microsoft .NET Framework 2.0 will also be installed.

The third step is to download updates and additional components. You can install additional components later if you want to, no need to do it now. You do not have to download updates if you perform Microsoft Update after installation. That is what I did. There was two updates for .NET Framework and one for Visual Studio. I just wonder why they just do not offer the newest version of IDE and .NET framework, but instead you have to download an old version and than update it.

The fourth step is registration. You have 30 days, so there is no rush. But beware (from [FAQ](http://msdn.microsoft.com/vstudio/express/register/faq/)):

> Without a registration key, downloaded Editions will no longer work after 30 days.

So, all you have to do is to [download Visual Web Developer](http://msdn.microsoft.com/vstudio/express/downloads/), make sure that SQL Server is also downloaded (while installing IDE) and perform [Microsoft Update](http://update.microsoft.com/) after installation.
