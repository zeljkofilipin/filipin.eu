---
tags:  code event organizer speaker video wikimedia youtube
title: Increase the Backlog!
---
In [October last year](/wikimedia-foundation/) I have started working at [Wikimedia Foundation](http://wikimediafoundation.org/). Never heard about it? Let me throw some marketing talk at you. This is the foundation's *vision statement*:

> Imagine a world in which every single human being can freely share in the sum of all knowledge. That's our commitment.

Sounds pretty cool? But then, a lot of *vision statements* sound cool.

Let me tell you more about the foundation. It stands behind [Wikimedia](http://www.wikimedia.org/),

> a global movement whose mission is to bring free educational content to the world.

Still does not ring a bell? Long story short, the bigest project of both the foundation and the movement is [Wikipedia](http://www.wikipedia.org/). I am sure you recognise that one.

What is my day job? Most of the time I write browser test automation for [MediaWiki](http://www.mediawiki.org/), software that runs Wikipedia. I am really happy to work with some great people, one of them could be familiar to you: [Chris McMahon](http://chrismcmahonsblog.blogspot.com/).

Why am I writing all this?

As Wikipedia content is developed by volunteers, so is MediaWiki. A lot of people are helping us develop MediaWiki, but the number of people that help us test it is smaller by far. We need help.

Every week we have an event as part of [Weekly goals](http://www.mediawiki.org/wiki/QA/Weekly_goals) project. This week is [Increase the backlog](https://www.mediawiki.org/wiki/QA/Browser_testing/Increase_the_backlog) week. What is the event about? The entire week Chris, [Quim Gil](https://wikimediafoundation.org/wiki/User:QGil) and me are focused on helping volunteers in writing [Cucumber](http://cukes.info/) scenarios. If you are not familiar with Cucumber, this is how a [scenario](https://github.com/wikimedia/qa-browsertests/blob/master/features/search.feature#L1-L7) looks like:

{% highlight gherkin %}
Feature: Search
  Scenario: Search suggestions
    Given I am at random page
    When I search for: main
    Then a list of suggested pages should appear
      And Main Page should be the first result
{% endhighlight %}

If you are not familiar with given/when/then format, [Given when then](https://github.com/cucumber/cucumber/wiki/Given-When-Then) page at Cucumber wiki has a short but good explanation of the concept.

The goal of the event is to increase number of scenarios at [Test backlog](https://www.mediawiki.org/wiki/QA/Browser_testing/Test_backlog) page. Scenarios from that page will soon be automated.

Yesterday we had and interactive part of the event. We started at 17h UTC with a short [10 minute presentation by Chris](http://youtu.be/dQTHggO--AQ).

<iframe width="560" height="315" src="http://www.youtube.com/embed/dQTHggO--AQ" frameborder="0" allowfullscreen></iframe>

The [slides](/assets/pdf/automated-tests-in-plain-english.pdf) are also available.

The rest of the event happened at \#wikimedia-dev IRC channel at freenode.net and [Browser-automation](http://etherpad.wmflabs.org/pad/p/Browser-automation) [Etherpad](http://etherpad.org/) pad.

![Increase the Backlog!](/assets/increase_the_backlog.png) How the event looked like for the majority of the time.

Chris and I helped volunteers write their first scenario and reviewed the scenarios when they were finished, with suggestions on how they could be improved. Once everybody was happy with a scenario it was moved to [Test\_backlog](http://www.mediawiki.org/wiki/QA/Browser_testing/Test_backlog) page.

Six people actively participated in the event by writing scenarios:

- Valerie (`valeriej`) wrote a couple of scenarios about searching for deleted pages.
- Chris (`chrismcmahon`) paired with `rachel99` and wrote three scenarios about searching for pages that start with accented characters.
- Quim (`qgil`) paired with Sucheta (`sucheta`) and wrote a couple of scenarios about searching in namespaces and order of search results.
- I (`zeljkof`) was mostly answering questions and reviewing scenarios.

A few people joined the channel, asked questions but did not write any scenarios. At least one person did not understand what we are doing. I guess we should make it more clear in the future what the event is about.

Does this sound interesting? The event is not finished, you can still participate for the rest of the week, or any time in the future.

How to participate?

- Ping chrismcmahon or zeljkof at \#wikimedia-dev IRC channel at freenode.net.
- Start a thread at Increase the backlog [talk page](https://www.mediawiki.org/wiki/Talk:QA/Browser_testing/Increase_the_backlog).
- Send e-mail to [wikitech-l](https://lists.wikimedia.org/mailman/listinfo/wikitech-l) mailing list. (Make sure to mention *browser automation* in the subject.)
- Ping [@chris\_mcmahon](https://twitter.com/chris_mcmahon) or [@zeljkofilipin](https://twitter.com/zeljkofilipin) at Twitter
- Leave a comment at this blog post.
- There is a few more ways how to contact me at [Contact](/contact/) page.

By the way, [Weekly goals](http://www.mediawiki.org/wiki/QA/Weekly_goals) project continues: we wil have events like this every 2-4 weeks.
