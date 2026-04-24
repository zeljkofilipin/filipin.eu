---
tags:  event wikimedia
title: Sprinthackular 2025
---
## Sprinthackular

In January 2025 I participated in an internal hackathon with a funny name, Sprinthackular. This was the second Sprinthackular. The first one was in 2024, but I did not participate in that one. This time, nine temporary teams were formed. Each temporary team had members from various teams across the company.

## Team Nine

My team consisted of four members. (The team had a great name, Team Nine. There were nine teams, remember?)  We were working on [mediawiki-quickstart](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart), a local development environment. Most of the time each member would work on their own. (We live on different continents, countries and time zones.) Once a day we would meet for an hour or two, update the team on the progress and plan next steps. We didn't need to do any other regular work. (Including meetings\!) We had plenty of time to work on the project.

Still, a week is a very short time to do anything significant. The project we were working on is not new. ([The first commit](https://gitlab.wikimedia.org/repos/test-platform/mediawiki-quickstart/-/commit/268cf40b867266a93da1f08e3bb7b7d5d8a9a58c) was made in 2021.) All the easy wins were already done.

One idea we had was to fix as many environments as possible so our existing Selenium tests would pass ([T373677](https://phabricator.wikimedia.org/T373677)). That proved to be tricky since we didn't have enough information why for some repositories the tests were failing. I have worked on collecting all the data that could be useful ([T376027](https://phabricator.wikimedia.org/T376027)). While working on that, we have realized that Selenium tests could be deleted from at least two repositories, so there's no need to fix anything there.

We made some improvements to the tool. We have added support for many extensions and skins. We have improved the CI. We have made the [CI results](https://quickstart-ci-components.wmcloud.org/) publicly visible. We have learned that there are missing features we want in the tool so we have created a few new [tasks](https://phabricator.wikimedia.org/tag/mediawiki-quickstart/).

## Conclusion

Sprinthackular was a lot of fun. I wish we had sprints like that regularly. I would not complain if that was the majority of our work. I really enjoy focused work on just one thing in a small motivated team.

## Feedback

Thank you for reading. If you want to stay in touch please use the [feed](feed.xml) or send me an [email](mailto:zeljko@filipin.eu).
