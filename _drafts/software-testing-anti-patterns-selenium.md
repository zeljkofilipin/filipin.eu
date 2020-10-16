---
tags:  testing wikimedia
title: Software Testing Anti-patterns - Selenium
---
- Raise your hand if you have not written a Node/Selenium test?
- Today we'll cover a couple of examples of tests are written, how they work, what makes a good/bad one. Best practices and gotchas.
- Session will be in two parts. Some slides, and then looking at some real code to discuss as example.
- Story - I was on a plane, reviewed all Selenium code ever written for MW. I was looking for good and bad examples, and found three such examples, plus a strange one!

- slide #1 replace "family" with "tests".

- page object slide - I've yet to see an exception that is justified.
- Disadvantage of page object is that there's yet another layer of abstraction - but it makes the test code simpler.  Test code can read like user actions.  Complexity is hidden away in page objects. The thing that changes the most is the UI.
- Anybody not like page objects?

Looking at real code (Zeljko projecting):
Z: A few repos moved from Ruby and cucumber to Node and mocha - they're just out of scope for today

Good example (MediaWiki core, page.js)
Z: beautiful new way to use the API. Before hook runs each test suite. use Util.getTestString.

Bad example (TemplateWizard)
Z: scored all the antipattern points! L28-L98 "basic use of templatewizard". It uses node selectors, 1 huge file, all details inside the test instead of using page objects. Positively, it waits for elements to be present.

Strange example (MobileFrontend)
Z: Tried to reuse existing cucumber test suite. It worked for some definition of "worked", but the resulting test code is strange. Slightly too complicated. Assertions should be exclusively at the end. Not horrible, but strange.

- recommended reading for all participants
- http://blog.codepipes.com/testing/software-testing-antipatterns.html
- https://watirmelon.blog/testing-pyramids/