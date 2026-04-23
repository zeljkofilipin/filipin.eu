---
tags:  code ruby
title: watir-webdriver and Sauce Labs OnDemand
---
![Bug Hunter's Journal](/assets/2012/watir-webdriver-and-sauce-labs-ondemand/bug_hunter-300x300.jpg "Bug Hunter's Journal")

For a couple of clients I have been running [watir](http://watir.com/)-webdriver tests using [Sauce Labs OnDemand](http://saucelabs.com/ondemand). Never heard about it? In short, instead of driving a browser at your local machine, you can drive a browser *in the cloud*. Sounds cool, right?

What changes should you do to your existing watir-webdriver scripts to run them *in the cloud*?

This would open Firefox at your local machine:

{% highlight ruby %}
require "rubygems"
require "watir-webdriver"
browser = Watir::Browser.new :firefox
{% endhighlight %}

And this would open Firefox at Sauce Labs OnDemand:

{% highlight ruby %}
require "watir-webdriver"
caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.version = "11"
caps.platform = :LINUX
caps[:name] = "testing this cloud thing"
browser = Watir::Browser.new(
  :remote,
  :url => "http://username:api-key@ondemand.saucelabs.com:80/wd/hub",
  :desired_capabilities => caps)
{% endhighlight %}

You have to replace `username` and `api-key` with your username and API key. If you do not have saucelabs.com account, you can get one for free. Free account has limitation of 200 minutes of driving a browser per month, but that is more than enough to try.

You can run the above code by pasting it into [IRB](http://en.wikipedia.org/wiki/Interactive_Ruby_Shell), or paste it into a Ruby file (named `cloud.rb`, for example) and just run the file from command line.

After the browser is opened, you can drive it as usual.

Now go to <https://saucelabs.com/jobs> and there should be a test with status *running* and name *testing this cloud thing*.

![testing this cloud thing](/assets/2012/watir-webdriver-and-sauce-labs-ondemand/running.png "testing this cloud thing")

Click the test name and you will see live video of the browser running *in the cloud*. After the test is finished you will be able to view the video and see the screenshots that (I think) are automatically taken for every page that the browser opens.
