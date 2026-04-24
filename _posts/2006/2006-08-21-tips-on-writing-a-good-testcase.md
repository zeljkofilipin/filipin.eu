---
tags:  testing
title: Tips on Writing a Good TestCase
---
From [wiki.mozilla.org](http://wiki.mozilla.org/Calendar:QA_TestCase_Writing_Day#Tips_on_Writing_a_Good_TestCase)

> - Pretend you're writing a bug - it's pretty much the same
> - Assume that the person following your test case only has basic familiarity with the product. For example:
>   - *"Bring up the New Calendar Wizard"* - This is too vague.
>   - *"Launch the New Calendar Dialog (by either double clicking calendar list, File-&gt;New Calendar or right clicking calendar list)."* - This is much better.
> - Be fairly specific with the expected results
>   - *"It worked"* - Once again, too vague.
>   - *"The event was created on the proper day; The event had the proper color"* - This is great.
> - Keep list of steps and expected results as simple as possible.
> - You don't need to detail every click unless it's an important part of the testcase.
>   - *Click on the name text box; enter a name. Click on Color drop down, pick red.*-- This is a little much
>   - *Give the calendar a name, assign it a color.* --This is much better.

[Christopher McMahon](http://chrismcmahonsblog.blogspot.com/) mentioned this at [agile-testing@yahoogroups.com](http://groups.yahoo.com/group/agile-testing/).
