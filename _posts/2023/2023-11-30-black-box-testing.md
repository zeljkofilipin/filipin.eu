---
tags:  book photo
title: Black Box Testing by Boris Beizer
---
# Introduction

Black Box Testing by Boris Beizer is one of the early books on software testing. It was published in 1995, so it's almost 30 years old.

Beizer is a well known author. He has published several books on software and software testing. His most famous books are Software Testing Techniques and Software System Testing and Quality Assurance. There's a reason this book is not one of the most famous ones. (Bret Pettichord in [Four Schools of Software Testing](schools-of-software-testing) by Petticord puts Beizer in Analytical School.)

It's more than 300 pages of almost pure boredom. The book tries to make software testing as complicated as possible by insisting on using graphs. It has almost no practical application.

The book is not at all relevant to the way software is developed today. I doubt that it was ever relevant. That said, I am frequently wrong. I could be wrong about this book. But I'm pretty sure I'm not.

# Writing Style and Clarity

If I was about to write the worst book about software testing possible, and I did everything opposite from what I thought makes sense, I would probably end up with a similar book.

## Synopsis and Summary

The book has both a synopsis at the beginning of the chapter and a summary at the end, for most chapters. I like that in a nonfiction book.

## Vocabulary

Every chapter has a vocabulary section.

It starts with a list of words with no explanations. If you read on a Kindle, you can quickly look up a word in a built-in dictionary, Wikipedia or translate it to another language. I'm not sure what people did when the book was published. They had a dictionary and an encyclopedia nearby?

The vocabulary ends with terms with explanations. Explanations are as relevant as the rest of the book.

I was mostly scanning the vocabulary section, trying to use as little of my brain as possible. But then, that's how I read the book in general.

## Self-evaluation quiz

Every chapter has a self-evaluation quiz at the end. I do like that in a book. In this book, it is done in such a horrible way, it's almost funny. Let me give you an example from the quiz from chapter one.

> Define: analysis, behavioral testing, black-box testing, blind, bug, bug-free, case (...) unit testing, validation, validation criteria, white-box testing. (Introduction, page 55.)

I hope you get the picture. The quiz is just an alphabetical list of terms that you're supposed to look up in the chapter and try to define. I would probably take you several times more time to do that than it took to read the chapter. In general, I don't think that's bad. I like challenging tasks. But, since reading this book is already only wasting your time, don't waste even more time on looking up definitions.

To be fair, some chapters do have tasks in the quiz that are more than just defining the term. But, those tasks are also a waste of your time, so you should not do them.

# Comparison to Other Books in the Field

There's no reason for you to read this book. There are plenty of good books on software testing available.

My team's [book club](tags/book-club) has covered a few good books:

- [Perfect Software](perfect-software-2021) by Gerald M. Weinberg
- [Lessons Learned in Software Testing](lessons-learned-in-software-testing-2022) by Cem Kaner, James Bach and Bret Pettichord
- [Explore It](explore-it) by Elisabeth Hendrickson
- [Exploratory Software Testing](exploratory-software-testing) by James A. Whittaker
- [Testing Computer Software](testing-computer-software) by Cem Kaner, Jack Falk and Hung Q. Nguyen

Read any of those books. Don't read this one.

# Critiques and Limitations

I'm not even sure where to start.
Chapter 2 (Graphs and Relations)
I agree that being able to create good graphs is important in software development and testing. But, I don't see the point of so much theory and so little examples. Pretty much every statement in the book should have an example. There are a few examples, but an order of magnitude (if not two) too little.
Chapter 8 (Syntax Testing)
This chapter seems almost practical. Unlike the rest of the book. I could see myself testing a command line application. However, the way the material is presented makes it completely unusable.

While reading the chapter, I can almost understand the author. That's not something I can say for the rest of the book. But, I kept thinking how I would rewrite the chapter to make it more practical and understandable.

# Conclusion

In case I was not explicit enough so far, I really didn't like the book.

This is a type of book that you read once, quickly, just to get an idea of what the book is about. Then, you read it the second time, very carefully, trying to actually understand the material. You might need to read some chapters, if not the whole book, the third time, to fully understand it. (Similar to [An Introduction to General Systems Thinking](an-introduction-to-general-systems-thinking) by Gerald M. Weinberg.)

This is also a type of book that you read once and never want to read again.

The only reason you might have to read this book is if you have trouble sleeping. I have found that reading this book is a very good way to get sleepy.

I categorize nonfiction books into practical and non-practical. This book is marketing itself as a practical book. I find that as far from the truth as possible.

If I was new to testing and this was my first testing book, I would run away from testing screaming.

I can see how maybe in some context this book could be useful, but I've never needed anything like it in the last 20 years and it's unlikely I'll need it in the next 20.

