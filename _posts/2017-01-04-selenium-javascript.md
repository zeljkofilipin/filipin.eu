---
tags:  code event featured javascript organizer selenium software-testing speaker testival
title: Selenium + JavaScript = 😕🤔😳
published: false
---
Next month I will give a talk at [Testival Meetup #27](https://www.meetup.com/testival/events/236635146/) about Selenium packages 📦 in JavaScript.

# Packages

As with all things JavaScript, there are plenty of choices. After some research, I have picked three packages:

- the official Selenium bindings ([WebDriverJs?](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs), [selenium-webdriver?](https://www.npmjs.com/package/selenium-webdriver)),
- [WebdriverIO](http://webdriver.io/) (named WebdriverJS until 2014),
- [Nightwatch.js](http://nightwatchjs.org).

My initial research ended quickly for WebdriverIO and Nightwatch.js because they had a Java dependency. 😱 Some time later, after both the tools (and their documentation) and my understanding of the JavaScript ecosystem improved, I have figured out that they can be used without Java. 😓

# Teh Codez

Before I go much further, if you would like to see some trivial example code, please take a look at [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

For not so trivial code examples, take a look at repositories:

- [selenium-mediawiki-mocha](https://github.com/zeljkofilipin/selenium-mediawiki-mocha) for WebDriverJs/selenium-webdriver
- [mediawiki-webdriverio](https://github.com/zeljkofilipin/mediawiki-webdriverio) for WebdriverIO
- [mediawiki-nightwatch](https://github.com/zeljkofilipin/mediawiki-nightwatch) for Nightwatch.js

# Stack

What is needed for a test automation project that will not fail?

| Browser | Chrome, Firefox |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs/selenium-webdriver, WebdriverIO, Nightwatch.js |
| Nicer API on top of Selenium (optional) | WebdriverIO, Nightwatch.js |
| Assertion library | [Assert](https://nodejs.org/api/assert.html) (ships with Node.js) |
| Testing framework | [Mocha](https://mochajs.org/) |
| [Page object](https://github.com/SeleniumHQ/selenium/wiki/PageObjects) pattern implementation (optional) |

# WebDriverJs/selenium-webdriver

| Browser | Chrome, Firefox |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs/selenium-webdriver |
| Nicer API on top of Selenium (optional) | N/A |
| Assertion library | Assert |
| Testing framework | Mocha |
| Page object pattern implementation (optional) | N/A |

# WebdriverIO

| Browser | Chrome, Firefox |
| Language | JavaScript/Node.js |
| Selenium bindings | WebdriverIO |
| Nicer API on top of Selenium (optional) | WebdriverIO |
| Assertion library | Assert |
| Testing framework | Mocha |
| Page object pattern implementation (optional) | WebdriverIO |

# Nightwatch.jsWebdriverIO

| Browser | Chrome, Firefox |
| Language | JavaScript/Node.js |
| Selenium bindings | Nightwatch.js |
| Nicer API on top of Selenium (optional) | Nightwatch.js |
| Assertion library | Nightwatch.js |
| Testing framework | Nightwatch.js |
| Page object pattern implementation (optional) | Nightwatch.js |
