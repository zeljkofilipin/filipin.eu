---
tags:  book wikimedia
title: Continuous Delivery
---
I have bought the book via informit. I have read it mostly on Kindle, but sometimes on Kindle Android app. Quotes and page numbers are from pdf version.

# Preface

pxxiii “How long would it take your organization to deploy a change that involves just one single line of code? Do you do this on a repeatable, reliable basis?”

# Acknowledgments

pxxxi Jeffrey Fredrick and Paul Julius for creating CITCON

# About the Authors

pxxxiii ZX Spectrum

# Part I Foundations

# Chapter 1 The Problem of Delivering Software

p4 Some Common Release Antipatterns
p5 Antipattern: Deploying Software Manually

p11 How Do We Achieve Our Goal?
p12 deliver high-quality, valuable software in an efficient, fast, and reliable manner

p14 The Feedback Must Be Received as Soon as Possible
p14 However, implementing a deployment pipeline is resource-intensive, especially once you have a comprehensive automated test suite.

p22 The Release Candidate
p23 At the time of writing, the Wikipedia entry describing development stages shows “release candidate” as a distinct step in the process (Figure 1.2). We see things a little differently.

p24 Principles of Software Delivery
p24 Create a Repeatable, Reliable Process for Releasing Software
p24 Releasing software should be easy.

# Chapter 2 Configuration Management

p38 Managing Dependencies
p38 Managing External Libraries
p38 There is some debate as to whether or not to version-control libraries.

p49 Managing Your Environments
p50 It should always be cheaper to create a new environment than to repair an old one.

# Chapter 3 Continuous Integration

p56 Implementing Continuous Integration
p56 What You Need Before You Start
p57 3. Agreement of the Team
p57 You need everyone to check in small incremental changes frequently to mainline and agree that the highest priority task on the project is to fix any change that breaks the application. If people don’t adopt the discipline necessary for it to work, your attempts at continuous integration will not lead to the improvement in quality that you hope for.

p66 Essential Practices
p66 Always Run All Commit Tests Locally before Committing, or Get Your CI Server to Do It for You

p75 Distributed Teams
p75 The Impact on Process
p75 Everyone associated with development—project managers, analysts, developers, testers—should have access to, and be accessible to, everyone else on IM and VoIP. It is essential for the smooth running of the delivery process to fly people back and forth periodically

# Chapter 4 Implementing a Testing Strategy

p83 Introduction
p83 Too many projects rely solely on manual acceptance testing to verify that a piece of software conforms to its functional and nonfunctional requirements.
p84 The design of a testing strategy is primarily a process of identifying and prioritizing project risks and deciding what actions to take to mitigate them.
p84 Lisa Crispin and Janet Gregory’s Agile Testing

p84 Types of Tests
p84 Brian Marick

p85 Business-Facing Tests That Support the Development Process
p86 Automating Acceptance Tests
p87 We generally class comprehensive as greater than 80% code coverage, though the quality of the tests is very important and coverage alone is a poor metric.
p88 For more on when to automate, read Brian Marick’s paper “When Should a Test Be Automated?” [90NC1y].

p89 Business-Facing Tests That Critique the Project
p90 Exploratory testing is described by James Bach

p92 Real-Life Situations and Strategies
p94 Midproject
p94 The best way to introduce automated testing is to begin with the most common, important, and high-value use cases of the application. This will require conver- sations with your customer to clearly identify where the real business value lies

# Part II The Deployment Pipeline

# Chapter 5 Anatomy of the Deployment Pipeline

p122 The Automated Acceptance Test Gate
p124 Automated Acceptance Test Best Practices
p125 In many organizations where automated functional testing is done at all, a common practice is to have a separate team dedicated to the production and maintenance of the test suite. As described at length in Chapter 4, “Implementing a Testing Strategy,” this is a bad idea. The most problematic outcome is that the developers don’t feel as if they own the acceptance tests. As a result, they tend not to pay attention to the failure of this stage of the deployment pipeline, which leads to it being broken for long periods of time. Acceptance tests written without developer involvement also tend to be tightly coupled to the UI and thus brittle and badly factored, because the testers don’t have any insight into the UI’s under- lying design and lack the skills to create abstraction layers or run acceptance tests against a public API.
p125 developers must be able to run automated acceptance tests on their development environments
p126 While acceptance tests are extremely valuable, they can also be expensive to create and maintain. It is thus essential to bear in mind that automated acceptance tests are also regression tests. Don’t follow a naive process of taking your acceptance criteria and blindly automating every one.

p126 Subsequent Test Stages
p128 Manual Testing
p128 Automated acceptance testing is what frees up time for testers so they can concentrate on these high-value activities, instead of being human test-script execution machines.

# Chapter 6 Build and Deployment Scripting

p152 Principles and Practices of Build and Deployment Scripting
p153 Use the Same Scripts to Deploy to Every Environment