I am not sure who could get anything useful from this book. I am surely not its target audience. There are not a lot of [Goodreads](https://www.goodreads.com/book/show/880515.Black_Box_Testing) reviews, but a few [Amazon](https://www.amazon.com/Black-Box-Testing-Techniques-Functional-Software-ebook/product-reviews/B003VIWZ7E) reviews that exist agree with me. Read the reviews. You be the judge.

# Kindle

I have read this book mostly on a Kindle. I prefer to read books there. I am disappointed in the Kindle version. I'm not sure what went wrong with it. Probably somebody just wanted to earn some money on it without putting a lot of effort into the conversion. A few graphs were missing. Some images were at a slight angle. Just enough to make it annoying.

Most of the Kindle version worked just fine, but the graphs were almost unreadable. I had to have the book open in a Kindle application on my computer, just to be able to read the graphs.

# Quotes

I like collecting quotes from books. This book had good quotes mostly only in the first and the last chapter. Maybe I was paying attention only in those chapters. In the first chapter because I didn't yet get that this will be a horrible book, and in the last chapter I was excited that the suffering will be over soon. In the rest of the book I was probably in some low brainpower survival-only mode.

## Preface

> But if you want to learn behavioral test techniques with a minimum of hassle and prerequisites, then I hope this book won’t disappoint you (page 10.)

Do I even need to say (again) that this book did indeed disappoint me?

## Chapter 1, Introduction

> As in war and business, there are effective and ineffectual strategies (page 41).
>
> Bugs are caused by complexity and the limited ability of humans to handle complexity (page 43).
>
> Testing is potentially endless, both theoretically and pragmatically. Yet we must stop testing, knowing that bugs remain, because if we don’t stop, the effort is pointless (page 43).
>
> Behavioral testing isn’t all the testing we should do. No single testing approach is enough (page 45).
>
> “The wise navigator never relies solely on one technique” (page 45).
>
> We’d all like a Mercedes for the price of a Yugo (page 45).

This was funny. When I was a kid, my family owned a Yugo. I think it was the first car I drove.

> The most important things about a software development process are (1) there is a process, (2) it is understood, (3) it is followed (page 49).
>
> Even chaos is a process of sorts (page 49).
>
> If the process isn’t followed, it’s probably because it doesn’t work (page 50).

## Chapter 2, Graphs and Relations

> Question: What do you do when you see a graph? Answer: Cover it! (page 79).

I am not sure if this is a joke. To be fair, my jokes are usually worse than this one. If this was a joke.

## Chapter 3, Control-Flow Testing

> Revealing bugs, not making people falsely confident, is what testing’s about (page 129).

## Chapter 4, Loop Testing

> Horrible loops come about when jumping out of the middle of a loop or jumping into the middle of the loop (page 150).

I need to investigate if this is possible to do in the programming languages I know.

## Chapter 7, Domain testing

> About 30 percent of all bugs concern errors in requirements. (...) Approximately 5 percent of all bugs are caused by wrong domain definitions (page 275).

## Chapter 8, Syntax testing

> The biggest potential problem with syntax testing is psychological and mythological. (...) The mythological aspect is that there is great (undeserved) faith in the effectiveness of what I call keyboard-scrabbling or Rachmaninoff testing, also called monkey testing (page 338.)

## Chapter 10, Tools and automation

> One of the saddest sights to me has always been a human at a keyboard doing something by hand that could be automated. It’s sad but hilarious (page 388).
>
> Manual testing doesn’t work. It never did work very well, it doesn’t work now, and it won’t work in the future. Manual testing is ill-contrived self-deception. It confuses sweat with accomplishment. And worst of all, it leads to false confidence (page 388).
>
> What can be inferred, then, about software’s dependability from the kind of tests that can be executed manually? Nothing! Absolutely nothing! Nothing, nothing, nothing (page 390).
>
> The purpose of structural coverage tools is to give us an objective and quantitative measure of how much of the software we actually have executed by testing. It should be, must be, 100 percent (page 349).
>
> In most systems and software development environments, it is possible to automate test execution for 95 percent or more of all tests. One hundred percent execution automation probably is not desirable (page 397).
>
> Everybody underestimated the time it would take to learn the tools and the underlying techniques and to achieve facility with it to the point that the tool and method were more productive than the old manual way (page 402).
>
> As testers we must strive to put ourselves out of business by promoting bug prevention methods and early bug discovery methods such as thorough analysis, prototypes, analytical models, formal methods (where effective), and inspections (page 403).
>
> I don’t see testing actually disappearing because the remaining bugs (after process improvement) are always subtler and nastier. So I expect testing to get more technical, subtler, and more effective as time goes on (page 403).
>
> Here are my hopes for testing.
>
> 1. That testing becomes a standard part of the software developer’s undergraduate education. Not just as a one-time, optional course but a mandatory part of the programmer’s education offered at at least three different levels in an undergraduate course of study: Introductory Testing (Black-Box Testing), Intermediate Testing (Integration and System Testing), Advanced Testing (Testing Theory and Algorithms).
> 2. That it keeps pace with our ever-evolving software development process and apparently ever-increasing software complexity.
> 3. That the test tools industry disappears in its present form and takes its rightful place as an essential component of the broader software development tools industry.
> 4. That for most of us, testing ceases to be a profession but an inseparable aspect of what every conscientious developer routinely does. (page 406)

# Reviewers

I've asked ChatGPT 3.5 for advice on how to write this post. To my big surprise, it was a very pleasant experience. It recommended sections for the post and what to cover in each of them. If you like this post, thank ChatGPT. If you don't like it, blame me.
