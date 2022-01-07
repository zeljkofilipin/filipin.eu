---
tags:  code photo selenium wikimedia
title: 'Debug WebdriverIO Tests: logLevel'
---
![Debug WebdriverIO Tests: logLevel](/assets/debug-webdriverio-tests-loglevel.png "Debug WebdriverIO Tests: logLevel")

# Introduction

I wrote a blog post for my team blog at work. You can see the original post at [Debug Selenium Tests: logLevel](https://phabricator.wikimedia.org/phame/post/view/238/debug_selenium_tests_loglevel/).

# Environments

This tip works if you're targeting:

- a local MediaWiki
  - [MediaWiki-Docker](https://www.mediawiki.org/wiki/Selenium/Getting_Started/Run_tests_targeting_MediaWiki-Docker)
  - [MediaWiki-Docker-Dev](https://www.mediawiki.org/wiki/Selenium/How-to/Run_tests_targeting_MediaWiki-Docker-Dev)
  - [MediaWiki-Vagrant](https://www.mediawiki.org/wiki/Selenium/How-to/Run_tests_targeting_MediaWiki-Vagrant)
  - [Quibble](https://www.mediawiki.org/wiki/Selenium/How-to/Run_tests_targeting_Quibble)
- a remote wiki
  - [Beta cluster](https://www.mediawiki.org/wiki/Selenium/Getting_Started/Run_tests_targeting_Beta_cluster)
- continuous integration
  - [Quibble](https://www.mediawiki.org/wiki/Selenium/How-to/Run_tests_using_Quibble_Jenkins_job)
  - [selenium-daily](https://www.mediawiki.org/wiki/Selenium/How-to/Run_tests_using_selenium-daily_Jenkins_job)

# logLevel

Change `logLevel` in `tests/selenium/wdio.conf.js` from the default `error` to `info`.

{% highlight text %}
tests/selenium/wdio.conf.js
{% endhighlight %}

{% highlight js %}
exports.config = {
 // Level of logging verbosity: trace | debug | info | warn | error | silent
 logLevel: 'info'
};
{% endhighlight %}

# Run Selenium tests

{% highlight text %}
npm run selenium-test
{% endhighlight %}

Output will contain a lot of useful debugging information.

{% highlight text %}
[0-5] 2021-04-01T15:03:41.952Z INFO devtools: COMMAND deleteAllCookies()
[0-5] 2021-04-01T15:03:41.965Z INFO devtools: RESULT null

[0-5] 2021-04-01T15:03:42.841Z INFO devtools: COMMAND navigateTo("http://localhost:8080/w/index.php?title=Special%3AUserLogin")
[0-5] 2021-04-01T15:03:43.554Z INFO devtools: RESULT null

[0-5] 2021-04-01T15:03:43.566Z INFO devtools: COMMAND findElement("css selector", "#wpName1")
[0-5] 2021-04-01T15:03:43.571Z INFO devtools: RESULT { 'element-6066-11e4-a52e-4f735466cecf': 'ELEMENT-6' }

[0-5] 2021-04-01T15:03:43.577Z INFO devtools: COMMAND elementClear("ELEMENT-6")
[0-5] 2021-04-01T15:03:43.584Z INFO devtools: RESULT null

[0-5] 2021-04-01T15:03:43.612Z INFO devtools: COMMAND elementSendKeys("ELEMENT-6", "User-0.7731870706237638-Iñtërnâtiônàlizætiøn")
[0-5] 2021-04-01T15:03:43.730Z INFO devtools: RESULT null

...

[0-5] 2021-04-01T15:03:45.928Z INFO devtools: COMMAND takeScreenshot()
[0-5] 2021-04-01T15:03:46.224Z INFO devtools: RESULT iVBORw0KGgoAAAANSUhEUgAABLAAAAOECAYAAACxbcj6AAABKWlDQ1BTa2lhA...
[0-5]
        Screenshot location: /Users/z/Documents/gerrit/mediawiki/core/tests/selenium/log/User-should-be-able-to-log-in-%40daily.png
{% endhighlight %}

# More information

- MediaWiki documentation on running [Selenium](https://www.mediawiki.org/wiki/Selenium) tests.
- WebdriverIO [loglevel](https://webdriver.io/docs/options/#loglevel) documentation.
- The code from this post is available as Gerrit patch [676397](https://gerrit.wikimedia.org/r/c/mediawiki/core/+/676397/).