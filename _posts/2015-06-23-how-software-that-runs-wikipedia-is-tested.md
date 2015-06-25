---
published: false
layout:    post
permalink: how-software-that-runs-wikipedia-is-tested
title:     "How software that runs Wikipedia is tested"
---

About one month ago it was one year that I have started working for the Wikimedia Foundation. This blog post is a summary of what I did in the last year.

This is a new and shiny version of my <a href="http://filipin.eu/how-mediawiki-software-that-runs-wikipedia-is-tested/">How MediaWiki, software that runs Wikipedia, is tested</a> blog post.

I had several ideas how to name this blog post. On of them was *How not to fail at test automation*, but although more true to the content of this blog post, it was just too boring. Another one was *How me managed to get PHP and JavaScript developers to write Ruby code*. Similar one was *Why did we pick Ruby to run Selenium tests.*
I gave this talk several times at various meetups and conferences, but I never had the time to sit down and document it. Do you think that a nice quiet Friday evening, the night before I will give this talk one more time at another conference is a good time to collect my thoughts and document the talk? I do.

# Problems

The previous version of this talk (and blog post) was centered around tools. I would mention a tool and then talk about the problems it solves. The night before I went to <a href="http://filipin.eu/selenium-conference-2013/">Selenium conference</a> I had an idea to center the talk about the problems, and then mention the tools.

What were the problems that we wanted to solve? Communication, maintainability, browser automation, browser/operating system/version combinatorial explosion, visibility/transparency, code reuse, speed, "Halp wanted!", "Works at my machine!". Let me say a few works about each problem and how we solved it.

# Communication

Anybody surprised that the biggest problem in a software project is communication? Exactly. It is hard to know what to test, it is hard to let other people know what is tested and what is the result.

*Solution*

<a href="http://cukes.info/">Cucumber</a>. You can ask the people that know what needs to be tested to write examples in any natural language. When the test runs, Cucumber creates nice reports that anybody can read.

{% highlight gherkin %}
Feature: Log in

  Background:
    Given I am at Log in page

  Scenario: Go to Log in page
    Then Username element should be there
      And Password element should be there
      And Log in element should be there
{% endhighlight %}

# Maintainability

Were you a part of test automation project that failed because the test code was not maintainable? Exactly. Test code is like any other code, you have to make sure it easy to maintain.

*Solution*

The <a href="https://code.google.com/p/selenium/wiki/PageObjects">Page Object pattern</a>. It is a simple solution. Every page in the application is represented by one class.

For the above example, this is how a login page could look like.


<p>[code language="ruby"]<br />
class LoginPage<br />
  include PageObject</p>
<p>  include URL<br />
  page_url URL.url('Special:UserLogin')</p>
<p>  button(:login, id: 'wpLoginAttempt')<br />
  text_field(:password, id: 'wpPassword1')<br />
  text_field(:username, id: 'wpName1')</p>
<p>  def login_with(username, password)<br />
    self.username = username<br />
    self.password = password<br />
    login<br />
  end<br />
end<br />
[/code]</p>
<p>And example code that connects Cucumber and the page could look like this.</p>
<p>[code language="ruby"]<br />
When(/^Log in as (.+)$/) do |username|<br />
  on(LoginPage).login_with(username, ENV['MEDIAWIKI_PASSWORD'])<br />
