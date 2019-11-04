---
tags:  code ruby
title: Catch JavaScript Errors on the Page with Watir or Selenium
---
![Javascript Error](/assets/error.png)

Seven months ago [tempus fugit](http://en.wikipedia.org/wiki/Tempus_fugit") a client asked if I could create a smoke test that would visit all pages of the application and report if there were any JavaScript errors. Since we already had a smoke test that visited all pages and took screenshots, I thought it would be easy to do. All I had to do was to figure out how to catch JavaScript errors with <a href="http://watir.com/">Watir</a>. Turns out <a href="http://code.google.com/p/selenium/issues/detail?id=148">Selenium does not have API for checking for JavaScript errors</a> on the page yet. How are <a href="http://seleniumhq.org/">Selenium</a> and Watir connected? <a href="http://watirwebdriver.com/">Watir WebDriver</a> (part of Watir project) uses <a href="http://seleniumhq.org/projects/webdriver/">WebDriver</a> (part of Selenium project) to drive browsers.

I have found a solution (with some help at <a href="https://groups.google.com/d/topic/firebug/HkC9SBQjMUo/discussion">Google Groups</a> and <a href="http://stackoverflow.com/q/8541305/17469">Stack Overflow</a>), but it was neither simple nor elegant. Then Jari Bakken pointed me to his [Gist](https://gist.github.com/jarib/3728863).

{% highlight ruby %}
require 'selenium-webdriver'
require 'pp'

profile = Selenium::WebDriver::Firefox::Profile.new
profile.add_extension 'JSErrorCollector.xpi' # https://github.com/mguillem/JSErrorCollector/raw/master/dist/JSErrorCollector.xpi

driver = Selenium::WebDriver.for :firefox, :profile => profile

# do stuff

errors = driver.execute_script("return window.JSErrorCollector_errors.pump()")
pp errors
{% endhighlight %}
