---
tags:  citcon event javascript speaker test-automation-bazaar
title: JavaScript + Selenium
---
For the last week or so I pretty much did nothing but JavaScript. It was something I wanted to do for a long time, and the time has finally come. The goal was to investigate how mature are JavaScript Selenium bindings and tooling around them. First I needed to learn some JavaScript. [Codecademy's JavaScript course](https://www.codecademy.com/learn/javascript) was recommended by a colleague, and it was a nice way to learn the basics. I have also stumbled upon [NodeSchool](http://nodeschool.io/) and finished a few workshops there.

There are still a lot of things I need to learn about the language, but the ecosystem was more confusing, at least in the start. Make sure you know the difference between [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript), [JavaScript](https://en.wikipedia.org/wiki/JavaScript) and [Node.js](https://en.wikipedia.org/wiki/Node.js).

Our continuous integration was giving me a hard time, yelling at me every time I have pushed JavaScript code, so I had to learn what are the similarities and differences between [JSLint](https://en.wikipedia.org/wiki/JSLint), [JSHint](https://en.wikipedia.org/wiki/JSHint) and [JSCS](http://jscs.info/), but also which of them we use and for what.

To be able to run mentioned tools on my machine I had to figure out [npm](https://en.wikipedia.org/wiki/Npm_%28software%29) and [Grunt](http://gruntjs.com/).

The adventure did not end there, since there seems to be several JavaScript Selenium bindings. Fortunately, one of them is a part of Selenium project, so the choice was easy. It was slightly confusing that the official name for the bindings are [WebDriverJs](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs), but npm package name is [selenium-webdriver](https://www.npmjs.com/package/selenium-webdriver), not [webdriverjs](https://www.npmjs.com/package/webdriverjs). Naming is hard.

The fun continued with test frameworks. At the very beginning of the adventure, I have paired with a colegue that is familiar with JavaScript and we have picked [Jasmine](https://en.wikipedia.org/wiki/Jasmine_%28JavaScript_framework%29). While investigating existing JavaScript code, I have found out that we use [QUnit](https://en.wikipedia.org/wiki/QUnit), but I could not figure out how to use it with Selenium. I still need to learn more about the language.

I was able to make everything work with [Mocha](https://en.wikipedia.org/wiki/Mocha_%28JavaScript_framework%29) (event Grunt!). Looks like WebDriverJs/selenium-webdriver has built in support for it.

I am looking forward to learning more about the language and the tools.
