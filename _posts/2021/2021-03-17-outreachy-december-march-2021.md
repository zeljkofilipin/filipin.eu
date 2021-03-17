---
tags:  featured mentor wikimedia
title: Outreachy, December 2020-March 2021
---
[Outreachy Round](https://www.mediawiki.org/wiki/Outreachy/Round_21) 21 has finished! [Vidhi Mody](https://www.vidhimody.me/), [Soham Parekh](https://www.sohamp.dev/) and I were mentoring [Harriet Ayugi](https://harriet-ayugi.onrender.com/) on project [Evaluation of Microsoft Playwright](https://phabricator.wikimedia.org/T262682).

# Project management

In the previous internship ([Google Summer of Code, June-August 2020](/gsoc-june-august-2020), GSoC) we've used the usual Wikimedia tools. [Phabricator](https://phabricator.wikimedia.org) for tasks, [Gerrit](https://gerrit.wikimedia.org) for code hosting and review and [Jenkins](https://integration.wikimedia.org/ci) for continuos integration (CI). It worked well for [Vidhi's project](https://phabricator.wikimedia.org/T247844) but not so well for [Soham's project](https://phabricator.wikimedia.org/T248738). Since this internship was really similar to Soham's project, we've decided to use [GitHub](https://github.com/hariclerry/mediawiki) for tasks, code hosting and review and [GitHub Actions](https://github.com/features/actions) for CI.

# Project

We have roughly split the project into three parts. The setup, the implementation and the report. We estimated each part to roughly 4 weeks. The internship lasted for 12 weeks.

The initial setup, mostly CI, took about 6 weeks. Luckily, implementing the code took about 2 weeks. The report took about 4 weeks. In the end, we had time for everything.

# CI

CI setup took longer than expected. We've tried [Travis CI](https://travis-ci.com/) first because Harriet was familiar with it, but it wasn't easy to store artifacts, like screenshots. Soham suggested GitHub Actions and it worked great. We've even managed to set up [MediaWiki-Docker](https://www.mediawiki.org/wiki/MediaWiki-Docker) there.

# Local development environment

I've noticed that Harriet could use some improvements to her local development environment, so gave her advice on how to set up [VSCode](https://code.visualstudio.com/), mostly by installing useful extensions.

- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

# Mentors

Outreachy was much easier for me to mentor than GSoC. During GSoC, most of the time I was mentoring 2 interns. It was a lot of fun, but also a lot of work. During Outreachy, there were 3 mentors on 1 intern. Most of the mentoring was done by Vidhi and Soham, so things were much easier this time for me.

I think I did a decent job of letting Vidhi and Soham mentor Harriet, but I've sometimes made a mistake of mentoring her too much. I should have focused more on mentoring Vidhi and Soham and let them mentor Harriet. There's a chance we'll co-mentor again in the future. I'll make sure not to mentor the intern myself at all, so Vidhi and Soham could develop as mentors.

# Communication

We've continued with the usual communication tools. We've used [Google Meet](https://meet.google.com/) for our almost daily video meeting and [Zulip](https://wikimedia.zulipchat.com) for chat.

# Blogging

Harriet wrote a [blog post](https://dev.to/hariclerry) every couple of weeks. She posted a few of those posts at my [team blog](https://phabricator.wikimedia.org/phame/blog/view/21/). I don't think other mentors wrote anything about the internship. (I'll remind them to do so.) For my first article about the internship see [Outreachy, September-November 2020](/outreachy-september-november-2020).

# Report

We've spent a lot of time writing the report. You can see all the [discussion](https://github.com/hariclerry/mediawiki/pull/86) at GitHub. There were 199 comments and 25 commits from February 3 to March 1. The report is available at three places.

- [Evaluation of Microsoft Playwright](https://github.com/hariclerry/mediawiki/blob/master/tests/playwright/Report.md) at GitHub
- [Evaluation of Microsoft Playwright](https://dev.to/hariclerry/evaluation-of-microsoft-playwright-28oi) at DEV
- [Evaluation of Microsoft Playwright](https://phabricator.wikimedia.org/phame/post/view/231/evaluation_of_microsoft_playwright/) at Phabricator
