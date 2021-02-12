---
tags:  featured mentor wikimedia
title: Google Summer of Code, June-August 2020
---
## Introduction

June and July were pretty busy. I was on vacation the majority of August. Interns and other mentors were busy even then. For more introduction, read my post [Google Summer of Code, February-May 2020](/gsoc-june-august-2020).

## Things that went well

### Code

We use [Gerrit](https://en.wikipedia.org/wiki/Gerrit_(software)) for hosting Git repositories and for code review.

Vidhi's project was updating about 30 repositories to [WebdriverIO](https://webdriver.io/) v6 (from v4 or v5). We are currently at 70 or 80% of all repositories at v6. (Depending on if you count repositories, or relevant lines of code.) She created about [60 commits](https://gerrit.wikimedia.org/r/q/owner:vidhimody6%2540gmail.com). In the majority of cases, there were no significant problems with the update, so most of her contributions are already merged, about [40 commits](https://gerrit.wikimedia.org/r/q/owner:vidhimody6%2540gmail.com+is:merged).

Soham evaluated two WebdriverIO alternatives, [Puppeteer](https://developers.google.com/web/tools/puppeteer/) (from Google) and [Cypress](https://www.cypress.io/). He also took a quick look at [Playwright](https://playwright.dev/) (from Microsoft) but we decided not to evaluate it during the internship. (I'll probably mention Playwright in another post soon.) He created almost [100 commits](https://gerrit.wikimedia.org/r/q/owner:soham.parekh1998%2540gmail.com). In the end, we decided not to adopt the tools, so we didn't merge the vast majority of his commits. Only [2 commits](https://gerrit.wikimedia.org/r/q/owner:soham.parekh1998%2540gmail.com+is:merged) were merged.

They created a lot of small commits that were easy to review. Small commits are also easy to revert, if a problem is found later. Both students had to revert at least one commit. Vidhi had to revert [615682](https://gerrit.wikimedia.org/r/c/mediawiki/extensions/MobileFrontend/+/615682) and Soham [595932](https://gerrit.wikimedia.org/r/c/mediawiki/core/+/595932). I hope that experience made it clear why I was insisting on small commits from the start.

### Mentors

I've managed to recruit a couple of mentors, [Pita](https://www.mediawiki.org/wiki/User:JPita_(WMF)) and [John](https://www.mediawiki.org/wiki/User:JBolorinos_(WMF)). They were a lot of help, especially while I was on vacation in August. Pita's specialty during the internship was Cypress and John's bug reporting.

### Tasks

We use [Phabricator](https://en.wikipedia.org/wiki/Phabricator) for task management.

It's easy to get overwhelmed or distracted, so good task management is important. We used Phabricator Workboards to organize work ([Vidhi](https://phabricator.wikimedia.org/tag/user-vidhi-mody/), [Soham](https://phabricator.wikimedia.org/tag/user-soham/)).

### Blogging

Interns were writing blog posts every few weeks. Check out their blogs ([Vidhi](https://vidhi-mody.netlify.app/blog/), [Soham](https://www.sohamp.dev/blog/)). Each of them even wrote a blog post for my team's blog, [*Wow. So wikimedia. Such quality. Many testing. Very team.*](https://phabricator.wikimedia.org/phame/blog/view/21/) Vidhi wrote [GSoCpedia: The journey so far](https://phabricator.wikimedia.org/phame/post/view/201/gsocpedia_the_journey_so_far/) and Soham wrote [Fanboying Cypress](https://phabricator.wikimedia.org/phame/post/view/202/fanboying_cypress/).

### Communication

We had daily video meetings. When there was a problem to resolve, one of us would share the screen. That helped to resolve a lot of problems quickly.

We've used [Zulip](https://en.wikipedia.org/wiki/Zulip) for text messages. That helped us stay in touch during the day, or on rare days when we didn't have a meeting.

Interns were invited to my team's IRC channel and weekly video meeting. They were also invited to our informal Telegram group and weekly watercooler video meeting. The group and the meeting are used for non-work related chat. I hope that helped them to see how a team works, and also to spend some social time with us.

They have participated in our virtual team offsite, workshops on test driven development, refactoring and bug reporting.

### Documentation

Vidhi created the majority of the documentation on how use [MediaWiki-Docker](https://www.mediawiki.org/wiki/MediaWiki-Docker) for various extensions ([T256239](https://phabricator.wikimedia.org/T256239)). MediaWiki-Docker is the closest thing we have to the official local development environment.

### Upstream

To help with debugging, Soham worked on recording videos of all test runs. We had a framework that works only on Linux. He found an NPM package that works on all platforms, [wdio-video-reporter](https://www.npmjs.com/package/wdio-video-reporter). When we discovered it supports only WebdriverIO v5 he contributed a [patch](https://github.com/presidenten/wdio-video-reporter/pull/44) to the package to make it work with v6.

### Badges

I've created [Intern](https://phabricator.wikimedia.org/badges/view/16/) and [Mentor](https://phabricator.wikimedia.org/badges/view/18/) badges at Phabricator and awarded them to all interns and mentors that I knew about. They don't do anything, but I like badges. 🏅

## Things that didn't go well

### COVID-19

Both interns had hardware trouble. In normal times, buying a new laptop would not be a problem. During the pandemic it was pretty hard. Both of them managed to resolve the hardware problems somehow.

### Local development environment

The biggest problem for Vidhi was that she needed to update about 30 different repositories, but there's is no official local development environment. If there were any problems with the update (for example, something breaks in our continuous integration), it's really hard to debug it, if you can't reproduce the problem locally. To fix the problem, she created the majority of the documentation on how use MediaWiki-Docker for the relevant repositories.

### Continuous integration

The biggest problem for Soham was that our continuous integration is hard to debug, because it's hard to replicate locally. If a piece of code works fine on your machine, but fails in continuous integration, it's almost impossible to debug it.

### Too many interns

I made a mistake of mentoring two interns. I never had enough time to resolve problems for both of them. If I was mentoring only one, I would have more time to focus on their project.

### Mentors with limited experience

Both co-mentors were pretty new both to Wikimedia and to our Selenium/WebdriverIO framework, so most of the time they couldn't help much. I'm not saying mentors didn't do a good job. I think they did a great job. The failure is mine. I should have recruited more mentors with more experience.

## Advice for interns

### Vidhi and Soham

Both interns had good coding and communication skills. Vidhi's advantage was communication, Soham's coding. I'm not saying their other skills were not good, only that it was obvious each of them was clearly better in one skill.

After the internship, I've suggested that they take a break from coding. A week or two. Instead of coding, they should be thinking about the internship and writing about it.

Another piece of advice I had for them was to try mentoring. (You'll probably hear more about that soon.)

I guess one of the most important things they have learned during the internship is how to create small commits with good commit messages. They have also learned how to create a good bug report. Bug reporting is a skill that they have significantly improved in, but they still need to work on it.

### General advice

A piece of advice for all interns: good communication skills are as important as good coding skills, if not slightly more important.

## Advice for mentors

### Myself

I've decided to take a break from mentoring. (I might not take that advice. More about that soon.) It was a lot of fun, but also a lot of work. Instead, like I've advised the interns, I would like to spend some time thinking about the internship and writing about it.

### General advice

A piece of advice for all mentors: prepare to spend more time on mentoring than you've originally planned. I've spent about 10 hours a week per intern.

## Links

- [Google Summer of Code](https://techblog.wikimedia.org/2020/09/15/celebrating-free-and-open-source-software-with-google-summer-of-code-and-outreachy/) at techblog.wikimedia.org