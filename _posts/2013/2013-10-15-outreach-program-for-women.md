---
tags:  mentor wikimedia
title: Outreach Program for Women
---
<img src="/assets/opw-cartoon-240x300.png" class="size-medium wp-image-1314" width="240" height="300" alt="OPW cartoon" />

*[Outreach Program for Women cartoon](https://wiki.gnome.org/OutreachProgramForWomen#Cartoon), [CC-BY-SA](http://creativecommons.org/licenses/by-sa/2.0/)*

In the last year we have organized a few [workshops](/tag/workshop/) as one of the ways of find new people that would help us test software that runs Wikipedia. During one of the first workshops (maybe even the first one) a new contributor appeared. At the time all I knew about her was her IRC nick, rachel99. After the workshop she continued to contribute Cucumber scenarios.

Then, Wikimedia Foundation decided to join a few other free software projects in [Outreach Program for Women](https://wiki.gnome.org/OutreachProgramForWomen) (OPW). (My colleague Quim Gil, our OPW coordinator, wrote more about [this round of OPW](https://blog.wikimedia.org/2013/09/30/foss-outreach-program-for-women-success-and-new-round/).) Rachel applied for the internship focused on [browser test automation for VisualEditor](http://www.mediawiki.org/wiki/User:Rachel99/proposal1).

In a lucky coincidence, I was in Boston for [Selenium Conference 2013](/selenium-conference-2013/) a few days before the internship started, so I had a chance to meet Rachel in person.

**Is the project completed?**

Yes.

You can find all the details in the [blog post she wrote about the internship](http://bleededge.blogspot.com/2013/09/wrap-up-of-my-outreach-program-for.html) and her [monthly reports](http://www.mediawiki.org/wiki/User:Rachel99/proposal1#Monthly_Contributions). I will just try to highlight a few things.

Rachel wrote several [tests](https://gerrit.wikimedia.org/r/#/q/status:merged+owner:rachel,n,z) for VisualEditor. At first they were in our "[sandbox](https://github.com/wikimedia/qa-browsertests)" code repository but before the end of the internship, we have moved the test to VisualEditor repository (you can find them in [modules/ve-mw/test/browser](https://github.com/wikimedia/mediawiki-extensions-VisualEditor/tree/master/modules/ve-mw/test/browser) folder).

[Jenkins](https://wmf.ci.cloudbees.com/view/r-ve/) is running tests that she wrote at least twice a day. We plan to run the test more frequently at the future (*before* a commit is merged into master branch), but we are not there yet.

She reported several [bugs](https://bugzilla.wikimedia.org/buglist.cgi?emailreporter1=1&list_id=237491&emailtype1=substring&query_format=advanced&email1=rachelqa99%40gmail.com) in various products that she was using during the internship. She also participated in our [QA mailing list](https://lists.wikimedia.org/mailman/listinfo/qa), both asking and answering questions.

**What have we learned?**

[Remote pair programming](http://en.wikipedia.org/wiki/Pair_programming#Remote_pair_programming) works. We have used Google Hangouts, but I have previously used Skype and iChat and all of them worked just fine. I have paired with Rachel in one hour sessions several times a week, sometimes almost every day. [Chris](http://chrismcmahonsblog.blogspot.com/) (my colleague and Rachel's other mentor) paired with her probably as much as I did, maybe even more.

Every intern should have two mentors. The internship was over the summer when people take vacations, so if a mentor goes to vacation for a few days (or weeks), the intern could get stuck. Also, sometimes a mentor could be really busy or traveling. Having two mentors makes that situation less likely.
