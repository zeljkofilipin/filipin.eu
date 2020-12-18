---
tags:  code ruby
title: watir-webdriver tests at TestingBot
---
<p><img src="/assets/throne-300x300.jpg" alt="Random photo: Varaždin, Croatia." title="Random photo: Varaždin, Croatia."  /></p>
<p><em>To make it explicit: I am not affiliated with <a href="http://testingbot.com/">TestingBot</a> or <a href="http://saucelabs.com/">Sauce Labs</a>.</em></p>
<p>A few days ago I wrote about <a href="/watir-webdriver-and-sauce-labs-ondemand/">how to run watir-webdriver tests at Sauce Labs OnDemand</a>. I have also noticed that <a href="watir-webdriver-tests-are-pretty-slow-at-sauce-labs-ondemand/">watir-webdriver tests are pretty slow at Sauce Labs OnDemand</a>.</p>
<p>Jari Bakken <a href="https://twitter.com/jarib/status/206495033979961344">suggested to use net-http-persistent</a> gem to speed things up. Jochen Delabie suggested I should try TestingBot. So, I have decided to try both.</p>
<p>TestingBot is pretty much the same service as <a href="http://saucelabs.com/ondemand">Sauce Labs OnDemand</a>. There is also 200 minutes of free trial, and the prices are a bit lower than Sauce Labs OnDemand. If you have used Sauce Labs OnDemand, TestingBot will look familiar. If you have not used Sauce Labs OnDemand, read the last couple of articles I have wrote here.</p>
<p>So, what you need to do to run your tests at TestingBot?</p>
<p>If you already run tests at Sauce Labs OnDemand:</p>

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

<p>you only have to change <code>caps.version</code> and <code>:url</code>. Depending on the platform and browser, check if you have to change other settings too. (Supported operating systems: <a href="https://saucelabs.com/docs/ondemand/browsers/env/ruby/se2/mac">Sauce Labs OnDemand</a>, <a href="http://testingbot.com/support/getting-started/browsers.html">TestingBot</a>.)</p>

{% highlight ruby %}
require "watir-webdriver"
caps = Selenium::WebDriver::Remote::Capabilities.firefox
caps.version = 11
caps.platform = :LINUX
caps[:name] = "testing this cloud thing"
browser = Watir::Browser.new(
  :remote,
  :url => "http://key:secret@hub.testingbot.com:80/wd/hub",
  :desired_capabilities => caps)
{% endhighlight %}

<p>Of course, replace <code>key</code> and <code>secret</code> with your credentials.</p>
<p>I have run pretty much the same script as in the previous post. The script opens the browser, goes to 9 sites and closes the browser. Actually, it does that with and without using net-http-persistent gem, on a local browser, at Sauce Labs OnDemand and at TestingBot.</p>

watir-webdriver tests at TestingBot : local, sauce labs, testingbot

|location  |os          |browser   |net- http- persistent|1  |2  |3  |4  |5  |6  |7  |8  |9  |10 |average|median|deviation|min|max|average net-http-persistent improvement (%)|slower than local (times)|
|----------|------------|----------|---------------------|---|---|---|---|---|---|---|---|---|---|-------|------|---------|---|---|-------------------------------------------|-------------------------|
|local     |mac 10.7    |firefox 12|FALSE                |20 |18 |20 |22 |18 |15 |16 |17 |17 |16 |18     |18    |2        |15 |22 |                                           |                         |
|local     |mac 10.7    |firefox 12|TRUE                 |14 |16 |16 |16 |21 |15 |18 |16 |15 |15 |16     |16    |1        |14 |21 |9                                          |                         |
|sauce     |windows 7   |firefox 11|FALSE                |75 |59 |56 |57 |65 |56 |96 |62 |64 |   |66     |62    |9        |56 |96 |                                           |3.7                      |
|sauce     |windows 7   |firefox 11|TRUE                 |63 |50 |50 |   |84 |60 |54 |50 |82 |51 |60     |54    |11       |50 |84 |8                                          |3.7                      |
|testingbot|Windows 2008|firefox 11|FALSE                |31 |35 |31 |33 |30 |33 |31 |32 |31 |33 |32     |32    |1        |30 |35 |                                           |1.8                      |
|testingbot|Windows 2008|firefox 11|TRUE                 |30 |33 |31 |31 |30 |30 |30 |31 |31 |31 |31     |31    |1        |30 |33 |4                                          |1.9                      |

<p><em>(I could not figure out how to make the last two columns display rounded numbers.)</em></p>
<p>What do the numbers say?</p>
<p>net-http-persistent gem this time helped to reduce test run time up to 10%, but other tests showed up to 15% shorter times.</p>
<p>TestingBot is still about 2 times slower than running a local browser, but Sauce Labs OnDemand is about 4 times slower. So, running tests at TestingBot is about 2 times faster than at Sauce Labs OnDemand.</p>
