---
tags:  code featured javascript ruby selenium
title: Selenium bindings in Scratch, visual programming language for kids
---
![Scratch logo](/assets/Scratchcat2.png "Scratch logo")

# Scratch

I have recently started reading a book about coding for kids, [How to Code: A Step-By-Step Guide to Computer Coding](https://www.goodreads.com/book/show/29563597-how-to-code) by Max Wainewright. It covers the basics of several languages, including Scratch. I was immediately impressed by the language. I have spent an afternoon developing [simple games](https://github.com/zeljkofilipin/scratch-games) in it with my 9 year old son. We had a lot of fun, but he lost interest soon. I did not. It was so much fun that I have created a short video on [how to create a game in 5 minutes](/scratch). Take a quick look at the article. It is so _easy_ to create with Scratch. It it also so much _fun_.

# Test automation

I have been doing test automation for over 10 years. Most of them using Selenium from Ruby. Recently, I have started using Selenium from JavaScript. It is not simple to write code, it takes a few months or years to learn a language like Ruby or JavaScript. It also takes months or years to learn how to use a tool like Selenium.

There are people that would like to write tests using Selenium, but they don't have months, or years. The only option, so far, was to use a recorder. It would record your actions and create a script that would repeat those actions. A lot is written about recorders. I am not a big fan, so I will not spend much time on them.

It came to my mind that a middle ground exists. But, I did not want to make writing Selenium tests just _easy_. I wanted it to be _fun_, too.

# Selenium

So, how does a simple Selenium test look like? The following code examples are from the official documentation. I have added inline comments.

[Ruby Bindings](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings)

```ruby
require "selenium-webdriver" # require Selenium bindings

driver = Selenium::WebDriver.for :firefox # open Firefox
driver.navigate.to "http://google.com" # open Google

element = driver.find_element(name: 'q') # find element with name q
element.send_keys "Hello WebDriver!" # send text to the element
element.submit # submit the element

puts driver.title # output page title

driver.quit # close Firefox
```

[JavaScript Bindings](https://github.com/SeleniumHQ/selenium/wiki/WebDriverJs)

```javascript
const {Builder, By, until} = require('selenium-webdriver'); // require Selenium bindings

let driver = new Builder()
    .forBrowser('firefox')
    .build(); // open Firefox

driver.get('http://www.google.com/ncr'); // open Google
driver.findElement(By.name('q')).sendKeys('webdriver'); // send text to element with name q
driver.findElement(By.name('btnG')).click(); // click element with name btnG
driver.wait(until.titleIs('webdriver - Google Search'), 1000); // wait until page title matches the string
driver.quit(); // close Firefox
```

The basics are:
- opening and closing a browser,
- finding an element and interacting with it (clicking, entering text...),
- checking the results (page title...).

# Selenium + Scratch = ❤️

After a bit of thinking about the problem and some research, I had the basics working. I have showed it to a few people and they said it was _easy_ to use, but also a lot of _fun_. Here it is. (Yellow boxes are comments.)

[![Selenium Scratch](/assets/selenium-scratch.png "Selenium Scratch")](https://scratch.mit.edu/projects/148651313/)

Only the basics, but it's running. You can run the script at Scratch web site ([Selenium Scratch](https://scratch.mit.edu/projects/148651313/)) and inspect the code. (You will need Flash. Sorry about that.) The above script is optimized so it is easy to read, but it runs so fast that you do not see much. I have created another script ([Selenium Scratch Demo](https://scratch.mit.edu/projects/148654788/)) that is not so easy to read, but it runs slower, and the helpful Scratch cat is providing useful comments on what is happening. Here is a YouTube video, if you prefer that.

<div style="position:relative;height:0;padding-bottom:75.0%"><iframe src="https://www.youtube.com/embed/pNJSSDt5RPI?ecver=2" width="480" height="360" frameborder="0" style="position:absolute;width:100%;height:100%;left:0" allowfullscreen></iframe></div>

While working on the script, I have noticed that a debugger would be helpful. So, I have created one. Take a look at [Selenium Scratch Debug](https://scratch.mit.edu/projects/148695263/) project, or just play the YouTube video:

<div style="position:relative;height:0;padding-bottom:75.0%"><iframe src="https://www.youtube.com/embed/i-g6fwYlFW4?ecver=2" width="480" height="360" frameborder="0" style="position:absolute;width:100%;height:100%;left:0" allowfullscreen></iframe></div>

In addition to the projects on Scratch web site and YouTube videos, [selenium-scratch](https://github.com/zeljkofilipin/selenium-scratch) is also on GitHub.
