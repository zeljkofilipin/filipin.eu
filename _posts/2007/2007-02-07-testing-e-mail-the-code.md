---
tags:  code ruby
title: 'Testing E-mail: The Code'
---
Lately I have been testing e-mail functionality of web application. This is the fifth post about that experience. Last week I wrote about [lessons learned](/testing-e-mail-lessons-learned).

I have written a little framework that helps me with testing e-mail.

To use it, you will have to install [Ruby](http://www.ruby-lang.org/en/downloads/), [Tmail](/test-if-application-sends-correct-e-mails) and [SMTP server](/testing-e-mail-install-smtp-server).

Then download `mail.zip` (2,20 KB) and extract it. No installation required. There are even some unit tests (`unit_tests.rb`) and example code (`usage.rb`).

Send mail.

{% highlight ruby %}
SendMail.new(
  "user@domain",
  "application@domain",
  "title",
  "body").send
{% endhighlight %}

Check if application sent mail that you have expected.

{% highlight ruby %}
Mail.received?(
  [Mail.new(
    "application@domain",
    "user@domain",
    "title")])
{% endhighlight %}

For now, mail that is sent can only contain `from`, `to`, `subject` and `body`. While receiving, I only check `from`, `to` and `subject`

This is code that I am really using every day.

Please understand that I am a tester, not a developer, and I know that this code could be better. Feel free to improve it. Post bug reports and your comments here.
