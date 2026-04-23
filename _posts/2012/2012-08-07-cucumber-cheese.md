---
tags:  book
title: Cucumber & Cheese by Jeff Morgan
---
[<img src="/assets/chzy.png" title="Cucumber &amp; Cheese, A Testers Workshop by Jeff Morgan" class="size-full wp-image-376" width="270" height="349" alt="Cucumber &amp; Cheese, A Testers Workshop by Jeff Morgan" />](https://leanpub.com/cucumber_and_cheese) Cucumber & Cheese, A Testers Workshop by Jeff Morgan

I have a long story to tell about [Cucumber & Cheese](https://leanpub.com/cucumber_and_cheese) but, as both your and mine time is limited, I will try to make is short. The story begins way back in 2010 when [Charley Baker](https://twitter.com/charley_baker) posted [link](https://groups.google.com/forum/#!topic/watir-general/tKC3PV2X3m4/discussion) to [Jeff Morgan's blog](http://www.cheezyworld.com/). I think that was the first time I was introduced to [Page Object pattern](http://code.google.com/p/selenium/wiki/PageObjects). Since then Page Object pattern talks started appearing a lot at (test automation) conferences. I have created my own implementation of the pattern and I have used it on a few projects.

The story continues earlier this year in Austin. I was there for [Test Automation Bazaar](/test-automation-bazaar-2012/) conference. The day before the conference I was at [Page Objects and Cucumber charity workshop](http://watir.com/test-automation-bazaar/charity-workshops/) led by Jeff. I learned a lot about [Cucumber](http://cukes.info/), Page Object pattern and [page-object gem](https://github.com/cheezy/page-object). I liked page-object gem more than my own implementation so I started using it on new projects, and even converted at least one project from my own implementation to page-object.

Jeff said he is working on a book and I was looking forward to reading it. As soon as the first beta version of the book was out I bought it. While I was reading the book it was about half done, 6 out of 12 chapters. A few days ago I have finished reading the first 6 chapters but I did not have the time to write book review immediately, and Jeff managed to publish a new version of the book with one more chapter in the meantime. I have hoped I would be the first one to write the review, but I was not surprised that [Michael Larsen](http://www.mkltesthead.com/2012/08/book-review-cucumber-and-cheese.html) beat me to it. As new chapters are written and as I read them I will update this blog post.

At the beginning of the book, Jeff said the reader should do all the exercises from the book. I could not follow the advice, since I was reading the book on iPad in 5-10 minute blocks while my machine was busy running tests, so I could not work on the code at the same time. I do plan to do the exercises the next time I read the book.

The book starts with thoughs on how software testing and test automation are done at the moment and the usual mistakes. Considerable amount of test automation efforts fail. What should we do? We need to treat test code as seriously as production code. We have to use a lot of tools, for example [Ruby](http://www.ruby-lang.org/en/), Cucumber, [watir-webdriver](http://watirwebdriver.com/), page-object... We should also do a lot of refactoring so the code stays [DRY](http://en.wikipedia.org/wiki/Don't_repeat_yourself).

In short, the book is a good introduction to (object oriented) programming, Ruby, refactoring, Cucumber, Watir, page object pattern and page-object Ruby gem, working with databases... The book is full of example code and exercises that step by step, tool by tool teach you how to do test automation. At the end of the book there are several reference chapters: watir-webdriver, page-object, RSpec matchers and ActiveRecord.

I have just one more tool that I would like to see mentioned in the book: version control. I would of course recommend [Git](http://git-scm.com/), but any version control is better than none.

Since the book is not finished yet, there are mistakes here and there. Feel free to report them at [book errata page](http://http://www.cheezyworld.com/cucumber-cheese-errata/).

I started working on my [Watir Book](http://watir.com/book/) because there were no books on [Watir](http://watir.com/). I am thinking what should I do with my book now. I did not have the time to work on it in the last few months, but I hope it will change in the next few months. (But I hoped the same a few months ago.) I think my book should focus only on Watir, and leave Jeff's book to cover test automation more broadly.
