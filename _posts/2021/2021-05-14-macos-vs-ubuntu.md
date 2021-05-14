---
tags:  code photo
title: macOS Versus Ubuntu Linux
published: false
---
When traveling, I use a 11-inch MacBook Air from 2014. It's a very small and convenient travel machine. It's powerful enough, but barely. I have to be very careful with resources when I'm working on it.

For a while now I was thinking about dual booting the machine with a Linux, to see how it would behave. I've finally dual booted it with Ubuntu this week. As soon as the machine was mostly functional under Ubuntu, I've decided to test it.

Two things that I do the most are installing NPM dependencies (`npm ci` command) and running tests (`npm run selenium-test` command). Tests are MediaWiki Core Selenium test suite. The suite is targeting a local MediaWiki. MediaWiki is running in a local Docker container.

Both tests will have two variants. One variant will run the command from a Fresh container. Another will run the suite from Ubuntu (no container).

# Fresh

![Fresh on Ubuntu](/assets/macos-vs-ubuntu/ubuntu-fresh.png "Fresh on Ubuntu")

[Fresh](https://gerrit.wikimedia.org/g/fresh) is "a fast and ready-to-use Docker container with various developer tools pre-installed."

# Headless

![Headless on Ubuntu](/assets/macos-vs-ubuntu/ubuntu-headless.png "Headless on Ubuntu")

The simplest solution is to run the suite headless.
