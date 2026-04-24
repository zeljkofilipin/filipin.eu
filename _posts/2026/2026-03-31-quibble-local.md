---
tags:  code wikimedia
title: 'Quibble Local: Yet Another MediaWiki Local Development Environment'
---

## MediaWiki Local Development Environments

At work, I have to set up [MediaWiki](https://www.mediawiki.org/wiki/MediaWiki) on my machine frequently. Setting up [MediaWiki Core](https://www.mediawiki.org/wiki/Core) is not a big problem. The problem is when you want to install an [extension](https://www.mediawiki.org/wiki/Manual:Extensions) or a [skin](https://www.mediawiki.org/wiki/Manual:Skins). Some extensions and some skins are easy to install and set up. Some are very complicated. Guess which ones I have to install most of the time.

Over the years, I have tried several MediaWiki local development environments. (I'll use just the *environment* from now on.) The list below is roughly by the time I started using each tool.

* [MediaWiki-Vagrant](https://www.mediawiki.org/wiki/MediaWiki-Vagrant)
* [MediaWiki-Docker](https://www.mediawiki.org/wiki/MediaWiki-Docker)
* [cli](https://www.mediawiki.org/wiki/Cli)
* [MediaWiki-Quickstart](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart)

In 2023 I created a task to explore various available options ([T344682](https://phabricator.wikimedia.org/T344682)).

A few environments I didn't even manage to try yet.

* [docker-dev](https://gitlab.com/wmde/technical-wishes/docker-dev)
* [Local development quickstart](https://www.mediawiki.org/wiki/Local_development_quickstart)

I'm sure I'm missing a few environments. I remember trying some environments that no longer exist.

What's the point? Obviously, there's a need for environments. No existing environment has all, or at least most, of the features developers are looking for.

## Quibble

I was working on a project that required me to take a good look at [Quibble](https://doc.wikimedia.org/quibble/). Quibble is an important part of our continuous integration. It's the part that installs and configures MediaWiki Core with various combinations of extensions and skins.

As a first step of taking a good look at it, I updated a very old wiki page, [Run tests targeting Quibble](https://www.mediawiki.org/wiki/Selenium/How-to/Run_tests_targeting_Quibble). I have created the page in 2019, and the last update to the page was in 2021\.

I was playing with Quibble and updating the page. I was pretty happy with Quibble features. I was not at all happy with the commands I had to write.

For example, this command installs MediaWiki Core.

{% highlight shell %}
docker run -it --rm \
  --entrypoint=quibble-with-supervisord \
  -v "$(pwd)"/cache:/cache \
  -v "$(pwd)"/log:/workspace/log \
  -v "$(pwd)"/ref:/srv/git:ro \
  -v "$(pwd)"/src:/workspace/src \
  docker-registry.wikimedia.org/releng/quibble-bullseye-php83:latest
{% endhighlight %}

This one runs Selenium tests.

{% highlight shell %}
docker run -it --rm \
  --entrypoint=quibble-with-supervisord \
  -v "$(pwd)"/cache:/cache \
  -v "$(pwd)"/log:/workspace/log \
  -v "$(pwd)"/ref:/srv/git:ro \
  -v "$(pwd)"/src:/workspace/src \
  docker-registry.wikimedia.org/releng/quibble-bullseye-php83:latest \
  --skip-zuul \
  --skip-deps \
  --run selenium
{% endhighlight %}

Pretty quickly I had enough of copy/pasting long multi-line commands.

In MediaWiki-Quickstart, the same can be done with these commands.

{% highlight shell %}
./fresh_install
./run_selenium_tests
{% endhighlight %}

That's way more to my taste.

## Quibble Local

In the spirit of [xkcd standards](https://xkcd.com/927/) comic, the obvious solution was to create yet another environment. Of course. Introducing... [Quibble Local](https://gitlab.wikimedia.org/zfilipin/quibble-local). (URL might change in the near future.)

My initial plan was to create simple scripts that would execute very long Quibble commands. I didn't need to think about how to name the scripts. I could just reuse names from MediaWiki-Quickstart.

So, in Quibble Local, if you want to install MediaWiki Core and run Selenium tests, you would use the same commands as MediaWiki-Quickstart.

{% highlight shell %}
./fresh_install
./run_selenium_tests
{% endhighlight %}

These were one of the first commands. Quibble Local has much more features these days.

Project readme file documents everything. You can also use the help command to get help for all commands, or about just one command.

{% highlight shell %}
./help
./help install
{% endhighlight %}

I keep adding features and refactoring the code. Let me know if you find it useful, if you find any problems, or if you have any comments. See the footer for contact information.

## Claude Code

I took this project as an opportunity to try [Claude Code](https://claude.com/product/claude-code). I wanted the project to have minimal dependencies ([Bash](https://en.wikipedia.org/wiki/Bash_\(Unix_shell\)), [Git](https://en.wikipedia.org/wiki/Git), [Docker](https://en.wikipedia.org/wiki/Docker_\(software\))). There was no chance I was going to write a project in Bash. For various reasons.

It is an interesting experience. I'm impressed that a tool can write code that does what I say. Most of the time.  I'm not impressed with the quality of the code, or the architecture. Since this is just an experiment, I'm fine with the code as is. If this becomes anything more, I would rewrite it in a language I know better.

## Feedback

Thank you for reading. If you want to stay in touch please use the [feed](https://filipin.eu/feed.xml) or send me an [email](mailto:zeljko@filipin.eu).
