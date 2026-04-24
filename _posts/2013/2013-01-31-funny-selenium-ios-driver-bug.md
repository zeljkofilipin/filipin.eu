---
tags:  image selenium
title: Funny Selenium iOS driver bug
---
<img src="/assets/2013/funny-selenium-ios-driver-bug.png" class="size-full wp-image-737" width="373" height="721" alt="Funny Selenium iOS driver bug" />Funny Selenium iOS driver bug

The other day I [fixed](https://github.com/wikimedia/mediawiki-extensions-MobileFrontend/commit/930c722a6f645ef30476a35d2ad763e965b1b5bb) a couple of [failing](https://wmf.ci.cloudbees.com/job/MobileFrontend-mac-iphone/87/testReport/) Selenium iOS tests. Looks like there is something wrong in the way Selenium sends [special](http://watirwebdriver.com/sending-special-keys/) [keys](http://code.google.com/p/selenium/source/browse/rb/lib/selenium/webdriver/common/keys.rb) (like `enter` or `shift`) to iOS devices.

I made a script that sent all possible special keys to a textarea, and the [results](https://saucelabs.com/tests/d5da310d6e9f44d7a117664edc5a6dac) were pretty funny. It is a [known bug](http://code.google.com/p/selenium/issues/detail?id=2374).
