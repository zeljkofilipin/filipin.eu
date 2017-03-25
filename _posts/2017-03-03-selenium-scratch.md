---
tags:  code featured javascript ruby selenium
title: Selenium bindings in Scratch, visual programming language for kids
published: false
---
![Scratch logo](/assets/Scratchcat2.png "Scratch logo")

I have recently started reading a book about coding for kids, [How to Code: A Step-By-Step Guide to Computer Coding](https://www.goodreads.com/book/show/29563597-how-to-code) by Max Wainewright. It covers the basics of several languages, including Scratch. I was immediately impressed by the language. I have spent an afternoon developing simple games in it with my 9 year old son. We had a lot of fun, but he lost interest. I did not. It was so much fun that I have created a short video on [how to create a game in 5 minutes](/scratch). Scratch was so easy to use. It was so much fun, too.

I have been doing test automation for over 10 years. Most of them using Selenium from Ruby. Recently, I have started using Selenium from JavaScript. It is not simple to write code, it takes a few months or years to learn a language like Ruby or JavaScript. It also takes months or years to learn how to tool like Selenium.

There are people that would like to write tests using Selenium, but they don't have months, or years. The only option so far was to use a recorder. It would record your actions and create a script that would repeat those actions. A lot is written about recorders. I am not a big fan, so I will not spend a lot of time on them.

It came to my mind that a middle ground exists. Is there a way to make writing Selenium tests easier? Is there a way to make writing Selenium tests more fun?

How does a simple Selenium test look like? Code examples are from the official documentation.

[Ruby Bindings](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings)

```ruby
require "selenium-webdriver"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit
```

[JavaScript Bindings](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs)

```javascript
const {Builder, By, until} = require('selenium-webdriver');

let driver = new Builder()
    .forBrowser('firefox')
    .build();

driver.get('http://www.google.com/ncr');
driver.findElement(By.name('q')).sendKeys('webdriver');
driver.findElement(By.name('btnG')).click();
driver.wait(until.titleIs('webdriver - Google Search'), 1000);
driver.quit();
```

The Ruby example opens Firefox, opens Google, inputs text into search box, submits the form, outputs the page title and finally closes the browser. The JavaScript example opens Firefox, opens Google, inputs text into search box, clicks the search button, waits until the title matches expected string and finally closes the browser.

My goal was to create something similar in Scratch. I ended up implementing something similar to JavaScript example.

![Scratch Selenium](/assets/scratch-selenium.png "Scratch Selenium")
