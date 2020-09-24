---
tags:  mentor wikimedia
title: Google Summer of Code, June-August 2020
---

# The internship



# Things that went well

June and July were pretty busy. Both interns were doing a great job, creating task in our task tracking application Phabricator and pushing commits to our code review application Gerrit. They were also writing blog posts every few weeks. They even wrote blog post for my team's blog. Vidhi wrote [GSoCpedia: The journey so far](https://phabricator.wikimedia.org/phame/post/view/201/gsocpedia_the_journey_so_far/) and Soham wrote [Fanboying Cypress](https://phabricator.wikimedia.org/phame/post/view/202/fanboying_cypress/).

Both of them created a lot of commits. We've merged 40 Vidhi's commits, but only 2 Soham's.

Vidhi created about 60 commits. Her project was to update 30 repositories from WebdriverIO v4 first to v5 and finally to v6. In the majority of cases, there were no major problems with the update, so most of her commits are already merged.

Soham created almost 100 commits. His project was an evaluation of a couple of tools. We decided not to adopt the tools, so we didn't merge the commits.

Interns did a great job. Vidhi has updated many repositories to [WebdriverIO](https://webdriver.io/) v6. We are currently at 70 or 80% of all repositories at v6. (Depending if you count repositories or relevant lines of code.) Soham evaluated two WebdriverIO alternatives, [Puppeteer](https://developers.google.com/web/tools/puppeteer/) (from Google) and [Cypress](https://www.cypress.io/). He also took a quick look at [Playwright](https://playwright.dev/) (from Microsoft) but we decided not to evaluate it during his internship. I'll probably mention Playwright in another post soon.

I've also managed to recruit a couple of mentors, [Pita](https://www.mediawiki.org/wiki/User:JPita_(WMF)) and [John](https://www.mediawiki.org/wiki/User:JBolorinos_(WMF)).

We had daily video meetings. That helped to resolve a lot of problems quickly.

We used Phabricator Workboards to organize work ([Vidhi](https://phabricator.wikimedia.org/tag/user-vidhi-mody/), [Soham](https://phabricator.wikimedia.org/tag/user-soham/)). They created a lot of small commits that were easy to review. Small commits are also easy to revert, if a problem is found later. Both students had to revert at least one commit ([Vidhi](https://gerrit.wikimedia.org/r/c/mediawiki/extensions/MobileFrontend/+/615682), [Soham](https://gerrit.wikimedia.org/r/c/mediawiki/core/+/595932).

Both interns were invited to my team's weekly meeting and IRC channel. They were also invited to our informal Telegram group and weekly watercooler video meeting. The group and the meeting are used for non-work related chat. I hope that helped them see how a team works, and also to spend some social time with us. They have also participated in our virtual team offsite, workshops on test driven development, refactoring and bug reporting.

# Things that didn't go well

Both interns had hardware trouble. In normal times, buying a new laptop would not be a problem, but during the pandemic it was pretty hard. Both of them managed to resolve the hardware problems in various ways.

The biggest problem for Vidhi was that there's is no official local development environment. To fix that problem, she even created the majority of the documentation on how use [MediaWiki-Docker](https://www.mediawiki.org/wiki/MediaWiki-Docker) for various extensions ([T256239](https://phabricator.wikimedia.org/T256239)). MediaWiki-Docker is the closest thing we have to the official local development environment.

The biggest problem for Soham was that our continuous integration is hard to debug because it's hard to replicate it locally. To help with debugging he worked on recording videos of all test runs. We had a framework that works only on Linux. He found an NPM package that works on all platforms, [wdio-video-reporter](https://www.npmjs.com/package/wdio-video-reporter). When we discovered it supports only WebdriverIO v5 he contributed a [patch](https://github.com/presidenten/wdio-video-reporter/pull/44) to the package to make it work with v6.

I made a mistake of mentoring two interns. I never had enough time to resolve problems for both of them. If I was mentoring only one, I would have more time to focus on their project.

Both mentors were pretty new both to Wikimedia and to our Selenium/WebdriverIO framework, so they couldn't help much.

# Advice for the interns

Both interns had good coding and communication skills. Vidhi's advantage was communication, Soham's coding. That's not saying the other skill was not good, but that it was obvious that each of them was obviously better in one skill.

I suggested that they take a break from coding, a week or two. Instead of coding, they should be thinking about the internship and writing about it. Another idea I had for them was to try mentoring. You'll probably hear more about that soon.

During the internship they have learned how to create small commits with good commit messages. They have also learned how to create a good bug report. Bug reporting is a skill that they have significantly improved, but they still need to work on it.

A piece of advice for all interns: good communication skills are as important as good coding skills, if not slightly more important.

# Advice for myself

I've decided to take a break from mentoring. (I might not take that advice. More about that soon.) Instead, like I've advised the interns, I would spend some time thinking about the internship and writing about it. This blog post is the result.

A piece of advice for all mentors: Prepare to spend more time on mentoring than you've originally planned. I've spent about 10 hours a week per intern.