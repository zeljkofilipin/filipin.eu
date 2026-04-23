---
tags:  code ruby
title: What Gems Are Using Watir?
---
I was listening to [Ruby5 - Episode \#125](http://ruby5.envylabs.com/episodes/128-episode-125-november-5-2010) this morning and they have mentioned [gem-dependent](https://github.com/grosser/gem-dependent) gem. I thought it would be nice to find out which gems are using [Watir](http://watir.com/).

Installation is simple:

{% highlight shell %}
gem install gem-dependent
{% endhighlight %}

I had to install [parallel](https://github.com/grosser/parallel) gem too.

{% highlight shell %}
gem install parallel
{% endhighlight %}

It took a few minutes to run and I got a few error messages, but I also got the results back for all Watir-related gems that I am aware of.

{% highlight shell %}
gem dependent watir --source http://rubygems.org
Downloading specs for 17589 gems
(...)
Empact-rpx_now > 0.0.0
watirloo >= 1.6.2
watirsplash = 1.6.6
wsl >= 1.6.2
{% endhighlight %} {% highlight shell %}
gem dependent firewatir --source http://rubygems.org
(...)
brute-fuzzy >= 1.6.5
soda = 1.6.7
watir = 1.6.7
watircuke >= 1.6.5
{% endhighlight %} {% highlight shell %}
gem dependent commonwatir --source http://rubygems.org
(...)
firewatir = 1.6.7
mk_firewatir = 1.6.5
rwebunit >= 1.6.2
ryba >= 1.6.5
watir = 1.6.7
watircuke >= 1.6.5
{% endhighlight %} {% highlight shell %}
gem dependent safariwatir --source http://rubygems.org
(...)
auto_excerpt >= 0.3.7
watircuke >= 0.3.7
{% endhighlight %} {% highlight shell %}
gem dependent watir-webdriver --source http://rubygems.org
(...)
watir-proxy >= 0
{% endhighlight %} {% highlight shell %}
gem dependent celerity --source http://rubygems.org
(...)
buzzville >= 0
capybara >= 0.7.9
cuke4duke >= 0.8.2 (development)
nekohtml >= 0
{% endhighlight %}
