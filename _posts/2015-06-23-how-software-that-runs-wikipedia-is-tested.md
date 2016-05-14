---
tags:  camp citcon code dors-cluc event ruby selenium software-testing speaker testival wikimedia
title: How software that runs Wikipedia is tested
---
This is a new and shiny version of my [How MediaWiki, software that runs Wikipedia, is tested](/how-mediawiki-software-that-runs-wikipedia-is-tested/) blog post. I gave this talk several times at various meetups and conferences, but I never had the time to sit down and document it. There are some [slides](https://commons.wikimedia.org/wiki/File:How_software_that_runs_Wikipedia_is_tested.pdf) too.

# Problems

The previous version of this talk (and blog post) was centered around tools. I would mention a tool and then talk about the problems it solves. The night before I went to <a href="/selenium-conference-2013/">Selenium conference</a> I had an idea to center the talk about the problems, and then mention the tools.

What were the problems that we wanted to solve? Communication, maintainability, browser automation, browser/operating system/version combinatorial explosion, visibility/transparency, code reuse, speed, "Halp wanted!" and "Works at my machine!". Let me say a few works about each problem and how we solved it.

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

{% highlight ruby %}
class LoginPage

  page_url 'Special:UserLogin'

  button(:login, id: 'wpLoginAttempt')
  text_field(:password, id: 'wpPassword1')
  text_field(:username, id: 'wpName1')

  def login_with(username, password)
    username_element.when_present.send_keys(username)
    password_element.when_present.send_keys(password)
    login_element.when_present.click
  end
end
{% endhighlight %}

Code that connects Cucumber and the page could look like this.

{% highlight ruby %}
Given(/^I am logged in(?: as (\w+))?$/) do |user|
  as_user(user) do |user, password|
    visit(LoginPage).login_with(user, password)
  end
end
{% endhighlight %}

Above code uses <a href="https://github.com/cheezy/page-object">page-object</a> Ruby gem.

Could this simple pattern be so useful? It could. For more information take a look at <a href="https://leanpub.com/cucumber_and_cheese">Cucumber & Cheese</a> book.

# Browser automation

Once upon a time, browser automation was a hard problem. I think it is solved now. There are plenty of open source and commercial tools that automate all major browsers on all major operating systems. Even mobile browsers and native applications.

*Solution*

<a href="http://docs.seleniumhq.org/">Selenium</a>. To be more precise Selenium WebDriver. To be even more precise, we use <a href="http://rubygems.org/gems/selenium-webdriver">selenium-webdriver</a> Ruby gem.

# <a href="http://www.paulirish.com/wp-content/uploads/2011/09/browserlineupin20191.jpg">Browser/operating system/version combinatorial explosion</a>

Do you know how many combinations of major browsers, operating systems and their versions you should test? Do you know how hard it is to maintain computers or virtual machines with all those combinations? Exactly.

*Solution*

<a href="https://saucelabs.com/docs/platforms">Sauce Labs</a>. They support everything we need, and more.

# Visibility/transparency

We needed a way for our work to be visible to our coworkers, but also to anybody else. Yes, anybody.

*Solution*

There are several solutions to the problem.

Code is hosted in <a href="https://gerrit.wikimedia.org/">Gerrit</a> and there are <a href="https://github.com/wikimedia/">GitHub mirrors</a> for almost all repositories. Of course, everything is completely open. We also use Gerrit for code review. Almost every commit is reviewed by somebody else before it gets merged into master.

<a href="https://lists.wikimedia.org/mailman/listinfo/qa">Mailing list</a>, <a href="https://phabricator.wikimedia.org/">bug tracker</a> and <a href="https://integration.wikimedia.org/ci/">continuous integration server</a> (Jenkins) is open. Anybody can see our e-mail communication, bugs and Jenkins jobs. Every Jenkins job starts several Sauce Labs jobs. All of them are open too.

# Code reuse

MediaWiki consists of core and extensions, a usual practice. Every extension has a separate Git repository. Several extensions have Selenium tests and there was code that was copy/pasted from one repository to the other. There has to be a better way, right?

*Solution*

We have created [mediawiki_selenium](https://rubygems.org/gems/mediawiki_selenium) and [mediawiki_api](https://rubygems.org/gems/mediawiki_api) Ruby gems.

# Speed

Did you notice that Selenium tests take a long time to run? I did too. We have tried to speed up the test using several optimizations, but they are still slow. The only way to really speed them up is to run them in parallel. I had good results with it on several projects.

*Solution*

We are not there yet. When the time comes, we will probably use <a href="https://github.com/grosser/parallel_tests">parallel_tests</a> Ruby gem.

# <a href="http://cheezburger.com/911727360">Halp wanted!</a>

Are you surprised that an open source project is looking for help? Surprisingly (at least to me) more people would like to write production code instead of test code. If you would like to be on the testing side, read on.

*Solution*

If you would like to get involved, the best way to get started is to join our <a href="https://lists.wikimedia.org/mailman/listinfo/qa">mailing list</a> and <a href="http://lists.wikimedia.org/pipermail/qa/2013-May/000003.html">introduce yoursef</a>. We have a lot of opportunities for volunteering or internships.

# <a href="http://amachinefortheendoftheworld.blogspot.com/2013/09/a-cull-for-cause.html">Works at my machine!</a>

I have left an interesting problem for the end. How many times a day do you hear people say: "works at my machine"? I do not think I should go into a lot of detail explaining the problem. It should be familiar to anybody involved in software development. Sometimes software works on one machine but not on the other. Sometimes it is hard to tell why.

*Solution*

Since this is not a simple problem, we have several solutions for it.

Jenkins is <a href="https://en.wikipedia.org/wiki/Single_Source_of_Truth">Single Source Of Truth</a>. It does not matter if it works on your machine. If it fails at Jenkins machine, you should fix it.

Are you surprised that a piece of open source software is not trivial to install and configure to work correctly? <a href="https://www.mediawiki.org/wiki/Mediawiki-Vagrant">Mediawiki-Vagrant</a> provides an easy way to install a basic MediaWiki installation in a virutal machine, but also provides a way to easily configure it in different ways, including complete setup for running Selenium tests.

The last piece of the puzzle is <a href="http://bundler.io/">Bundler</a>.

Bundler uses a file called `Gemfile`, located at the root folder of the project. It defines which Ruby gems the project needs.

{% highlight ruby %}
source 'https://rubygems.org'

gem 'mediawiki_selenium', '~> 1.2.1'
gem 'rubocop', require: false
{% endhighlight %}

Bundler creates `Gemfile.lock` file that goes into more detail.

{% highlight ruby %}
GEM
  remote: https://rubygems.org/
  specs:
    ast (2.0.0)
...
    mediawiki_api (0.3.1)
      faraday (~> 0.9, >= 0.9.0)
      faraday-cookie_jar (~> 0.0, >= 0.0.6)
    mediawiki_selenium (1.2.1)
      cucumber (~> 1.3, >= 1.3.10)
      headless (~> 1.0, >= 1.0.1)
      json (~> 1.8, >= 1.8.1)
      mediawiki_api (~> 0.2, >= 0.2.1)
      page-object (~> 1.0)
      rest-client (~> 1.6, >= 1.6.7)
      rspec-expectations (~> 2.14, >= 2.14.4)
      syntax (~> 1.2, >= 1.2.0)
      thor (~> 0.19, >= 0.19.1)
...
    page-object (1.1.0)
      page_navigation (>= 0.9)
      selenium-webdriver (>= 2.44.0)
      watir-webdriver (>= 0.6.11)
...
    selenium-webdriver (2.45.0)
      childprocess (~> 0.5)
      multi_json (~> 1.0)
      rubyzip (~> 1.0)
      websocket (~> 1.0)
...

PLATFORMS
  ruby

DEPENDENCIES
  mediawiki_selenium (~> 1.2.1)
  rubocop
{% endhighlight %}

# Why did we pick Ruby to run Selenium tests?

Can you believe that all the problems that we wanted to solve were already solved by a mature Ruby library? Other languages had libraries that solved some of the problems. If a language had all or most of the tools already available, then the tools were not as mature as in Ruby.

