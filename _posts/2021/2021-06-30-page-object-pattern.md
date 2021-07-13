---
tags:  code commons photo
title: Page object pattern
---
<a title="Muséum de Toulouse
, CC BY-SA 4.0 &lt;https://creativecommons.org/licenses/by-sa/4.0&gt;, via Wikimedia Commons" href="https://commons.wikimedia.org/wiki/File:Dynastes_hercules_ecuatorianus_MHNT.jpg"><img width="512" alt="Dynastes hercules ecuatorianus MHNT" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Dynastes_hercules_ecuatorianus_MHNT.jpg/512px-Dynastes_hercules_ecuatorianus_MHNT.jpg"></a>

*Simplicity versus readability and maintainability.*

There are two main purposes of the page object pattern.

* Move parts of the application that change a lot (user interface) to a central location. When the user interface changes, the test suite only needs to be updated in one place.
* Make tests easier to read and understand by moving complexity to page objects.

Let's describe the two purposes with code samples from MediaWiki Core (as of June 2021).

# With page object pattern

The code is split into two files. `user.js` contains the test. `createaccount.page.js `contains the page object. Code is available at [702327](https://gerrit.wikimedia.org/r/c/mediawiki/core/+/702327).

Please notice how readable `user.js` is. You can immediately see that the point of `User should be able to create account` is to create an user account with `username` and `password` as arguments.

[tests/selenium/specs/user.js](https://gerrit.wikimedia.org/g/mediawiki/core/%2B/refs/heads/master/tests/selenium/specs/user.js)

{% highlight js %}
'use strict';

const assert = require( 'assert' );
const CreateAccountPage = require( '../pageobjects/createaccount.page' );
const Util = require( 'wdio-mediawiki/Util' );

describe( 'User', function () {
	it( 'should be able to create account', function () {
		const username = Util.getTestString( 'User-' );
		const password = Util.getTestString();

		CreateAccountPage.createAccount( username, password );

		assert.strictEqual( CreateAccountPage.heading.getText(), `Welcome, ${username}!` );
	} );
} );
{% endhighlight %}

Please notice that `createaccount.page.js` has two major sections. In the first section are elements on the page (`username()`...). The second section contains actions (`createAccount()`...).

[tests/selenium/pageobjects/createaccount.page.js](https://gerrit.wikimedia.org/g/mediawiki/core/%2B/refs/heads/master/tests/selenium/pageobjects/createaccount.page.js)

{% highlight js %}
'use strict';

const Page = require( 'wdio-mediawiki/Page' );

class CreateAccountPage extends Page {
	get username() { return $( '#wpName2' ); }
	get password() { return $( '#wpPassword2' ); }
	get confirmPassword() { return $( '#wpRetype' ); }
	get create() { return $( '#wpCreateaccount' ); }
	get heading() { return $( '#firstHeading' ); }

	open() {
		super.openTitle( 'Special:CreateAccount' );
	}

	createAccount( username, password ) {
		this.open();
		this.username.setValue( username );
		this.password.setValue( password );
		this.confirmPassword.setValue( password );
		this.create.click();
	}
}

module.exports = new CreateAccountPage();
{% endhighlight %}

# Without page object pattern

Let's compare that to a solution without page object pattern. Code is available at [702341](https://gerrit.wikimedia.org/r/c/mediawiki/core/+/702341).

[tests/selenium/specs/user.js](https://gerrit.wikimedia.org/g/mediawiki/core/%2B/refs/heads/master/tests/selenium/specs/user.js)

{% highlight js %}
'use strict';

const assert = require( 'assert' );
const Util = require( 'wdio-mediawiki/Util' );

describe( 'User', function () {
	it( 'should be able to create account', function () {
		const username = Util.getTestString( 'User-' );
		const password = Util.getTestString();

		browser.url( '/wiki/Special:CreateAccount' );
		$( '#wpName2' ).setValue( username );
		$( '#wpPassword2' ).setValue( password );
		$( '#wpRetype' ).setValue( password );
		$( '#wpCreateaccount' ).click();

		assert.strictEqual( $( '#firstHeading' ).getText(), `Welcome, ${username}!` );
	} );
} );
{% endhighlight %}

# Conclusion

With page object pattern, the framework is more complex, there are more files (two instead of one) and there is more overall code, but the tests are more readable and more maintainable.

Without page object pattern, the framework is simpler, there are less files (one instead of two) and there is less overall code, but the tests are less readable and less maintainable.

To keep this blog post short, I've selected a simple example. If the test suite creates accounts a lot, without page object pattern, code for creating account would have to be copy/pasted, leading to duplication and harder maintenance.

With the page object pattern, creating an account is just a call to `CreateAccountPage.createAccount()` function. If any of the elements for creating the account changes, only `CreateAccountPage` needs to be updated. If the logic of creating and account changes (for example, not requiring password re-entry) only `CreateAccountPage.createAccount()` needs to be updated.

# More information

* [PageObject](https://martinfowler.com/bliki/PageObject.html) by Martin Fowler (2013)
* [PageObjects](https://github.com/SeleniumHQ/selenium/wiki/PageObjects) by Simon Stewart (Selenium, [2015](https://github.com/SeleniumHQ/selenium/wiki/PageObjects/_history))
* [Page object models](https://www.selenium.dev/documentation/en/guidelines_and_recommendations/page_object_models/) by Diego Molina (Selenium, [2019](https://github.com/SeleniumHQ/seleniumhq.github.io/commits/dev/docs_source_files/content/guidelines_and_recommendations/page_object_models.en.md))
* [Page Object Pattern](https://webdriver.io/docs/pageobjects/) by Christian Bromann (WebdriverIO, [2021](https://github.com/webdriverio/webdriverio/commits/main/website/docs/PageObjects.md))
* [Selenium/Explanation/Stack](https://www.mediawiki.org/wiki/Selenium/Explanation/Stack)
* [Selenium/Reference/Stack](https://www.mediawiki.org/wiki/Selenium/Reference/Stack)