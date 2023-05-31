---
tags:  book photo
title: The Web App Testing Guidebook by Kevin Lamping
---
# Three sentence summary

I would highly recommend reading this book if you need to learn more about testing, test automation, Selenium, WebdriverIO and JavaScript. The book is self published, so it is not as well edited, especially later in the book. The book is also a work in progress containing a lot of code, so expect some minor problems with the code here and there.

# I Have Some Experience

I have some experience, both with test automation and with writing a book about it.

I have been testing software since [2004](ja-ne-radim-nista-samo-testiram) (reference in Croatian). Very early in my testing career I have started with test automation, at latest in [2005](jednostavnost) (reference in Croatian). Back then my preferred tools were Ruby (programming language) and Watir (test automation library).

In [2009](https://github.com/watir/watirbook/commit/50cfb81580b8408d6bcc9309e295c482f06b7785) I started working on a test automation book focused on Ruby and Watir. I have self published it at [Leanpub](https://leanpub.com/watirbook). In [2014](https://github.com/watir/watirbook/commits/master), after 800+ commits, I gave up on the book. Writing a book is a lot of work and I just didn't have the time.

In [2012](wikimedia-foundation) I started working on test automation for MediaWiki. It used Ruby and Selenium. After a decade of Ruby, I have started with JavaScript in [2015](javascript-selenium). In [2016](https://phabricator.wikimedia.org/T139740) MediaWiki started moving its Selenium tests from Ruby to JavaScript. In [2017](https://gerrit.wikimedia.org/r/c/mediawiki/core/+/328191) the first commit of JavaScript+WebdriverIO code was merged in MediaWiki. The same year, I wrote a [blog post](selenium-javascript) about the experience.

# The Good Parts

Although I have a few years of experience with WebdriverIO, I have learned a few interesting features of the tool while reading the book.

The book caused a couple of ideas on how to simplify and improve MediaWiki's test code:

- Delete WebdriverIO package from devDependencies for all repositories ([T325059](https://phabricator.wikimedia.org/T325059)),
- Replace Node.js Assert library with WebdriverIO Expect library ([T325740](https://phabricator.wikimedia.org/T325740)).

The first idea simplified `package.json` in many repositories by deleting `webdriverio` npm package as an explicit dependency. The second idea will improve and simplify the code by using a better assertion library (Expect from WebdriverIO) than the one we use at the moment (Assert from Node.js).

One of the great ideas in the book is to use a [real world](https://github.com/gothinkster/realworld) application. It's a demo web application that has almost all features of a real world application a typical reader would test. In general, I prefer to run tests targeting a local testing environment, as opposed to a shared testing environment. One can control the local environment, and it is usually faster. It does need some setting up, but I find that a cheap price to pay. The shared environment doesn't need any setup, it's already there, but you don't control it. It can be slow, not work properly, go away with no warning, and other people testing at the same time can break your tests. The app was working great for me locally for a while, but then one day it just refused to work. I never took the time to debug what went wrong. It was easier to just use a [shared testing environment](https://demo.learnwebdriverio.com/) provided by the author.

# Room for Improvement

When I started reading the book, it was using WebdriverIO sync API and WebdriverIO v7. The current default API is async and the current version is v8. While I was reading the book, it got updated from sync to async API, but I don't think the editor took a good look at the new version. There is some broken code in the book, especially in the last few chapters.

It's not a big deal that the book uses WebdriverIO v7. As far as I remember, there was just one piece of code that didn't work on v8 in chapter 2.6.2 (Key Commands). I solved the problem by downgrading to v7.

I know it's not easy to keep a technical book containing a lot of code up to date. I don't see an alternative to having all code from the book under [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration). WebdriverIO project has an interesting way of [solving the problem of code in documentation](https://webdriver.io/blog/2023/02/28/interactive-and-tested-documentation/).

Up until chapter 2.9.2 there were just a few minor mistakes in the code that I was able to fix myself. From this chapter until the end of the book (well, only three chapters, 2.9.2 - 2.9.4) code is falling apart.

For example, Axios dependency is introduced into code, without mentioning that it should be installed. That is pretty obvious, but still confusing. Axios is first mentioned on page 185, but the book says we're going to use the Got library. I guess the author later changed his mind, but forgot to say.

I was setting up a new machine and installed the most recent version of [Node.js](https://nodejs.org/en) (v20) on the machine. None of the code I wrote while reading the book worked at all. Downgrading to v16 fixed the problem.

The book is self published at Leanpub. The landing page lists an editor, but I'm not sure how involved he is in the publishing process.

# WebdriverIO, Playwright, Puppeteer, Cypress

The author nicely says that using [WebdriverIO](https://webdriver.io/) in the book is an implementation detail. It's a good tool, but the book would not need to change a lot if the author decided to rewrite it using a similar tool, like Microsoft's [Playwright](https://playwright.dev/), Google's [Puppeteer](https://pptr.dev/) or [Cypress](https://www.cypress.io/) (by the company of the same name). It would be interesting if somebody wrote a book that had code examples in each of the popular tools.

For comparison, here is [cypress vs playwright vs puppeteer vs webdriverio](https://npmtrends.com/cypress-vs-playwright-vs-puppeteer-vs-webdriverio) package download counts from npm trends for the last 5 years (2018-2023). Puppeteer and Cypress are very popular, WebdriverIO and Playwright not so much.

![cypress vs playwright vs puppeteer vs webdriverio](assets/the-web-app-testing-guidebook.png "cypress vs playwright vs puppeteer vs webdriverio")

# Conclusion

All that said, the world needs more good books on test automation. I like the book, but I would like to get in touch with the author and see if he's still working on it. I would be hesitant to read it again, or recommend it to others until some problems with the book are solved.

# Links

- [The Web App Testing Guidebook](https://github.com/klamping/ui-testing-book) source code (markdown) at GitHub.
- [The Web App Testing Guidebook](https://leanpub.com/webapp-testing-guidebook/) at Leanpub.
- [The Web App Testing Guidebook](https://www.goodreads.com/book/show/56676684-the-web-app-testing-guidebook) at Goodreads.
- [Online video course](https://learn.webdriver.io/).
- [Code examples from the book](https://github.com/klamping/wdio-book-examples) at GitHub. Unfortunately, the code is using WebdriverIO v6 (the current version is v8) and sync API (the current default is async API).
- [Code I wrote](https://github.com/zeljkofilipin/wdio-realworld) while reading the book.

# Reviewers

I usually share drafts of my blog posts with a few people. I usually receive some feedback. This time [Karlo Šmid](https://blog.tentamen.eu/) and [Tyler Cipriani](https://tylercipriani.com/) gave me so much good feedback, I didn't have the time to implement it all. 😅 I will continue implementing their feedback and making this post better as I have the time.
