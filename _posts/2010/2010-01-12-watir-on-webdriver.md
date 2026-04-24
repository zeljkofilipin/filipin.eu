---
tags:  code ruby
title: Watir on WebDriver
---
# Update!

**Instructions on this page are obsolete. Please find up to date detailed instructions for Windows, Mac and Linux in my [watir book](http://watir.com/book/).**

[Jari Bakken](http://github.com/jarib) just [released](http://rubyforge.org/pipermail/wtr-development/2010-January/001457.html) [Watir on WebDriver](http://github.com/jarib/watir-webdriver).

## Windows

### One-Click Installer (old)

On Windows, install it with

{% highlight shell %}
gem install watir-webdriver
{% endhighlight %}

and use it with

{% highlight ruby %}
require "rubygems" # optional
require "watir-webdriver"
browser = Watir::Browser.new(:firefox)
{% endhighlight %}

[Supported browsers](http://code.google.com/p/selenium/source/browse/trunk/common/src/rb/lib/selenium/webdriver/driver.rb) are Internet Explorer (`:ie`, `:internet_explorer`), Firefox (`:ff`, `:firefox`), Chrome (`:chrome`) and [RemoteWebDriver Server](http://code.google.com/p/selenium/wiki/RemoteWebDriverServer) (`:remote`).

### RubyInstaller

Install [RubyInstaller](http://rubyinstaller.org/), [DevKit](http://rubyinstaller.org/add-ons/devkit/) and all required gems and it just works!

{% highlight shell %}
gem install watir-webdriver
{% endhighlight %}

## Mac

My Mac came with Ruby and RubyGems installed, so it was just:

{% highlight shell %}
sudo gem install watir-webdriver
{% endhighlight %}

## Linux

### Ubuntu

My Ubuntu did not have Ruby and RubyGems installed.

Install Ruby with:

{% highlight shell %}
sudo apt-get install ruby-full
{% endhighlight %}

You can install RubyGems with:

{% highlight shell %}
sudo apt-get install rubygems
{% endhighlight %}

but Jari said it would be better to install it from source. [Downland the latest RubyGems](http://rubyforge.org/frs/?group_id=126) tgz or zip file (rubygems-1.3.5.tgz and rubygems-1.3.5.zip at the moment), extract it, open Terminal in extracted folder and run:

{% highlight shell %}
sudo ruby setup.rb
{% endhighlight %}

Install watir-webdriver:

{% highlight shell %}
sudo gem1.8 install watir-webdriver
{% endhighlight %}

### Fedora

Please see [Installing Watir-Web Driver on Fedora Linux](http://stackoverflow.com/questions/3701079/installing-watir-web-driver-on-fedora-linux)