end<br />
[/code]</p>
<p>Above code uses <a href="https://github.com/cheezy/page-object">page-object</a> Ruby gem.</p>
<p>Could this simple pattern be so useful? It could. For more information take a look at <a href="https://leanpub.com/cucumber_and_cheese">Cucumber & Cheese</a> book.</p>
<p><strong>Browser automation</strong></p>
<p>Once upon a time, browser automation was a hard problem. I think it is solved now. There are plenty of open source and commercial tools that automate all major browsers on all major operating systems. Even mobile browsers and native applications.</p>
<p><em>Solution</em></p>
<p><a href="http://docs.seleniumhq.org/">Selenium</a>. To be more precise Selenium WebDriver. To be even more precise, we use <a href="http://rubygems.org/gems/selenium-webdriver">selenium-webdriver</a> Ruby gem.</p>
<p><strong><a href="http://www.paulirish.com/wp-content/uploads/2011/09/browserlineupin20191.jpg">Browser/operating system/version combinatorial explosion</a></strong></p>
<p>Do you know how many combinations of major browsers, operating systems and their versions you should test? Do you know how hard it is to maintain computers or virtual machines with all those combinations? Exactly.</p>
<p><em>Solution</em></p>
<p><a href="https://saucelabs.com/docs/platforms">Sauce Labs</a>. They support everything we need, and more.</p>
<p><strong>Visibility/transparency</strong></p>
<p>We needed a way for our work to be visible to our coworkers, but also to anybody else. Yes, anybody.</p>
<p><em>Solution</em></p>
<p>There are several solutions to the problem.</p>
<p>Code is hosted in <a href="https://gerrit.wikimedia.org/">Gerrit</a> and there are <a href="https://github.com/wikimedia/">GitHub mirrors</a> for almost all repositories. Of course, everything is completely open. We also use Gerrit for code review. Almost every commit is reviewed by somebody else before it gets merged into master.</p>
<p><a href="https://lists.wikimedia.org/mailman/listinfo/qa">Mailing list</a>, <a href="https://bugzilla.wikimedia.org/">bug tracker</a> and <a href="https://wmf.ci.cloudbees.com/">continuous integration server</a> (Jenkins) is open. Anybody can see our e-mail communication, bugs and Jenkins jobs. Every Jenkins job starts several Sauce Labs jobs. All of them are open too.</p>
<p><strong>Code reuse</strong></p>
<p>MediaWiki consists of core and extensions, a usual practice. Every extension has a separate Git repository. Several extensions have Selenium tests and there was code that was copy/pasted from one repository to the other. There has to be a better way, right?</p>
<p><em>Solution</em></p>
<p>We have created <a href="https://github.com/wikimedia/mediawiki-selenium">mediawiki-selenium</a> Ruby gem. It is still early in it's development and we could really use some help.</p>
<p><strong>Speed</strong></p>
<p>Did you notice that Selenium tests take a long time to run? I did too. We have tried to speed up the test using several optimizations, but they are still slow. The only way to really speed them up is to run them in parallel. I had good results with it on several projects.</p>
<p><em>Solution</em></p>
<p>We are not there yet. When the time comes, we will probably use <a href="https://github.com/grosser/parallel_tests">parallel_tests</a> Ruby gem.</p>
<p><strong><a href="http://cheezburger.com/911727360">Halp wanted!</a></strong></p>
<p>Are you surprised that an open source project is looking for help? Surprisingly (at least to me) more people would like to write production code instead of test code. If you would like to be on the testing side, read on.</p>
<p><em>Solution</em></p>
<p>If you would like to get involved, the best way to get started is to join our <a href="https://lists.wikimedia.org/mailman/listinfo/qa">mailing list</a> and <a href="http://lists.wikimedia.org/pipermail/qa/2013-May/000003.html">introduce yoursef</a>. We have a lot of opportunities for volunteering or internships.</p>
<p><strong><a href="http://amachinefortheendoftheworld.blogspot.com/2013/09/a-cull-for-cause.html">Works at my machine!</a></strong></p>
<p>I have left an interesting problem for the end. How many times a day do you hear people say: "works at my machine"? I do not think I should go into a lot of detail explaining the problem. It should be familiar to anybody involved in software development. Sometimes software works on one machine but not on the other. Sometimes it is hard to tell why.</p>
<p><em>Solution</em></p>
<p>Since this is not a simple problem, we have several solutions for it.</p>
<p>Jenkins is <a href="https://en.wikipedia.org/wiki/Single_Source_of_Truth">Single Source Of Truth</a>. It does not matter if it works on your machine. If it fails at Jenkins machine, you should fix it.</p>
<p>Are you surprised that a piece of open source software is not trivial to install and configure to work correctly? <a href="https://www.mediawiki.org/wiki/Mediawiki-Vagrant">Mediawiki-Vagrant</a> provides an easy way to install a basic MediaWiki installation in a virutal machine, but also provides a way to easily configure it in different ways, including complete setup for running Selenium tests.</p>
<p><a href="http://rvm.io/">Ruby Version Manager (RVM)</a> makes it easy to have several versions of Ruby installed on the same machine. When you <code>cd</code> into a directory (using command line) managed by RVM it will automatically use the correct Ruby version. It will also use the correct set of Ruby gems, a feature called <a href="http://rvm.io/gemsets">gemsets</a>. It makes is trivial to replicate development environment across different machines.</p>
<p>The last piece of the puzzle is <a href="http://bundler.io/">Bundler</a>.</p>
<p>Both RVM and Bundler use a file called <code>Gemfile</code> (located at the root folder of the project). The first two lines are RVM setup, Ruby version and gemset name. The rest of the file is Bundler setup, defining which Ruby gems the project needs.</p>
<p>[code language="ruby"]<br />
#ruby=ruby-2.0.0-p247<br />
#ruby-gemset=browsertests</p>
<p>source 'https://rubygems.org'</p>
<p>gem 'chunky_png'<br />
gem 'mediawiki-selenium'<br />
[/code]</p>
<p>Bundler creates <a href="https://github.com/wikimedia/qa-browsertests/blob/master/Gemfile.lock">Gemfile.lock</a> file that goes into more detail. This is just the begginig and the end of one Gemfile.lock file.</p>
<p>[code]<br />
GEM<br />
  remote: https://rubygems.org/<br />
  specs:<br />
    builder (3.2.2)<br />
    childprocess (0.3.9)<br />
      ffi (~&gt; 1.0, &gt;= 1.0.11)<br />
    chunky_png (1.2.9)<br />
    cucumber (1.3.8)<br />
      builder (&gt;= 2.1.2)<br />
      diff-lcs (&gt;= 1.1.3)<br />
      gherkin (~&gt; 2.12.1)<br />
      multi_json (&gt;= 1.7.5, &lt; 2.0)<br />
      multi_test (&gt;= 0.0.2)</p>
<p>(...)</p>
<p>PLATFORMS<br />
  ruby<br />
  x86-mingw32</p>
<p>DEPENDENCIES<br />
  chunky_png<br />
  mediawiki-selenium<br />
[/code]</p>
<p><strong>Why did we pick Ruby to run Selenium tests?</strong></p>
<p>Can you believe that all the problems that we wanted to solve were already solved by a mature Ruby library? Other languages had libraries that solved some of the problems. If a language had all or most of the tools already available, then the tools were not as mature as in Ruby.</p>
<p><strong>Conclusion</strong></p>
<p>How to fail at test automation? Feel free to ignore advice from this article. I do not say you have to implement your test automation exactly the way we do, but I think we are doing a pretty good job.</p>
