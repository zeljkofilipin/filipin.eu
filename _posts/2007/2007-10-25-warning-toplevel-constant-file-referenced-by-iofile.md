---
tags:  code ruby
title: 'warning: toplevel constant File referenced by IO::File'
---
I want to delete a file from `Application::Mail.download`. The problem is that inside `Application` module, `File.delete` calls `Application::File.delete`.

{% highlight ruby %}
module Application
  class File
    def delete
    end
  end
  class Mail
    def self.download
      File.delete "mail.eml"
    end
  end
end

Application::Mail.download
{% endhighlight %}

Run this code and you will get error message:

{% highlight shell %}
Exception: undefined method `delete' for Application::File:Class
{% endhighlight %}

I could rename `Application::File` to something else, but I created `Application` module because I wanted to name my classes as I wish without conflicts with Ruby classes.

One solution is to specify that I want to call `IO::File.delete`.

{% highlight ruby %}
def self.download
  IO::File.delete "mail.eml"
end
{% endhighlight %}

But then I get this warning:

{% highlight shell %}
warning: toplevel constant File referenced by IO::File
{% endhighlight %}

[How to ignore warning](http://www.ruby-forum.com/topic/127608) thread at [ruby-forum.com](http://www.ruby-forum.com/) provided the solution to removing warning. Add this at the beginning of the file:

{% highlight ruby %}
$VERBOSE = nil
{% endhighlight %}

But, I want to see other warnings. I know I can change the value of `$VERBOSE` to `nil` just before I call `IO::File.delete` and then change it back. That just feels wrong. Why am I getting that warning after all? Why do I get the warning after calling `IO::File.delete`? Am I doing something wrong?
