---
tags:  code ruby
title: Chrome Profiles
---
[<img src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Trees_in_bloom.jpg/512px-Trees_in_bloom.jpg" width="512" alt="Trees in bloom" />](https://commons.wikimedia.org/wiki/File%3ATrees_in_bloom.jpg "By Zeljko.filipin (Own work) [CC-BY-SA-3.0 (http://creativecommons.org/licenses/by-sa/3.0)], via Wikimedia Commons")

Random photo: Spring in Zagreb, Croatia.

This will open [sandbox.translatewiki.net](http://sandbox.translatewiki.net/) in English using Firefox. The top link at the left hand side will be `Main page`.

{% highlight ruby %}
require "watir-webdriver"
browser = Watir::Browser.new :firefox
browser.goto "http://sandbox.translatewiki.net/"
{% endhighlight %}

This will open the same page in the same browser, but in German. The link will be `Hauptseite`.

{% highlight ruby %}
require "watir-webdriver"
profile = Selenium::WebDriver::Firefox::Profile.new
profile["intl.accept_languages"] = "de"
browser = Watir::Browser.new :firefox, :profile => profile
browser.goto "http://sandbox.translatewiki.net/"
{% endhighlight %}

I want to open the site in German using Chrome. I was able to find the solution using [Watir documentation on Chrome](http://watirwebdriver.com/chrome/) and [Chromium source code](http://src.chromium.org/svn/trunk/src/chrome/common/pref_names.cc). Now that I look at it, the solution is trivial and really similar to Firefox.

{% highlight ruby %}
require "watir-webdriver"
profile = Selenium::WebDriver::Chrome::Profile.new
profile["intl.accept_languages"] = "de"
browser = Watir::Browser.new :chrome, :profile => profile
browser.goto "http://sandbox.translatewiki.net/"
{% endhighlight %}
