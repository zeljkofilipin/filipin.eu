---
tags:  code event facebook photo selenium speaker testing testival video wikimedia youtube
title: How MediaWiki, software that runs Wikipedia, is tested
---
<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fmedia%2Fset%2F%3Fset%3Da.10154142127892290.1073741863.735252289%26type%3D3&width=500" width="500" height="518" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>

Yesterday I gave a talk titled *How MediaWiki, software that runs Wikipedia, is tested* at <a href="http://2013.dorscluc.org/en/">DORS/CLUC 2013</a> conference. The talk consisted of a few parts, each lasting a few minutes. The video of the talk (in Croatian) is available (I start at 32:25).

<iframe width="420" height="315" src="https://www.youtube.com/embed/BFbtLJL5by4" frameborder="0" allowfullscreen></iframe>

# Part One

A few words about myself. I have showed this web site and [DORS/CLUC 2013](/dors-cluc-2013) article (I was <a href="http://en.wikipedia.org/wiki/Liveblogging">liveblogging</a>).

# Part Two

Short version of Quim Gil's *How to hack on Wikipedia* talk (sources: <a href="https://fosdem.org/2013/schedule/event/how_to_hack_on_wikipedia/">FOSDEM 2013</a>, <a href="http://www.mediawiki.org/wiki/Events/FOSDEM/2013_-_Lightning_-_Qgil">MediaWiki</a>).

# Part Three

Short <a href="http://docs.seleniumhq.org/">Selenium</a> + <a href="http://www.ruby-lang.org/en/">Ruby</a> live coding demo. The example at the talk was slightly different.
I have first opened <a href="http://en.wikipedia.beta.wmflabs.org/wiki/Main_Page">a test site</a> manually, clicked <code>Print/export</code> link (sidebar at the left hand side) so <code>Download as PDF</code> link appears.

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/pdf1.png" alt="Print/export" />
*Print/export*

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/pdf2.png" alt="Download as PDF" />
*Download as PDF*

I have then click <code>Download as PDF</code> link and showed that <code>Download the file</code> link should appear (after a while) at the page that opens.

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/pdf3.png" alt="Please wait while the document is being generated." />
*Please wait while the document is being generated.*

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/pdf4.png" alt="Download the file" />
*Download the file*

Next we did the same with Selenium. I like <a href="http://en.wikipedia.org/wiki/Interactive_Ruby_Shell">irb</a> for live coding, so the first step is to open it.

{% highlight shell %}
$ irb
{% endhighlight %}

I like <a href="http://watir.com/">Watir</a> API better than the official <a href="https://code.google.com/p/selenium/wiki/RubyBindings">Selenium Ruby bindings</a> (<a href="http://rubygems.org/gems/selenium-webdriver">selenium-webdriver</a> gem) so the examples use <a href="http://watirwebdriver.com/">watir-webdriver</a> gem.

{% highlight ruby %}
> require "watir-webdriver"
=> true
{% endhighlight %}

Open Firefox browser.

{% highlight ruby %}
> browser = Watir::Browser.new :firefox
=> #<Watir::Browser:0x..fb91ac5c833bf0a86 url="about:blank" title="">
{% endhighlight %}

Go to the test site.

{% highlight ruby %}
> browser.goto "http://en.wikipedia.beta.wmflabs.org/"
=> "http://en.wikipedia.beta.wmflabs.org/wiki/Main_Page"
{% endhighlight %}

Click <code>Print/export</code> and <code>Download as PDF</code> links.

{% highlight ruby %}
> browser.a(text: "Print/export").click
=> []

> browser.a(text: "Download as PDF").click
=> []
{% endhighlight %}

Check if <code>Download the file</code> link appeared.

{% highlight ruby %}
> browser.a(text: "Download the file").exists?
=> true
{% endhighlight %}

Close the browser.

{% highlight ruby %}
> browser.close
=> true
{% endhighlight %}

Now, do the same thing in Chrome, just because we can.

{% highlight ruby %}
> browser = Watir::Browser.new :chrome
=> #<Watir::Browser:0x..f91396bcbed26c69e url="about:blank" title="about:blank">

> browser.goto "http://en.wikipedia.beta.wmflabs.org/"
=> "http://en.wikipedia.beta.wmflabs.org/wiki/Main_Page"

> browser.a(text: "Print/export").click
=> []

> browser.a(text: "Download as PDF").click
=> []

> browser.a(text: "Download the file").exists?
=> true

> browser.close
=> true
{% endhighlight %}

Please notice that except the line that opens the browser, everything else is the same.
Just for fun, let's do the same thing in <a href="http://phantomjs.org/">PhantomJS</a>.

{% highlight ruby %}
> browser = Watir::Browser.new :phantomjs
=> #<Watir::Browser:0x..fbff7276034352be4 url="about:blank" title="">

> browser.goto "http://en.wikipedia.beta.wmflabs.org/"
=> "http://en.wikipedia.beta.wmflabs.org/wiki/Main_Page"

> browser.a(text: "Print/export").click
=> []

> browser.a(text: "Download as PDF").click
=> []

