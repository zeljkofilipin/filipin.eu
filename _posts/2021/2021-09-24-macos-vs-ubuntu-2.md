---
tags:  code linux photo
title: macOS vs Ubuntu Linux Part 2
---
# Introduction

In [macOS vs Ubuntu Linux](/macos-vs-ubuntu) I've written about a fun experiment. I've dual booted an MacBook Air with macOS and Ubuntu. Then, I ran the same npm scripts on both operating systems. To make things more interesting, I've ran the scripts both on the host operating system and inside a Docker container. Running scripts on Ubuntu was so faster, that I wanted to dual boot my iMac too. At the time, I could not dual boot the iMac because my disk refused to be partitioned. In the last couple of weeks, I've formatted disks on both machines and did a clean install of both macOS and Ubuntu. It's time to run the experiment again!

# Machines

![Machines](/assets/macos-vs-ubuntu-2/machines.jpg "Machines")

For reference, here's the table with the two machines and the Fresh container, with some relevant data.

| Machine | iMac [13,2](https://support.apple.com/en-us/HT201634) (27-inch, 2012) | MacBook Air [6,1](https://support.apple.com/en-us/HT201862) (11-inch, 2014) | Fresh |
| - |
| Processor| 3,2 GHz Quad-Core Intel Core i5 | 1,4 GHz Dual-Core Intel Core i5 |
| RAM (GB) | 16 | 4 |
| macOS | 10.15.7 | 11.6 |
| Linux | Ubuntu 21.04 | Ubuntu 21.04 | Debian 9 (stretch) |
| Docker | 20.10.8 | 20.10.8 |
| Docker Compose | 1.29.2 | 1.29.2 |
| Fresh | 21.04.1 | 21.04.1 |
| Node.js | 10.24.1 | 10.24.1 | 10.15.2 |
| npm | 6.14.12 | 6.14.12 | 6.14.5 |
| MediaWiki | 1.38.0-alpha | 1.38.0-alpha |
| Chrome (macOS) | 94.0.4606.61 | 94.0.4606.61 |
| Chromium (Linux) | 93.0.4577.82 | 93.0.4577.82 | 73.0.3683.75 |

# Docker

I've left Docker settings at default values. Increasing resources available to Docker might speed things up on MacOS, but that's a topic for another blog post.

For my reference, here are the default values in Docker *Preferences > Resources* on macOS.

| CPUs | 2 |
| Memory | 2 GB |
| Swap | 1 GB |
| Disk image size| 59.6 GB (4.5 GB used) |

# Running the scripts

Similar to the previous blog post, I was running two npm scripts. Installing npm dependencies (`npm ci`) and running tests (`npm run selenium-test`). I've used [MediaWiki Core](https://gerrit.wikimedia.org/g/mediawiki/core) repository (`npm ci`) and it's Selenium test suite (`npm run selenium-test`). The suite is targeting a local MediaWiki site. The site is running in a local Docker container via [MediaWiki-Docker](https://www.mediawiki.org/wiki/MediaWiki-Docker).

I was not only interested in how fast it is to run the scripts from the operating system (macOS or Linux). I also wanted to know how much time it takes to run the scripts from a Fresh container. ([Fresh](https://gerrit.wikimedia.org/g/fresh) is *"a fast and ready-to-use Docker container with various developer tools pre-installed."*)

To make things as fair as possible, both machines were using the same wifi and were the same distance from the router. `npm run selenium-test` was running in headless mode.

# Data

I've tried to keep the environments as simple as possible. When running the commands, only the Terminal application was open. I wasn't interested in very good data. I just wanted good enough data for my use case. For that reason, I've only run each command three times. That's just enough data to show any trends, but not so much that I'll get bored while waiting for them to finish. All results are in how much time (in minutes and seconds) each command took in different environments.

I made a mistake in the previous blog post on this topic by including all the data in the post. That's too much data. This time, I'll include only averages.

| Environment | npm ci (m:s) | npm run selenium-test (m:s)
| - |
| iMac + Ubuntu | 0:12 | 0:15
| iMac + Ubuntu + Fresh | 0:14 | 0:19
| iMac + macOS | 0:20 | 0:22
| iMac + macOS + Fresh | 2:25 | 1:02
| Air + Ubuntu | 0:13 | 0:17
| Air + Ubuntu + Fresh | 0:19 | 0:23
| Air + macOS | 0:36 | 0:47
| Air + macOS + Fresh | 4:04 | 1:54

Chart by environment.

![Environment](/assets/macos-vs-ubuntu-2/environment.png "Environment")

Chart by script.

![Script](/assets/macos-vs-ubuntu-2/script.png "Script")

# Conclusion

As expected, running both scripts is much faster on Linux. Running the scripts is much slower on macOS+Fresh combination. The tiny laptop is running great on Linux!