p164 Tips and Tricks
p166 Test Targets Should Not Fail the Build
p166 In some build systems, the default behavior is that the build fails immediately when a task fails.
p166 This is almost always a Bad Thing—instead, record the fact that the activity has failed, and continue with the rest of the build process

# Chapter 7 The Commit Stage

p169 Introduction
p169 Ideally, a commit stage should take less than five minutes to run, and certainly no more than ten.

p170 Commit Stage Principles and Practices
p171 Provide Fast, Useful Feedback
p172 A common error early in the adoption of continuous integration is to take the doctrine of “fail fast” a little too literally and fail the build immediately when an error is found.
p172 We only stop the commit stage if an error prevents the rest of the stage from running—such as, for example, a compilation error. Otherwise, we run the commit stage to the end and present an aggregated report of all the errors and failures so they can all be fixed at once.

p177 Commit Test Suite Principles and Practices
p177 The vast majority of your commit tests should be comprised of unit tests
p177 Sometimes we fail the build if the suite isn’t sufficiently fast.
p178 Figure 7.3 Test automation pyramid

# Chapter 8 Automated Acceptance Testing

p188 Why Is Automated Acceptance Testing Essential?
p188 Project managers and customers often think they are too expensive to create and maintain—which indeed, when done badly, they are.

p190 How to Create Maintainable Acceptance Test Suites
p191 Such tests are often the output of record-and-playback-style test automation products, which is one of the main reasons automated acceptance tests are perceived as expensive.

p198 The Application Driver Layer
p199 That value is randomized and will change every time the test is run because a new user is created each time. This has two benefits. First, it makes acceptance tests completely independent of each other. Thus you can easily run acceptance tests in parallel without worrying that they will step on each other’s data.
p200 One of the consequences of a well-designed application driver layer is improved test reliability.

p204 Implementing Acceptance Tests
p204 State in Acceptance Tests
p205 The ideal test should be atomic. Having atomic tests means that the order in which they execute does not matter, eliminating a major cause of hard-to-track bugs. It also means that the tests can be run in parallel, which is essential to getting fast feedback once you have an application of any size.
An atomic test creates all it needs to execute and then tidies up behind itself, leaving no trace except a record of whether it passed or failed.

p213 The Acceptance Test Stage
p213 We know from experience that without excellent automated acceptance test coverage, one of three things happens: Either a lot of time is spent trying to find and fix bugs at the end of the process when you thought you were done, or you spend a great deal of time and money on manual acceptance and regression testing, or you end up releasing poor-quality software.

p214 Keeping Acceptance Tests Green
p215 Who Owns Acceptance Tests?
p215 In order to keep your acceptance tests working and to maintain the focus of the developers on the behavior of the application, it is important that the acceptance tests are owned and maintained by the delivery team as a whole, not by a separate testing team.
p216 It is essential to fix acceptance test breakages as soon as possible, otherwise the suite will deliver no real value. The most important step is to make the failure visible.

p217 Deployment Tests
p217 The best acceptance tests are atomic—that is, they create their own start conditions and tidy up at their conclusion.

# Chapter 9 Testing Nonfunctional Requirements

p234 The Capacity-Testing Environment
p236 One obvious strategy to limit the test environment costs and to provide some sensibly accurate performance measures is available where the application is to be deployed into production on a farm of servers, as shown in Figure 9.1. Replicate one slice of the servers, as shown in Figure 9.2, not the whole farm.

# Chapter 10 Deploying and Releasing Applications

p253 Deploying and Promoting Your Application
p253 The First Deployment
p254 In general, a production-like environment has the following characteristics.

p259 Rolling Back Deployments and Zero-Downtime Releases
p263 Canary Releasing
p264 You can check if the application meets capacity requirements by gradually ramping up the load, slowly routing more and more users to the application and measuring the application’s response time and metrics like CPU usage, I/O, and memory usage, and watching for exceptions in logs. This is a rela- tively low-risk way to test capacity if your production environment is too large to create a realistic production-like capacity testing environment.

p265 Emergency Fixes
p265 Do not, under any circumstances, subvert your process. Emer- gency fixes have to go through the same build, deploy, test, and release process as any other change. Why do we say this? Because we have seen so many occasions where fixes were made by logging directly into production environments and making uncontrolled changes.
p266 Here are some considerations to take into account when dealing with a defect in production: Never do them late at night, and always pair with somebody else.

p270 Tips and Tricks

p271 Deployment Is the Whole Team’s Responsibility
p271 Every member of the team should know how to deploy

p273 Fail Fast
p273 Deployment scripts should incorporate tests to ensure that the deployment was successful.

p273 Don’t Make Changes Directly on the Production Environment
p273 Production environments should be completely locked down, so that only your deployment pipeline can make changes to it.

p273 Summary
p274 The most crucial part of release planning is assembling representatives from every part of your organization involved in delivery

# Part III The Delivery Ecosystem

# Chapter 11 Managing Infrastructure and Environments

Stop. Hammer time.