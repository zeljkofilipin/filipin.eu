---
tags:  code ruby
title: 'NoMethodError: undefined method `copy'' for File:Class'
---
I wanted to copy a file from Ruby. Documentation for [`File#copy`](http://www.ruby-doc.org/core/classes/File.html#M002607) said that

{% highlight ruby %}
File.copy(from, to)
{% endhighlight %}

should work. But, I got this error message:

{% highlight shell %}
NoMethodError: undefined method `copy' for File:Class
{% endhighlight %}

Google search led me to [ruby-talk post](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/131302) that said I should do:

{% highlight ruby %}
require "ftools"
{% endhighlight %}

I am just surprised that documentation did not make that clear.
