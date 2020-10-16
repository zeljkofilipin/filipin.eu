---
tags:  testing wikimedia
title: Software Testing Anti-patterns
---
My team at work has a reading club. We've recently read [Software Testing Anti-patterns](http://blog.codepipes.com/testing/software-testing-antipatterns.html) blog post. I've liked the article but maybe even more the discussion we had about it.

But that's just the beginning of the story. I've noticed that I was referring to the article frequently in conversations at work, conferences or meetups. It nicely sums up many of my thoughts. I've caught myself in several occasions saying something like:

> That's anti-pattern #7!

# A surprise

One of the things that keeps surprising me is how people that have a lot of experience with software development frequently have almost no experience with software testing.

# Terminology

I would like to discuss terminology really quickly. The problem is, if you ask three people about the difference between unit, integration and system tests, you'll probably get four responses. Sometimes even five.

So, let's define just a few basic terms, before we start the discussion.

> [Software testing](https://en.wikipedia.org/wiki/Software_testing) is an investigation conducted to provide stakeholders with information about the quality of the software product or service under test.

Software testing is investigation.

> In software engineering, a [software design pattern](https://en.wikipedia.org/wiki/Software_design_pattern) is a general, reusable solution to a commonly occurring problem within a given context in software design.

That's pretty clear.

> An [anti-pattern](https://en.wikipedia.org/wiki/Anti-pattern) is a common response to a recurring problem that is usually ineffective and risks being highly counterproductive.

Anti-pattern is a solution that creates more problems than it solves.

This is not a definition, but I would still like to mention it. Testing pyramid. (It's really a triangle, but let's skip that discussion for now.) I really like the image from the top of [TestPyramid](https://martinfowler.com/bliki/TestPyramid.html) article at Martin Fowler's blog.

# Events

I talked about software testing anti-patterns at [Zagreb Tech Sauna meetup](/zagreb-tech-sauna). I went over all thirteen anti-patterns from the blog post. With the introduction and some discussion, the talk ended up being over an hour long. A bit too long.

I gave a half hour talk at [Testival #56](/testival-56) meetup, covering five anti patterns. I've heard commentns that it was a bit too short.

I've started writing this blog post while preparing for Testival meetup, and I'm finishing it while preparing for upcoming [Quality and Test Engineering Office Hour](https://lists.wikimedia.org/pipermail/wikitech-l/2020-February/093084.html).

# Anti-patterns

For each anti-pattern I'll list some advantages and disadvantages. It would be great to hear from the readers if they've seen them in the wild.

# Chords

Am6
A#6
Bm9
C7sus4
C#aug
Dsus4
D#9
Edim
Fsus2
F#m9
G6
G#aug