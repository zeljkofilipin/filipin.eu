---
tags:  code commons ruby
title: One Does Not Simply Set Profile for Remote Chrome
---
[<img src="//upload.wikimedia.org/wikipedia/commons/thumb/2/24/21st_Amendment_Brewery_3.jpg/256px-21st_Amendment_Brewery_3.jpg" width="256" alt="21st Amendment Brewery 3" />](https://commons.wikimedia.org/wiki/File%3A21st_Amendment_Brewery_3.jpg "By Zeljko.filipin (Own work) [CC-BY-SA-3.0 (http://creativecommons.org/licenses/by-sa/3.0)], via Wikimedia Commons")

Random photo: [One Does Not Simply](http://knowyourmeme.com/memes/one-does-not-simply-walk-into-mordor) Get a Tour of [21st Amendment Brewery](http://21st-amendment.com/)

Recently I have shared code how to [set up a custom profile for **local** Firefox and Chrome](/chrome-profiles/). Then I tried to do the same for **remote** Firefox and Chrome. As usual, I had no problems with Firefox, but Chrome was significantly harder.

[After](http://watirwebdriver.com/chrome/) [reading](https://code.google.com/p/selenium/wiki/ChromeDriver) [the](https://code.google.com/p/selenium/wiki/RemoteWebDriver) [documentation](https://code.google.com/p/selenium/wiki/RubyBindings) and [source](http://src.chromium.org/svn/trunk/src/chrome/common/pref_names.cc) [code](http://src.chromium.org/svn/trunk/src/chrome/common/chrome_switches.cc), contacting [Sauce Labs support](http://support.saucelabs.com/home), asking at [watir-general](https://groups.google.com/d/msg/watir-general/spap9b1n0bU/dlmcHNOZ1HUJ), [selenium-users](https://groups.google.com/d/msg/selenium-users/8l_joYi0jSM/MATvCkEfb94J) and [Stack Overflow](http://stackoverflow.com/q/16218435/17469), offering maximum bounty for the question (500 reputation) and poking [Jari](https://github.com/jarib/) on [Twitter](https://twitter.com/zeljkofilipin/status/331402726955163650), I got [the answer](http://stackoverflow.com/a/16416941/17469). Jari, thanks again.

Firefox:

{% highlight ruby %}
require "watir-webdriver"

profile = Selenium::WebDriver::Firefox::Profile.new
profile["intl.accept_languages"] = "de"

caps = Selenium::WebDriver::Remote::Capabilities.firefox(firefox_profile: profile)
caps.platform = "Linux"
caps.version = 20

browser = Watir::Browser.new(
  :remote,
  url: "http://USERNAME:ACCESS-KEY@ondemand.saucelabs.com:80/wd/hub",
  desired_capabilities: caps)

browser.goto "http://sandbox.translatewiki.net/"
{% endhighlight %}

Chrome:

{% highlight ruby %}
require "watir-webdriver"

profile = Selenium::WebDriver::Chrome::Profile.new
profile["intl.accept_languages"] = "de"

caps = Selenium::WebDriver::Remote::Capabilities.chrome("chrome.profile" => profile.as_json['zip'])
caps.platform = "Linux"
caps.version = ""

browser = Watir::Browser.new(
  :remote,
  url: "http://USERNAME:ACCESS-KEY@ondemand.saucelabs.com:80/wd/hub",
  desired_capabilities: caps)

browser.goto "http://sandbox.translatewiki.net/"
{% endhighlight %}
