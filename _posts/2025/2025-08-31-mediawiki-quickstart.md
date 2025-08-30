---
tags:  photo software wikimedia
title: MediaWiki Quickstart by Monte Hurd
---
*Estimated reading time is 2 minutes.*

It's rare that I write about a piece of software written by a coworker. [MediaWiki Quickstart](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart) is so useful that it deserves a post.

Monte started the project in [2021](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart/-/commit/268cf40b867266a93da1f08e3bb7b7d5d8a9a58c) and wrote the vast majority of the code. According to [contributor analytics](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart/-/graphs/main?ref_type=heads) he created more than 800 commits. (I'm in the second place with just above 50 commits. The third is Peter Hedenskog with more than 10 commits.)

According to [repository analytics](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart/-/graphs/main/charts), it's mostly shell, followed by PHP, Vue, JavaScript and HCL. (I've never heard about HCL, I think. I'll have dig deeper.)

What does it do? It's the simplest way to get MediaWiki working on your machine. The only dependency is Docker.

From zero to Mediawiki in three steps:

- Install Docker
- Clone [mediawiki-quickstart](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart)
- `./fresh_install`

Want to install an [extension](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart/-/tree/main/extensions), or a [skin](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart/-/tree/main/skins)?

`./install extensions/Echo`

`./install skins/Modern`

Something went wrong? Just do a fresh install.

`./fresh_install`

I'll finish by mentioning two of my favorite features.

The fist one is a [job](https://quickstart-ci-components.wmcloud.org/) that runs continuously. It's testing if Selenium tests work for all supported extensions and skins.

![MediaWiki Quickstart CI](assets/2025/mediawiki-quickstart/ci.png "MediaWiki Quickstart CI")

The second one is live view of the desktop of the Docker container where Selenium tests are running.

`./run_selenium_tests`

![MediaWiki Quickstart run_selenium_tests](assets/2025/mediawiki-quickstart/selenium.png "MediaWiki Quickstart run_selenium_tests")