---
tags:  code
title: Log Parser and Batch Files
---
I am using [Log Parser](http://www.microsoft.com/downloads/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975cf8c07&displaylang=en) to parse log files. I parse a lot of files and I wanted to make a batch file that will do it for me.

I pasted my commands to a batch file, executed it, and to my surprise, it would parse the files but would not find anything.

This is content of my batch file:

{% highlight shell %}
LogParser "SELECT text FROM errors.log WHERE text LIKE '2008-%'"
{% endhighlight %}

When I execute it, it does not find anything:

{% highlight shell %}
C:\>parse_logs.cmd
C:\>LogParser "SELECT text FROM errors.log WHERE text LIKE '2008-'"

Statistics:
--
Elements processed: 34
Elements output: 0
Execution time: 0.02 seconds
{% endhighlight %}

When I executed the command from command prompt, Log Parser would find what I was looking for:

{% highlight shell %}
C:\>LogParser "SELECT text FROM errors.log WHERE text LIKE '2008-%'"

Statistics:
--
Elements processed: 34
Elements output: 24
Execution time: 0.02 seconds
{% endhighlight %}

I looked around, asked a few people but no luck.

I finally found the problem.

There is `%` in Log Parser SQL query:

{% highlight sql %}
LIKE '2008-%'
{% endhighlight %}

`%` represents variable in batch file, and if you take a closer look how batch file gets executed you will see that

{% highlight sql %}
LIKE '2008-%'
{% endhighlight %}

is executed as

{% highlight sql %}
LIKE '2008-'
{% endhighlight %}

I changed batch file to

{% highlight sql %}
LIKE '2008-%%'
{% endhighlight %}

and now it works.
