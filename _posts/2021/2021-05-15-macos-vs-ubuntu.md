---
tags:  code photo
title: macOS Versus Ubuntu Linux
---
# Idea

I do most of my work on a 27-inch iMac from 2012. It's a good desktop machine.

When traveling, I use a 11-inch MacBook Air from 2014. It's a very small and convenient laptop. It's powerful enough, but barely. I have to be very careful with resources when I'm working on it.

For a while now I was thinking about dual booting the laptop with a Linux, to see how it would behave. I've finally dual booted it with Ubuntu this week. As soon as the machine was mostly functional under Ubuntu, I've decided to test it.

# Machines

For reference, here's the table with the two machines, with some relevant data. For readability, I've omitted the data that's the same as in the above row.

| Machine | Processor | RAM (GB) | OS | Docker | Docker Compose | MediaWiki | Fresh | Node.js | npm
|-|
| iMac [13,2](https://support.apple.com/en-us/HT201634) (27-inch, 2012) | 3,2 GHz Quad-Core Intel Core i5 | 16 | macOS 10.15.7 | 20.10.6 | 1.29.1 | 1.37.0-alpha | 21.04.1 | 10.24.1 | 6.14.12
| MacBook Air [6,1](https://support.apple.com/en-us/HT201862) (11-inch, 2014) | 1,4 GHz Dual-Core Intel Core i5 | 4 | macOS 11.3.1
| | | | Ubuntu 21.04 |

# Tests

Two things that I do the most are installing npm dependencies (`npm ci`) and running tests (`npm run selenium-test`). For this blog post, I'll use [MediaWiki Core](https://gerrit.wikimedia.org/g/mediawiki/core) repository and it's Selenium test suite. The suite is targeting a local MediaWiki. MediaWiki is running in a local Docker container via [MediaWiki-Docker](https://www.mediawiki.org/wiki/MediaWiki-Docker).

Both tests will have two variants. One variant will run the command from the operating system (without a container). The other variant will run the commands from a Fresh container. [Fresh](https://gerrit.wikimedia.org/g/fresh) is *"a fast and ready-to-use Docker container with various developer tools pre-installed."*

# Data

I've tried to keep the environments as simple as possible. When running the commands, only the Terminal application was open. I was primarily interested in how much RAM will be used when running the tests in the Fresh container, since the laptop has only 4 GB. I've also measured how fast each command runs.

I wasn't interested in very good data. I just wanted good enough data for my use case. For that reason, I've only run each command three times. That's just enough data to show any trends, but not so much that I'll get bored while waiting for them to finish. All results are in how much time (in minutes) each command took in different environments.

## iMac + macOS

| Run | `npm ci` (m) | `npm run selenium-test` (m) |
|-|
| 1 | 0:23 | 1:15 |
| 2 | 0:24 | 0:56 |
| 3 | 0:23 | 1:01 |

## iMac + macOS + Fresh

| Run | `npm ci` (m) | `npm run selenium-test` (m) |
|-|
| 1 | 3:19 | 2:24 |
| 2 | 3:17 | 1:52 |
| 3 | 3:27 | 1:53 |

## Air + macOS

| Run | `npm ci` (m) | `npm run selenium-test` (m) |
|-|
| 1 | 0:42 | 1:47 |
| 2 | 0:45 | 1:49 |
| 3 | 0:44 | 1:48 |

## Air + macOS + Fresh

| Run | `npm ci` (m) | `npm run selenium-test` (m) |
|-|
| 1 | 6:14 | 3:42 |
| 2 | 5:51 | 3:30 |
| 3 | 5:46 | 3:28 |

## Air + Ubuntu

| Run | `npm ci` (m) | `npm run selenium-test` (m) |
|-|
| 1 | 0:17 | 0:34 |
| 2 | 0:15 | 0:34 |
| 3 | 0:15 | 0:34 |

## Air + Ubuntu + Fresh

| Run | `npm ci` (m) | `npm run selenium-test` (m) |
|-|
| 1 | 0:24 | 0:54 |
| 2 | 0:24 | 0:53 |
| 3 | 0:24 | 0:53 |

# RAM

Since a blog post without an image is no fun, I took a couple of screenshots.

Air + Ubuntu + Fresh + `npm run selenium-test`

![Air + Ubuntu + Fresh](/assets/macos-vs-ubuntu/ubuntu.png "Air + Ubuntu + Fresh")

Air + macOS + Fresh + `npm run selenium-test`

![Air + macOS + Fresh](/assets/macos-vs-ubuntu/macos.png "Air + macOS + Fresh")

Not surprisingly, the screenshots show that on Ubuntu the machine was using 1.5 GB RAM, while on macOS it was using 3.2 GB RAM. The difference is in the Linux virtual machine that Docker runs in the background on macOS.

# Conclusion

I was expecting to see less RAM used while running the commands on Ubuntu. At the end, I didn't measure RAM usage at all. I've measured how much time it takes to run the commands. It is so much faster on Ubuntu, it's amazing.

`npm ci` takes about 23-24 seconds to run on powerful desktop machine running macOS, *outside* of the Fresh container. It takes more than 3 minutes to run the same command *inside* the container.

It takes 15-17 seconds to run the command *outside* the Fresh container on a non-powerful laptop running Ubuntu. Running *inside* the Fresh container takes about 24 seconds. That's the same amount of time the desktop took to run the command *outside* the container!

`npm run selenium-test` tells the same story. Running it *outside* the container on desktop machine running macOS took about a minute. Running it *inside* the container took about 2 minutes.

On the laptop running Ubuntu, it took about half a minute *outside* and about a minute *inside* the container.

The speed improvement is so obvious, I'm seriously considering dual booting the desktop too.