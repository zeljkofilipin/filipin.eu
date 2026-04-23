---
tags:  code
title: Check if "Please enter an email address" message appears
---
![Golden Gate Bridge](/assets/IMG_20130224_133708.jpg)

Random photo: Golden Gate Bridge, San Francisco

I have exchanged a few e-mails with [Karlo Šmid](http://tentamen.hr/) on how to [check if “Please enter an email address” message appears](http://stackoverflow.com/q/15636721/17469). I think it is an interesting question, so I will cross post my question from Stack Overflow here.

Given a simple page:

{% highlight ruby %}
<form>
  <input type="email">
  <button>click</button>
</form>
{% endhighlight %}

If I enter anything in text field that is not e-mail and click the button, `Please enter an email address` message appears.

Is there a way to to check if the message appears using Selenium or Watir? As far as I see, nothing new appears in browser DOM.

Since the page is using e-mail check that is built in feature of a browser, does it even make sense to check that error message appears? It is at the same level as checking if browser scroll bar works. We are no longer checking the web application, but the platform (browser).
