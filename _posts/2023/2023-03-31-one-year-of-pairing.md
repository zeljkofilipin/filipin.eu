---
tags:  wikimedia
title: One Year of Pairing
---
# Introduction

Late in 2021 and early in 2022 my team at work read [Lessons Learned in Software Testing](lessons-learned-in-software-testing-2022) (Kaner, Bach, Pettichord), as part of our [book club](tags/book-club). One lesson from the book got us thinking.

> We suspect that it is at least as efficient to have testers working in pairs as having them work alone. (Chapter 8: Managing the testing project. Lesson 192: Try testing in pairs. Page 176.)

We talked about it and decided to try an experiment. Every member from the team will pair with every other member of the team.

# Pairing

We started [pairing](https://phabricator.wikimedia.org/T300290) in early 2022. Pairing was optional. The point was for team members to get to know each other and to share knowledge. The pair agrees on when to meet. They can meet one or more times in the two weeks they are a pair. The usual pairing session is 30-60 minutes. The pair agrees on what to work for the duration of the session. Pairs are scheduled every two weeks using [Round-robin tournament](https://en.wikipedia.org/wiki/Round-robin_tournament) rules.

As you might imagine, teams change in a year. Accordingly, my team changed. People were joining and leaving the team, making it hard to make sure everybody paired with everybody.

I'm not sure how often other people pair. I pair for about two hours almost every day. Over the years (and decades) I think I learned how to be reasonably good at pairing. I also enjoy it. I think pairing is a great way to solve problems and share knowledge but also socialize.

# Conclusion

I had a lot of fun pairing with members of the team in the last year. But, I'm not sure what other people on the team think. I've asked around if pairing is useful, but I didn't get much feedback. I've talked with my manager and we decided to stop the experiment. It was a fun year, but it's time to take a break and think about it.

I think the main problem is that our team is split into two parts. A bigger part of the team consists of *test engineers* that mostly do exploratory testing. A smaller part of the team consists of *software engineers in test* that mostly do things around test automation. (The division is not set in stone. Also, some people are doing both exploratory testing and test automation.) I'm not sure how useful it is for a test engineer and software engineer in test to pair. To me, it sounds like a good idea, but I'm not sure that it is.

If we decide to start pairing again, I think it would make sense to set up pairing with members of subteams, not across subteams. So test engineers pair with test engineers, software engineers in test pair with software engineers in test.
