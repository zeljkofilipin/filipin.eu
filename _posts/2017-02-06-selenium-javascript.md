---
tags:  code event featured javascript organizer selenium software-testing speaker testival
title: Selenium + JavaScript = 😕🤔😳
published: false
---
Tomorrow I will give a talk at [Testival Meetup #27](https://www.meetup.com/testival/events/236635146/) about Selenium packages 📦 in JavaScript.

# Packages

As with all things JavaScript, there are plenty of choices. After some research, I have picked three packages:

- [WebDriverJs](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs), the official Selenium bindings
- [WebdriverIO](http://webdriver.io/) (named WebdriverJS until 2014),
- [Nightwatch.js](http://nightwatchjs.org).

My initial research ended quickly for WebdriverIO and Nightwatch.js because they had a Java dependency. ☕️ Some time later, after both the tools (and their documentation) and my understanding of the JavaScript ecosystem improved, I have figured out that they can be used without Java. 😓

# Teh Codez

Examples will:

- open a browser
- go to a page
- check that a link is present
- close the browser

Before I go much further, if you would like to see some trivial example code, please take a look at [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

For not so trivial code examples, take a look at repositories:

- [selenium-mediawiki-mocha](https://github.com/zeljkofilipin/selenium-mediawiki-mocha) for WebDriverJs
- [mediawiki-webdriverio](https://github.com/zeljkofilipin/mediawiki-webdriverio) for WebdriverIO
- [mediawiki-nightwatch](https://github.com/zeljkofilipin/mediawiki-nightwatch) for Nightwatch.js

# Stack

What is needed for a test automation project that will not fail?

| Browser | Chrome, Firefox |
| Browser driver | [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/), [geckodriver](https://github.com/mozilla/geckodriver) |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs, WebdriverIO, Nightwatch.js |
| Nicer API on top of Selenium (optional) | WebdriverIO, Nightwatch.js |
| Assertion library | [Assert](https://nodejs.org/api/assert.html) (ships with Node.js) |
| Testing framework | [Mocha](https://mochajs.org/) |
| [Page object](https://github.com/SeleniumHQ/selenium/wiki/PageObjects) pattern implementation | WebdriverIO, Nightwatch.js |

# WebDriverJs

| Browser | Chrome, Firefox |
| Browser driver | [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/), [geckodriver](https://github.com/mozilla/geckodriver) |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs |
| Nicer API on top of Selenium (optional) | N/A |
| Assertion library | [Assert](https://nodejs.org/api/assert.html) (ships with Node.js) |
| Testing framework | [Mocha](https://mochajs.org/) |
| Page object pattern implementation (optional) | N/A |

[main_page.js](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs/blob/master/test/main_page.js) file from [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

{% highlight javascript %}
var assert = require( 'assert' ),
	webdriver = require( 'selenium-webdriver' ),
	By = webdriver.By,
	test = require( 'selenium-webdriver/testing' );

test.describe( 'Main page', function () {
	var driver;

	test.beforeEach( function () {
		driver = new webdriver.Builder()
		.forBrowser( 'firefox' )
		.build();
	} );

	test.afterEach( function () {
		driver.quit();
	} );

	test.it( 'should have "Log in" link', function () {
		driver.get( 'https://en.wikipedia.beta.wmflabs.org/wiki/Main_Page' );
		driver.findElement( By.linkText( 'Log in' ) ).isDisplayed().then( function ( displayed ) {
			assert( displayed );
		} );
	} );
} );
{% endhighlight %}

# WebdriverIO

| Browser | Chrome, Firefox |
| Browser driver | [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/), [geckodriver](https://github.com/mozilla/geckodriver) |
| Language | JavaScript/Node.js |
| Selenium bindings | WebdriverIO |
| Nicer API on top of Selenium (optional) | WebdriverIO |
| Assertion library | [Assert](https://nodejs.org/api/assert.html) (ships with Node.js) |
| Testing framework | [Mocha](https://mochajs.org/) |
| Page object pattern implementation (optional) | WebdriverIO |

# Nightwatch.js

| Browser | Chrome, Firefox |
| Browser driver | [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/), [geckodriver](https://github.com/mozilla/geckodriver) |
| Language | JavaScript/Node.js |
| Selenium bindings | Nightwatch.js |
| Nicer API on top of Selenium (optional) | Nightwatch.js |
| Assertion library | Nightwatch.js |
| Testing framework | Nightwatch.js |
| Page object pattern implementation (optional) | Nightwatch.js |
