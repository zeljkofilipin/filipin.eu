---
tags:  code event featured javascript organizer selenium testing speaker testival
title: Selenium + JavaScript = 😕🤔😳
---
I gave a talk based on this post at [Testival Meetup #27](/testival-27), [JavaScript Zagreb Meetup #33](/javascript-zagreb-meetup-33) and [Infinum JS Talks #8](/infinum-js-talks-8). It's about Selenium packages 📦 in JavaScript.

## Packages

As with all things JavaScript, there are plenty of choices. After some research, I have picked three packages:

- [WebDriverJs](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs), the official Selenium bindings, also called [selenium-webdriver](https://www.npmjs.com/package/selenium-webdriver),
- [WebdriverIO](http://webdriver.io/) (named [WebdriverJS](https://www.npmjs.com/package/webdriverjs) until 2014),
- [Nightwatch.js](http://nightwatchjs.org).

My initial research ended quickly for WebdriverIO and Nightwatch.js because they had Java ☕️ dependency. Some time later, after both the tools (and their documentation) and my understanding of the JavaScript ecosystem improved, I have figured out that they can be used without Java. 😓

## Numbers

According to [JSDOW](http://www.jsdow.com/chart/selenium-210639/) (The JavaScript download index), WebDriverJs is far ahead in the number of downloads, but WebdriverIO is growing faster, if I have read the charts correctly.

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

`webdriverjs/main_page.js`

{% highlight javascript %}
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

`webdriverio/stack/assert.js`

{% highlight javascript %}
const assert = require( 'assert' );
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

`nightwatch/main_page.js`

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

After the initial investigation with a simple test, all three tools looked fine to me. So far, I liked WebdriverIO API. WebDriverJs was a bit verbose for my taste. Nightwatch.js API looked strange to me.

The second round included a more realistic set of tests.

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

`config/default.js`

{% highlight javascript %}
module.exports = {
	baseUrl: 'http://127.0.0.1:8080/w/index.php?title=',
	browser: 'chrome',
	logPath: '.',
	mochaTestOptions: {
		reporter: 'spec',
		slow: 10000,
		timeout: 20000 },
	password: 'vagrant',
	username: 'Admin'
};
{% endhighlight %}

`test/helper.js`

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

`test/page.js`

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

`wdio.conf.js`

{% highlight javascript %}
exports.config = {

	specs: [
		'./specs/**/*.js'
	],

	capabilities: [ {
		browserName: 'chrome',
	} ],

	framework: 'mocha',

	reporters: [ 'spec' ],
};
{% endhighlight %}

`specs/page.js`

{% highlight javascript %}
const assert = require( 'assert' ),
	EditPage = require( '../pageobjects/edit.page' );

describe( 'Page', function () {

	var content,
		name;

	beforeEach( function () {
		content = Math.random().toString();
		name = Math.random().toString();
	} );

	it( 'should be creatable', function () {

		// create
		EditPage.edit( name, content );

		// check
		assert.equal( EditPage.heading.getText(), name );
		assert.equal( EditPage.displayedContent.getText(), content );

	} );

} );
{% endhighlight %}

`pageobjects/page.js`

{% highlight javascript %}
class Page {
	constructor() {
		this.title = 'My Page';
	}
	open( path ) {
		browser.url( '/index.php?title=' + path );
	}
}
module.exports = Page;
{% endhighlight %}

`pageobjects/edit.page.js`

{% highlight javascript %}
'use strict';
const Page = require( './page' );

class EditPage extends Page {

	get content() { return browser.element( '#wpTextbox1' ); }
	get displayedContent() { return browser.element( '#mw-content-text' ); }
	get heading() { return browser.element( '#firstHeading' ); }
	get save() { return browser.element( '#wpSave' ); }

	open( name ) {
		super.open( name + '&action=edit' );
	}

	edit( name, content ) {
		this.open( name );
		this.content.setValue( content );
		this.save.click();
	}

}
module.exports = new EditPage();
{% endhighlight %}

## Conclusion

I have spent some time with both WebDriverJs and WebdriverIO. I have liked WebDriverJs for it's simplicity. I have liked WebdriverIO for it's API and features. I have decided that spending time on investigating Nightwatch.js would not be a good investment.