> browser.a(text: "Download the file").exists?
=> true
{% endhighlight %}

Before closing the browser, let's take a screenshot. Screenshot of a headless browser? There is a joke here somewhere. If only I could find it.

{% highlight ruby %}
> browser.screenshot.save "phantomjs.png"
=> #<File:phantomjs.png (closed)>

> browser.close
=> true
[/code]
{% endhighlight %}

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/phantomjs.png" alt="PhantomJS" />
*PhantomJS screenshot*

It would be crazy to type this stuff all the time, so let's create a script that we can just run. I have executed <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/pdf_readonly.feature#L9-L12">Click on Download as PDF link</a> scenario.
From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/pdf_readonly.feature">pdf_readonly.feature</a> file.

{% highlight gherkin %}
Scenario: Click on Download as PDF link
  Given I am at random page
  When I click on Download as PDF
  Then Download the file link should be present
{% endhighlight %}

The scenario failed.

{% highlight shell %}
$ bundle exec cucumber features/pdf_readonly.feature:9
Using the default profile...
..F

(::) failed steps (::)

timed out after 15 seconds, waiting for {:text=>"Download the file", :tag_name=>"a"} to become present (Watir::Wait::TimeoutError)
./features/step_definitions/pdf_steps.rb:15:in 'block (2 levels) in <top (required)>'
./features/step_definitions/pdf_steps.rb:14:in '/^Download the file link should be present$/'
features/pdf_readonly.feature:12:in 'Then Download the file link should be present'

Failing Scenarios:
cucumber features/pdf_readonly.feature:9 # Scenario: Click on Download as PDF link

1 scenario (1 failed)
3 steps (1 failed, 2 passed)
0m48.241s
{% endhighlight %}

The problem is that the test waits 15 seconds for <code>Download the file</code> link to appear, and sometimes it takes longer. This time it took longer and the test failed.

# Part Four

A short overview of the complete browser test automation solution that we have developed. The code is hosted at Gerrit (<a href="https://gerrit.wikimedia.org/r/#/admin/projects/qa/browsertests">qa/browsertests</a>) and there is Github mirror (<a href="https://github.com/wikimedia/qa-browsertests">wikimedia/qa-browsertests</a>).
We use <a href="https://rvm.io/">RVM</a> to manage Ruby versions and <a href="https://rvm.io/gemsets/">gemsets</a>.
<a href="https://github.com/wikimedia/qa-browsertests/blob/master/.ruby-version">.ruby-version</a> file.

{% highlight ruby %}
ruby-2.0.0-p0
{% endhighlight %}

<a href="https://github.com/wikimedia/qa-browsertests/blob/master/.ruby-gemset">.ruby-gemset</a> file.

{% highlight ruby %}
browsertests
{% endhighlight %}

We use <a href="http://gembundler.com/">Bundler</a> to manage project dependencies.
<a href="https://github.com/wikimedia/qa-browsertests/blob/master/Gemfile">Gemfile</a> file.

{% highlight ruby %}
source 'https://rubygems.org'

gem 'chunky_png'
gem 'cucumber'
gem 'net-http-persistent'
gem 'page-object'
gem 'parallel_tests'
gem 'rake'
gem 'rspec-expectations'
gem 'syntax'
{% endhighlight %}

From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/Gemfile.lock">Gemfile.lock</a> file.

{% highlight ruby %}
GEM
remote: https://rubygems.org/
specs:
builder (3.2.0)
childprocess (0.3.9)
ffi (~> 1.0, >= 1.0.11)
chunky_png (1.2.8)
cucumber (1.3.1)
builder (>= 2.1.2)
diff-lcs (>= 1.1.3)
gherkin (~> 2.12.0)
multi_json (~> 1.3)

...

PLATFORMS
ruby
x86-mingw32

DEPENDENCIES
chunky_png
cucumber
net-http-persistent
page-object
parallel_tests
rake
rspec-expectations
syntax
{% endhighlight %}

We use <a href="http://cukes.info/">Cucumber</a> (<a href="https://github.com/wikimedia/qa-browsertests/tree/master/features">features</a> folder) as a tool for communication between people that know what needs to be tested and people that know how to write browser test automation code. Cucumber is one of the really important tools in our toolchain.
I have showed Cucumber code for <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/pdf_readonly.feature#L9-L12">Click on Download as PDF link</a> scenario.
From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/pdf_readonly.feature">pdf_readonly.feature</a> file.

{% highlight gherkin %}
Scenario: Click on Download as PDF link
  Given I am at random page
  When I click on Download as PDF
  Then Download the file link should be present
{% endhighlight %}

Then I showed how <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/pdf_readonly.feature#L10">Given I am at random page</a> step is <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/step_definitions/search_steps.rb#L1-L3">implemented</a>.
From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/step_definitions/search_steps.rb">search_steps.rb</a> file.

{% highlight ruby %}
Given /^I am at random page$/ do
  visit RandomPage
end
{% endhighlight %}

As you can see, the implementation is trivial. <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/support/pages/random_page.rb#L5">RandomPage</a> is also pretty simple.
From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/support/pages/random_page.rb">random_page.rb</a> file.

