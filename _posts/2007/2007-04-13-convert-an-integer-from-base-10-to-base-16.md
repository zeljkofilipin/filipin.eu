---
tags:  code ruby
title: Convert an Integer from Base 10 to Base 16
---
I needed to convert an integer from base 10 to base 16. I found the solution at [ruby-talk](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/234085).

Example: convert 15 from base 10 to base 16.

{% highlight ruby %}
15.to_s(16)
#=> "f"
{% endhighlight %}
