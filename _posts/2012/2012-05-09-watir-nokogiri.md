---
tags:  code drive ruby
title: watir-nokogiri
---
![Random Croatian Countryside](/assets/06dc5366979d11e19dc71231380fe523_6.jpg)

At [Test Automation Bazaar](http://watir.com/test-automation-bazaar/) [Aliaksandr Ikhelis](https://github.com/aikhelis) gave a lightning talk [Watir-Webdriver is slow (did you know that?)](https://docs.google.com/presentation/d/1DnO8XUsF_tppTW_c15VAPe89R35z-ytAsIgWu69arho/present#slide=id.gaee207f_1_46). He talked about the speed problem he had when [watir-webdriver](http://watirwebdriver.com/) was locating elements via [regular expression](http://en.wikipedia.org/wiki/Regular_expression) on big pages. (He also reported the [issue](https://github.com/watir/watir-webdriver/issues/108) at GitHub.)

Recently I have started working on a new project that had a similar speed problem, so I remembered Aliaksandr's talk. I found a solution using [Nokogiri](http://nokogiri.org/).

For example, you have to iterate over all `div` elements that have `id` attribute starting with `id`. Then, you have to do something with the last element.

The page that looks like this:

{% highlight html %}
...
<div id='id0'>0</div>
<div id='id1'>1</div>
...
<div id='id999'>999</div>
...
{% endhighlight %}

Watir code for iterating over elements and clicking the last one could look something like this.

{% highlight ruby %}
browser.divs(id: /^id/).each do |div|
  div.click if div.id == "id999"
end
{% endhighlight %}

You could do exactly the same thing using Watir and Nokogiri.

{% highlight ruby %}
Nokogiri::HTML(browser.html).css("div[id ^= 'id']").each do |div|
  browser.element(css: div.css_path).click if div["id"] == "id999"
end
{% endhighlight %}

The speed improvements is noticeable. For example, this script will click the last `div` using Nokogiri in about 0.2 seconds and using Watir in about 15 seconds.

{% highlight ruby %}
require "watir-webdriver"
browser = Watir::Browser.new :firefox

folder = Dir.pwd
browser.goto "file://#{folder}/div.html"

require "benchmark"
require "nokogiri"

Benchmark.bm do |x|
  x.report("nokogiri") do
    Nokogiri::HTML(browser.html).css("div[id ^= 'id']").each do |div|
      if div["id"] == "id999"
       css = div.css_path
       browser.element(css: css).wd.location_once_scrolled_into_view
       browser.element(css: css).flash
      end
    end
  end
end

Benchmark.bm do |x|
  x.report("watir") do
    browser.divs(id: /^id/).each do |div|
      if div.id == "id999"
        div.wd.location_once_scrolled_into_view
        div.flash
      end
    end
  end
end

browser.close
{% endhighlight %}

Output:

{% highlight shell %}
          user       system     total    real
nokogiri  0.040000   0.010000   0.050000 (  0.219716)
watir     1.980000   0.310000   2.290000 ( 15.309858)
{% endhighlight %}

There is a way to speed things up using just the Watir API, but I wanted to provide an example code if Watir API is sometimes too slow for your taste.

You can find more code at [watir-nokogiri](https://github.com/zeljkofilipin/watir-nokogiri).