{% highlight ruby %}
class RandomPage
  include PageObject
  include URL
  page_url URL.url('Special:Random')
...
end
{% endhighlight %}

<a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/support/modules/url_module.rb">URL module</a> is simple too.
<a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/support/modules/url_module.rb">url_module.rb</a> file.

{% highlight ruby %}
module URL
  def self.url(name)
    if ENV['MEDIAWIKI_URL']
      mediawiki_url = ENV['MEDIAWIKI_URL']
    else
      mediawiki_url = 'http://en.wikipedia.beta.wmflabs.org/wiki/'
    end
    "#{mediawiki_url}#{name}"
  end
end
{% endhighlight %}

I have explained that we use the <a href="https://code.google.com/p/selenium/wiki/PageObjects">Page Object pattern</a> and <a href="https://github.com/cheezy/page-object">page-object</a> gem. Page object pattern is another important tool. It allows us to write maintainable code.
A slightly more complicated step is <code>When I click on Download as PDF</code>.
From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/step_definitions/pdf_steps.rb">pdf_steps.rb</a> file.

{% highlight ruby %}
When(/^I click on Download as PDF$/) do
  @browser.driver.manage.add_cookie(:name => 'vector-nav-p-coll-print_export', :value => 'true')
  @browser.driver.navigate.refresh
  on(RandomPage).download_as_pdf
end
{% endhighlight %}

From <a href="https://github.com/wikimedia/qa-browsertests/blob/master/features/support/pages/random_page.rb">random_page.rb</a> file.

{% highlight ruby %}
class RandomPage
  include PageObject

  include URL
  page_url URL.url('Special:Random')

  ...

  a(:download_as_pdf, text: 'Download as PDF')

  ...

end
{% endhighlight %}

We use <a href="http://jenkins-ci.org/">Jenkins</a> <a href="http://en.wikipedia.org/wiki/Continuous_integration">continuous integration</a> server. It is also one of the important tools. Jenkins that runs our browser test automation is hosted by <a href="http://www.cloudbees.com/">CloudBees</a> at <a href="https://wmf.ci.cloudbees.com/">wmf.ci.cloudbees.com</a>.
I have showed <a href="https://wmf.ci.cloudbees.com/job/browsertests-en.wikipedia.org-linux-chrome/">a job</a> that is sometimes failing because of the timeout problem that I have mentioned previously. I have showed a couple of nice Jenkins features, <a href="https://wmf.ci.cloudbees.com/job/browsertests-en.wikipedia.org-linux-chrome/test/?width=800&height=600">Test Result Trend</a> chart and <a href="https://wmf.ci.cloudbees.com/job/browsertests-en.wikipedia.org-linux-chrome/buildTimeTrend">Build Time Trend</a> chart.

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/trt.png" alt="Test Result Trend" />
*Test Result Trend*

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/btt.png" alt="Build Time Trend" />
*Build Time Trend*

Then I showed <a href="https://wmf.ci.cloudbees.com/job/browsertests-en.wikipedia.org-linux-chrome/56/">a build that failed</a> and <a href="https://wmf.ci.cloudbees.com/job/browsertests-en.wikipedia.org-linux-chrome/56/testReport/junit/(root)/PDF/Click_on_Download_as_PDF_link/">test results</a> saying <code>timed out after 15 seconds, waiting for {:text=>"Download the file", :tag_name=>"a"} to become present</code>.
I have ended the talk with showing <a href="https://saucelabs.com/">Sauce Labs</a> (Selenium in the cloud) <a href="https://saucelabs.com/jobs/8ab15dcf1b1e40d4864a50d508b928a5">job</a> for the failed Jenkins job. Sauce Labs job has logs, screens shots and video of the entire test.

# Part Five

There were a few questions from the audience, and I did my best to answer them.

# Part Six
At the next break I was handing out t-shirts, pens, stickers, badges and talking with people about my talk and related things.

# Ideas for the next talk

A few ideas came to my mind after the talk. It would be fun to show how to run the test on my machine but instead of running the browser there too, run the browser at Sauce Labs.
For those interested in playing with the code themselves, show <a href="http://www.mediawiki.org/wiki/Mediawiki-Vagrant">MediaWiki-Vagrant</a> and <a href="https://github.com/wikimedia/mediawiki-vagrant/tree/master/puppet/modules/browsertests">puppet/modules/browsertests</a>, the complete environment in a virtual machine. Setting everything up is as easy as installing a couple of applications and cloning a repository.
If you want to get involved, join <a href="https://lists.wikimedia.org/mailman/listinfo/qa">qa@lists.wikimedia.org</a> mailing list and <a href="http://lists.wikimedia.org/pipermail/qa/2013-May/000003.html">introduce</a> yourself.

<img src="/assets/how-mediawiki-software-that-runs-wikipedia-is-tested/vagrant-1024x640.png" alt="Vagrant" />
*The screen shot shows a Mac desktop. On the right hand side you can see two Mac windows (Terminal, VirtualBox). On the left hand side you can see Firefox window forwarded from a Linux virtual machine. Magic.*
