---
tags:  code event featured javascript organizer selenium software-testing speaker testival
title: Selenium + JavaScript = 😕🤔😳
---
I gave a talk based on this post at [Testival Meetup #27](/testival-27), [JavaScript Zagreb Meetup #33](/javascript-zagreb-meetup-33) and Infinum JS Talks #8 (post coming soon). It's about Selenium packages 📦 in JavaScript.

## Packages

As with all things JavaScript, there are plenty of choices. After some research, I have picked three packages:

- [WebDriverJs](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs), the official Selenium bindings, also called [selenium-webdriver](https://www.npmjs.com/package/selenium-webdriver),
- [WebdriverIO](http://webdriver.io/) (named WebdriverJS until 2014),
- [Nightwatch.js](http://nightwatchjs.org).

My initial research ended quickly for WebdriverIO and Nightwatch.js because they had a Java dependency. ☕️ Some time later, after both the tools (and their documentation) and my understanding of the JavaScript ecosystem improved, I have figured out that they can be used without Java. 😓

## Numbers

According to [JSDOW](http://www.jsdow.com/chart/selenium-210639/) (The javascript download index), WebDriverJs (selenium-webdriver) is far ahead in the number of downloads, but WebdriverIO is growing faster, if I have read the charts correctly.

![Selenium Downloads](/assets/selenium-downloads.png)
![Selenium Percentage](/assets/selenium-percentage.png)

## Stack

What is needed for a test automation project that will not fail?

| Browser | Chrome, Firefox |
| Browser driver | [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/), [geckodriver](https://github.com/mozilla/geckodriver) |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs, WebdriverIO, Nightwatch.js |
| Nicer API on top of Selenium (optional) | WebdriverIO, Nightwatch.js |
| Assertion library | [Assert](https://nodejs.org/api/assert.html) (ships with Node.js) |
| Testing framework | [Mocha](https://mochajs.org/) |
| [Page object](https://github.com/SeleniumHQ/selenium/wiki/PageObjects) pattern implementation (optional) | WebdriverIO, Nightwatch.js |
| Configuration | [Node-config](https://www.npmjs.com/package/config), WebdriverIO, Nightwatch.js |

## Simple code examples

The initial investigation of the tools consisted of a simple example:

- open a browser
- go to a page
- check that a link is present
- close the browser

The code is hosted at [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

### WebDriverJs

#### Stack

| Browser | Chrome |
| Browser driver | ChromeDriver |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs |
| Nicer API on top of Selenium | N/A |
| Assertion library | Assert |
| Testing framework | Mocha |
| Page object pattern implementation | N/A |
| Configuration | N/A |

#### Code

[`main_page.js`](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs/blob/master/webdriverjs/main_page.js) file from [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

{% highlight javascript %}
'use strict';
const assert = require( 'assert' ),
	{ Builder, By } = require( 'selenium-webdriver' ),
	test = require( 'selenium-webdriver/testing' );

test.describe( 'Main page', function () {
	let driver;

	test.beforeEach( function () {
		driver = new Builder()
		.forBrowser( 'chrome' )
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

### WebdriverIO

#### Stack

| Browser | Chrome |
| Browser driver | ChromeDriver |
| Language | JavaScript/Node.js |
| Selenium bindings | WebdriverIO |
| Nicer API on top of Selenium | WebdriverIO |
| Assertion library | Assert |
| Testing framework | Mocha |
| Page object pattern implementation | N/A |
| Configuration | N/A |

#### Code

[`main_page.js`](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs/blob/master/webdriverio/main_page.js) file from [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

{% highlight javascript %}
var assert = require( 'assert' );

describe( 'Main page', function () {

	it( 'should have "Log in" link', function () {
		browser.url( '/Main_Page' );
		assert( browser.isVisible( 'li#pt-login a' ) );
	} );

} );
{% endhighlight %}

### Nightwatch.js

#### Stack

| Browser | Chrome |
| Browser driver | ChromeDriver |
| Language | JavaScript/Node.js |
| Selenium bindings | Nightwatch.js |
| Nicer API on top of Selenium | Nightwatch.js |
| Assertion library | Nightwatch.js |
| Testing framework | Nightwatch.js |
| Page object pattern implementation | N/A |
| Configuration | N/A |

#### Code

[`main_page.js`](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs/blob/master/nightwatch/main_page.js) file from [mediawiki-selenium-nodejs](https://github.com/zeljkofilipin/mediawiki-selenium-nodejs) repository.

{% highlight javascript %}
module.exports = {
	'Main page': function ( client ) {
		client
		.url( 'https://en.wikipedia.beta.wmflabs.org/wiki/Main_Page' )
		.assert.elementPresent( 'li#pt-login a' )
		.end();
	}
};
{% endhighlight %}

## Realistic code examples

After the initial investigation with a simple test, all three tools looked fine to me. Tests written in WebDriverJs were the most verbose, but I didn't mind that. The second round included a more realistic set of tests.

- wiki page
  - create
  - edit
  - check history

- user
  - create
  - log in
  - change preferences

The entire code is available in the GitHub repositories. I don't want this blog post to be too long, so I will include only the code for creating a wiki page.

### WebDriverJs

The code is at [mediawiki-webdriverjs](https://github.com/zeljkofilipin/mediawiki-webdriverjs) repository.

#### Stack

| Browser | Chrome |
| Browser driver | ChromeDriver |
| Language | JavaScript/Node.js |
| Selenium bindings | WebDriverJs |
| Nicer API on top of Selenium | N/A |
| Assertion library | Assert |
| Testing framework | Mocha |
| Page object pattern implementation | N/A |
| Configuration | Node-config |

#### Code

`default.js`

{% highlight javascript %}
module.exports = {
	baseUrl: 'http://127.0.0.1:8080/w/index.php?title=',
	browser: 'chrome',
	logPath: 'log/',
	mochaTestOptions: {
		reporter: 'spec',
		slow: 10000,
		timeout: 20000 },
	password: 'vagrant',
	username: 'Admin'
};
{% endhighlight %}

`helper.js`

{% highlight javascript %}
var config = require( 'config' ),
	webdriver = require( 'selenium-webdriver' );

function browser() {
	return new webdriver.Builder()
	.forBrowser( config.get( 'browser' ) )
	.build();
}

function screenshot( driver, state, title ) {
	if ( state === 'failed' ) {
		driver.takeScreenshot().then( ( image ) => {
			let fileName = config.get( 'logPath' ) + title + '.png';
			require( 'fs' ).writeFile( fileName, image, 'base64', ( err ) => {
				if ( err ) { throw err; }
			} );
		} );
	}
}

module.exports = { browser, screenshot };
{% endhighlight %}

`page.js`

{% highlight javascript %}
var assert = require( 'assert' ),
	config = require( 'config' ),
	baseUrl = config.get( 'baseUrl' ),
	webdriver = require( 'selenium-webdriver' ),
	By = webdriver.By,
	test = require( 'selenium-webdriver/testing' );

test.describe( 'Page', function () {

	let content,
		driver,
		helper = require( './helper' ),
		name;

	test.beforeEach( function () {
		content = Math.random().toString();
		driver = helper.browser();
		name = Math.random().toString();
	} );

	test.afterEach( function () {
		helper.screenshot( driver, this.currentTest.state, this.currentTest.fullTitle() );
		driver.quit();
	} );

	test.it( 'should be creatable', function () {

		// create
		driver.get( baseUrl + name + '&action=edit' );
		driver.findElement( By.css( '#wpTextbox1' ) ).sendKeys( content );
		driver.findElement( By.css( '#wpSave' ) ).click();

		// check name
		driver.findElement( By.css( '#firstHeading' ) ).getText().then( function ( text ) {
			assert.equal( text, name );
		} );

		// check content
		driver.findElement( By.css( '#mw-content-text' ) ).getText().then( function ( text ) {
			assert.equal( text, content );
		} );

	} );

} );
{% endhighlight %}

### WebdriverIO

The code is at [mediawiki-webdriverio](https://github.com/zeljkofilipin/mediawiki-webdriverio) repository.

#### Stack

| Browser | Chrome |
| Browser driver | ChromeDriver |
| Language | JavaScript/Node.js |
| Selenium bindings | WebdriverIO |
| Nicer API on top of Selenium | WebdriverIO |
| Assertion library | Assert |
| Testing framework | Mocha |
| Page object pattern implementation | WebdriverIO |
| Configuration | WebdriverIO |


#### Code

`wdio.conf.vagrant.js`

{% highlight javascript %}
exports.config = {

	username: 'Admin',
	password: 'vagrant',

	specs: [
		'./tests/selenium/**/*.js'
	],

	maxInstances: 1,

	capabilities: [ {
		maxInstances: 1,
		browserName: 'chrome'
	} ],

	screenshotPath: './log/',
	baseUrl: 'http://127.0.0.1:8080/w',

	framework: 'mocha',
	reporters: [ 'spec' ],
	mochaOpts: {
		ui: 'bdd',
		timeout: 20000
	}
};
{% endhighlight %}

`page.js`

{% highlight javascript %}
var assert = require( 'assert' ),
	randomPage = require( './pages/randomPage' );

describe( 'Page', function () {

	var content,
		name;

	beforeEach( function () {
		content = Math.random().toString();
		name = Math.random().toString();
	} );

	it( 'should be creatable', function () {

		// create
		randomPage.edit( name, content );

		// check
		assert.equal( randomPage.heading.getText(), name );
		assert.equal( randomPage.displayedContent.getText(), content );

	} );

} );
{% endhighlight %}

`pages/page.js`

{% highlight javascript %}
function Page() {
}

Page.prototype.open = function ( path ) {
	browser.url( '/index.php?title=' + path );
};

module.exports = new Page();
{% endhighlight %}

`pages/randomPage.js`

{% highlight javascript %}
var Page = require( './page' ),
	randomPage = Object.create( Page, {

		content: { get: function () { return browser.element( '#wpTextbox1' ); } },
		displayedContent: { get: function () { return browser.element( '#mw-content-text' ); } },
		heading: { get: function () { return browser.element( '#firstHeading' ); } },
		save: { get: function () { return browser.element( '#wpSave' ); } },

		open: { value: function( name ) {
			Page.open.call( this, name + '&action=edit' );
		} },

		edit: { value: function( name, content ) {
			this.open( name );
			this.content.setValue( content );
			this.save.click();
		} }

	} );
module.exports = randomPage;
{% endhighlight %}

## Conclusion

I have spent some time with both WebDriverJs and WebdriverIO. I have liked WebDriverJs for it's simplicity. I have liked WebdriverIO for it's API and features. I have decided that spending time on investigating Nightwatch.js would not be a good investment.
