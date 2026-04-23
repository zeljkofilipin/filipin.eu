---
tags:  event
title: Webscale Computing, Zagreb, Croatia
---
Yesterday I saw [Webscale Computing](http://ini.hr/38/amazon-web-services-u-zagrebu) presentation held by Mike Culver from [amazon.com](http://www.amazon.com/). I forgot to take my camera, so there are no photos.

I saw something that I could not get out of my head since. [Amazon Elastic Compute Cloud](http://www.amazon.com/EC2-AWS-Service-Pricing/b/ref=sc_fe_c_0_15763381_3?ie=UTF8&node=201590011&no=15763381&me=A36L942TSJ2AJA) (EC2). In short, rent Linux machines $.10/hour (hour is the smallest time unit).

I could use this for testing. I could really use this.

At the moment I test with one machine that has enough CPU and RAM to open one VMware image with application I test running inside. I have six independent test suites for the application, and it takes about an hour to run them all sequentially inside the image.

I could speed it up. I could rent 6 machines and run all tests in about 10 minutes. Since I must pay for the whole hour, it would cost me about $.60. I am not in such a hurry every day, but there are days where such speed in executing tests would make a difference.

The only problem is that my application and my tests run on Windows. But since it is VMware image, I can run it on Linux.

Now, let me day dream for just a minute.

Amazon starts to bill by the minute (or second). While I am dreaming, they also lower the prices. I fragment my test suites, so every takes about a minute (or less). I could rent as many machines I need and be done with testing in an minute. Of course, it is all done automatically. Every time a developer commits new code, a machine is automatically rented, set up for testing, multiplied (so I do not have to spend time powering up, getting new application code, building it, getting new test code...).

I will really have to check this out in detail.
