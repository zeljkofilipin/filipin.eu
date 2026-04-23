---
tags:  code ruby
title: 'Watir: Select Element Using HTML'
---
[Bret Pettichord](http://www.pettichord.com/) posted this at [wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg06838.html) few days ago.

If you have a link that looks like this:

{% highlight html %}
<a href="#" onclick="new Ajax.Request('/data_entry/ajax_add_term/131?contract_id=227', {asynchronous:true, evalScripts:true}); return false;">add a term</a>
{% endhighlight %}

you can click it using:

{% highlight ruby %}
browser.link(:html, /contract_id=227/).click
{% endhighlight %}
