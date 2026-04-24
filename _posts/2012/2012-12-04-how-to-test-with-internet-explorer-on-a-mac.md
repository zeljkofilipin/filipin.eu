---
tags:  image macos testing
title: How to Test with Internet Explorer on a Mac
---
![Random Photo: Globe, Utrecht, the Netherlands](/assets/2012/how-to-test-with-internet-explorer-on-a-mac.jpg "Random Photo: Globe, Utrecht, the Netherlands") Random Photo: Globe, Utrecht, the Netherlands

To my surprise, not everybody knows how to test with Internet Explorer on a Mac. After responding to [How do I run Internet Explorer using ruby mine on a mac](http://stackoverflow.com/q/13653913/17469) question at Stack Overflow, I have decided to create a blog post, mostly copy/pasting my answer.

------------------------------------------------------------------------

<div class="post-text">
<p>I think you will find 80% of the problems if you test your app with any browser (see [80–20 rule](http://en.wikipedia.org/wiki/Pareto_principle)). Said that, I also test with IE.</p>
<p>There are a few better ways to test with IE on a Mac than installing IE for Mac:</p>
<ul>
<li>Install Windows in a virtual machine with:
<ul>
<li>[VirtualBox](https://www.virtualbox.org/) (free)</li>
<li>[VMware Fusion](http://www.vmware.com/products/fusion/overview.html) (30-day free trial, then 63.23 USD)</li>
<li>[Parallels](http://www.parallels.com/) (did not use it, looks like they have 14-day free trial and then 79.99 USD)</li>
</ul>
</li>
<li>Install Windows on your Mac machine with [Boot Camp](http://www.apple.com/support/bootcamp/)</li>
</ul>
<p>If you pick dual boot or virtual machine you will have to buy [Windows](http://windows.microsoft.com/en-US/windows/home) too. (Upgrade from a previous Windows version is 39.99 USD, could not find out how much the [full version](http://windows.microsoft.com/en-US/windows-8/upgrade-to-windows-8#section_5) costs.)</p>
<ul>
<li>Use a cloud service that will run IE for you:
<ul>
<li>[Sauce Labs](https://saucelabs.com/) (free account provides testing Windows for 100 minutes automated + 30 minutes manual every month, [paid plans](https://saucelabs.com/pricing) start with 12 USD/month)</li>
<li>[TestingBot](http://testingbot.com/) (free account provides testing for 100 minutes in the first two weeks, [paid plans](http://testingbot.com/pricing) start with 40 USD/month)</li>
</ul>
</li>
</ul>
<p>[MediaWiki](http://www.mediawiki.org/wiki/MediaWiki) (software that runs Wikipedia) has a few Watir tests that drive Chrome, Firefox and IE on Sauce Labs, the code is at [github.com/wikimedia/qa-browsertests](https://github.com/wikimedia/qa-browsertests).</p>
</div>
