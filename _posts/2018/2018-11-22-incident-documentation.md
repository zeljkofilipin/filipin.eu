---
tags:  wikimedia
title: Incident Documentation - An Unexpected Journey
---
*(Originally published at [Doing the needful](https://phabricator.wikimedia.org/phame/post/view/128/incident_documentation_an_unexpected_journey/) blog.)*

# Introduction

The Release Engineering team wants to continually improve the quality of our software over time. One of the ways in which we hoped to do that this year is by creating more useful Selenium smoke tests. (From now on, *test* will be used instead of *Selenium test*.) This blog post is about how we determined where the tests should focus and the relative priority.

At first, I thought this would be a trivial task. A few hours of work. A few days at most. A week or two if I've completely underestimated it. A couple of months later, I know I have completely underestimated it.

Things I needed to do:

- Define prioritization scheme.
- Prioritize target repositories.

# Define Prioritization Scheme

In general:

- Does a repository have stewards? (Do the stewards want tests?)
- Does a repository have existing tests?

For the last year:

- How much change did happen for a repository? Simply put: more change can lead to more risk.
- How many incidents is a repository connected to? We wanted to make sure we didn't miss any obvious problematic areas.

![Coverage Change Incidents Stewards](/assets/Coverage_Change_Incidents_Stewards.png)

# Does a Repository Have Stewards?

This was relatively simple task. The best source of information is [Developers/Maintainers](https://www.mediawiki.org/wiki/Developers/Maintainers) page.

# Does a Repository Have Existing Tests?

This was also easy. [Selenium/Node.js](https://www.mediawiki.org/wiki/Selenium/Node.js) page has list of repositories that have tests in Node.js. I already had all repositories with Node.js and Ruby tests on my machine, so a quick search for `webdriverio` (Node.js) and `mediawiki_selenium` (Ruby) found all the tests. In order to be really sure I've found all repositories with tests, I've [cloned all repositories from Gerrit](https://github.com/zeljkofilipin/gerrit).

```
$ ack --json webdriverio
extensions/Echo/package.json
27:        "webdriverio": "4.12.0"
...
```

```
$ ack --type-add=lock:ext:lock --lock mediawiki_selenium
skins/MinervaNeue/Gemfile.lock
42:    mediawiki_selenium (1.7.3)
...
```

To make extra sure I have not missed any repositories, I've used MediaWiki code search ([mediawiki_selenium](https://codesearch.wmflabs.org/search/?q=mediawiki_selenium), [webdriverio ](https://codesearch.wmflabs.org/search/?q=webdriverio)) and GitHub search ([org:wikimedia extension:lock mediawiki_selenium](https://github.com/search?q=org%3Awikimedia+extension%3Alock+mediawiki_selenium), [org:wikimedia extension:json webdriverio](https://github.com/search?q=org%3Awikimedia+extension%3Ajson+webdriverio)).

This is the list.

| **Repository** | **Language**
| mediawiki/core | JavaScript
| mediawiki/extensions/AdvancedSearch | JavaScript
| mediawiki/extensions/CentralAuth | Ruby
| mediawiki/extensions/CentralNotice | Ruby
| mediawiki/extensions/CirrusSearch | JavaScript
| mediawiki/extensions/Cite | JavaScript
| mediawiki/extensions/Echo | JavaScript
| mediawiki/extensions/ElectronPdfService | JavaScript
| mediawiki/extensions/GettingStarted | Ruby
| mediawiki/extensions/Math | JavaScript
| mediawiki/extensions/MobileFrontend | Ruby
| mediawiki/extensions/MultimediaViewer | Ruby
| mediawiki/extensions/Newsletter | JavaScript
| mediawiki/extensions/ORES | JavaScript
| mediawiki/extensions/Popups | JavaScript
| mediawiki/extensions/QuickSurveys | Ruby
| mediawiki/extensions/RelatedArticles | JavaScript
| mediawiki/extensions/RevisionSlider | Ruby
| mediawiki/extensions/TwoColConflict | JavaScript, Ruby
| mediawiki/extensions/Wikibase | JavaScript, Ruby
| mediawiki/extensions/WikibaseLexeme | JavaScript, Ruby
| mediawiki/extensions/WikimediaEvents | PHP
| mediawiki/skins/MinervaNeue | Ruby
| phab-deployment | JavaScript
| wikimedia/community-tech-tools | Ruby
| wikimedia/portals/deploy | JavaScript

# How Much Change Did Happen for a Repository?

After reviewing several tools, I've found that we already use [Bitergia ](https://wikimedia.biterg.io) for various metrics. There is even a nice list of top 50 repositories by the number of commits. The tool even supports limiting the report from a date to a date. Exactly what I needed.

Bitergia > Last 90 days > Absolute > From `2017-11-01 00:00:00.000` > To `2018-10-31 23:59:59.999` > Go > Git > Overview > Repositories (raw data: [P7776](https://phabricator.wikimedia.org/P7776) , [direct link](https://wikimedia.biterg.io/app/kibana#/dashboard/Git?_g=(filters:!(('$state':(store:globalState),meta:(alias:'Empty%20Commits',disabled:!f,index:git,key:files,negate:!t,params:(query:'0',type:phrase),type:phrase,value:'0'),query:(match:(files:(query:'0',type:phrase)))),('$state':(store:globalState),meta:(alias:Bots,disabled:!f,index:git,key:author_bot,negate:!t,params:(query:!t,type:phrase),type:phrase,value:true),query:(match:(author_bot:(query:!t,type:phrase))))),refreshInterval:(display:Off,pause:!f,value:0),time:(from:'2017-10-31T23:00:00.000Z',mode:absolute,to:'2018-10-31T22:59:59.999Z'))&_a=(description:'Git%20Overview%20panel%20by%20Bitergia',filters:!(),fullScreenMode:!f,options:(darkTheme:!f,useMargins:!t),panels:!((gridData:(h:4,i:'1',w:3,x:5,y:0),id:git_commits_organizations,panelIndex:'1',title:Organizations,type:visualization,version:'6.1.0-3'),(gridData:(h:3,i:'2',w:5,x:0,y:12),id:git_commits_timezone,panelIndex:'2',title:'Commits%20by%20Time%20Zone',type:visualization,version:'6.1.0-3'),(gridData:(h:2,i:'3',w:5,x:0,y:4),id:git_evolution_authors,panelIndex:'3',title:Authors,type:visualization,version:'6.1.0-3'),(gridData:(h:2,i:'4',w:5,x:0,y:2),id:git_evolution_commits,panelIndex:'4',title:Commits,type:visualization,version:'6.1.0-3'),(gridData:(h:5,i:'5',w:7,x:5,y:4),id:git_evolution_organizations,panelIndex:'5',title:Organizations,type:visualization,version:'6.1.0-3'),(gridData:(h:2,i:'6',w:5,x:0,y:0),id:git_main_numbers,panelIndex:'6',title:Git,type:visualization,version:'6.1.0-3'),(gridData:(h:6,i:'7',w:7,x:5,y:9),id:git_organizations_table,panelIndex:'7',title:Organizations,type:visualization,version:'6.1.0-3'),(gridData:(h:6,i:'8',w:5,x:0,y:6),id:git_top_authors,panelIndex:'8',title:Authors,type:visualization,version:'6.1.0-3'),(gridData:(h:4,i:'9',w:4,x:8,y:0),id:git_top_projects,panelIndex:'9',title:Projects,type:visualization,version:'6.1.0-3'),(gridData:(h:6,i:'10',w:12,x:0,y:15),id:git_top_repositories,panelIndex:'10',title:Repositories,type:visualization,version:'6.1.0-3')),query:(language:lucene,query:(query_string:(analyze_wildcard:!t,default_field:'*',query:'*'))),timeRestore:!f,title:Git,uiState:(P-1:(title:Organizations),P-10:(spy:(mode:(fill:!f,name:!n)),title:Repositories,vis:(params:(config:(searchKeyword:''),sort:(columnIndex:!n,direction:!n)))),P-2:(title:'Commits%20by%20Time%20Zone',vis:(legendOpen:!f)),P-3:(title:Authors,vis:(legendOpen:!f)),P-4:(title:Commits,vis:(legendOpen:!f)),P-5:(title:Organizations),P-6:(title:Git),P-7:(title:Organizations,vis:(params:(config:(searchKeyword:''),sort:(columnIndex:!n,direction:!n)))),P-8:(title:Authors,vis:(params:(config:(searchKeyword:''),sort:(columnIndex:!n,direction:!n)))),P-9:(title:Projects,vis:(params:(config:(searchKeyword:''),sort:(columnIndex:!n,direction:!n))))),viewMode:view))).

This is the top 50 list (excludes empty commits and bots).

| Repository | Commits |
|--|--|
| mediawiki/extensions | 11300 |
| operations/puppet | 7988 |
| mediawiki/core | 4590 |
| operations/mediawiki-config | 4005 |
| integration/config | 1652 |
| operations/software/librenms | 1169 |
| pywikibot/core | 927 |
| mediawiki/extensions/Wikibase | 806 |
| apps/android/wikipedia | 789 |
| mediawiki/services/parsoid | 700 |
| mediawiki/extensions/VisualEditor | 692 |
| operations/dns | 653 |
| VisualEditor/VisualEditor | 599 |
| mediawiki/skins | 570 |
| mediawiki/extensions/MobileFrontend | 504 |
| mediawiki/extensions/ContentTranslation | 491 |
| translatewiki | 486 |
| oojs/ui | 469 |
| wikimedia/fundraising/crm | 457 |
| mediawiki/extensions/BlueSpiceFoundation | 414 |
| mediawiki/extensions/CirrusSearch | 357 |
| mediawiki/extensions/AbuseFilter | 306 |
| phabricator/phabricator | 302 |
| mediawiki/services/restbase | 290 |
| mediawiki/extensions/Flow | 232 |
| mediawiki/extensions/Echo | 223 |
| mediawiki/vagrant | 221 |
| mediawiki/extensions/Popups | 184 |
| mediawiki/extensions/Translate | 182 |
| mediawiki/extensions/DonationInterface | 180 |
| analytics/refinery | 178 |
| mediawiki/extensions/PageTriage | 177 |
| mediawiki/extensions/Cargo | 176 |
| mediawiki/tools/codesniffer | 156 |
| mediawiki/extensions/TimedMediaHandler | 152 |
| mediawiki/extensions/UniversalLanguageSelector | 142 |
| mediawiki/vendor | 140 |
| mediawiki/extensions/SocialProfile | 139 |
| analytics/refinery/source | 138 |
| operations/software | 137 |
| mediawiki/services/restbase/deploy | 136 |
| operations/debs/pybal | 123 |
| mediawiki/extensions/CentralAuth | 116 |
| mediawiki/tools/release | 116 |
| mediawiki/services/cxserver | 112 |
| mediawiki/extensions/BlueSpiceExtensions | 110 |
| mediawiki/extensions/WikimediaEvents | 110 |
| labs/private | 108 |
| operations/debs/python-kafka | 104 |
| labs/tools/heritage | 96 |

I've got similar results with running `git rev-list` for all repositories ([script](https://github.com/zeljkofilipin/gerrit/blob/master/git-rev-list.sh), results: [P7834](https://phabricator.wikimedia.org/P7834)).

# How Many Incidents Is a Repository Connected To?

This proved to be the most time consuming task.

I have started by reviewing existing [incident documentation](https://wikitech.wikimedia.org/wiki/Incident_documentation). Take a look at a few incidents. Can you tell which incident report is connected to which repository? I couldn't. (If you can, please let me know. I need your help.)

Incident reports are a wall of text. It was really hard for me to connect an incident report to a repository. An incident report has a title and text, example: [20180724-Train](https://wikitech.wikimedia.org/wiki/Incident_documentation/20180724-Train). Text has several sections, including Actionables. Text contains links to Gerrit patches and Phabricator tasks. (From now on, I'll use *patches* instead of *Gerrit patches* and *tasks* instead of *Phabricator tasks*.)

A patch belongs to a repository. Wikitext `[[gerrit:448103]]` is patch [mediawiki/extensions/Wikibase/+/448103](https://gerrit.wikimedia.org/r/c/mediawiki/extensions/Wikibase/+/448103), so repository is `mediawiki/extensions/Wikibase`. That is the strongest link between an incident and a repository.

A task usually has patches associated with it. Wikitext `[[phab:T181315]]` is patch [T181315 ](https://phabricator.wikimedia.org/T181315). Gerrit search [bug:T181315](https://gerrit.wikimedia.org/r/q/bug:T181315) finds many connected patches, many of them in `operations/puppet` and one in `mediawiki/vagrant`. That is an useful, but not a strong link between an incident and a repository. Some tasks have several related patches, so it provides a lot of data.

A task also usually has several tags. Most of them are not useful in this context, but tags that are components (and not for example milestones or tags) could be useful, if the component can be linked to a repository. It is also not a strong link between an incident and a repository, and it usually does not provide a lot of data.

At the end, I wrote a tool with imaginative name, [Incident Documentation](https://github.com/zeljkofilipin/incident-documentation). The tool currently collects data from patches and tasks from Actionables section of the incident report. It does not collect data from task components. It is tracked as issue [#5](https://github.com/zeljkofilipin/incident-documentation/issues/5).

# Incident Review 2017-11-01 to 2018-10-31

After reviewing Actionables section for each incident report, related patches and tasks, here are the results. Please note this table only connects incident report and repositories. It does not show how many patches from a repository are connected to an incident report. It is tracked as issue [#11](https://github.com/zeljkofilipin/incident-documentation/issues/11).

| Repository | Incidents |
|--|--|--|
| operations/puppet | 22 |
| mediawiki/core | 6 |
| operations/mediawiki-config | 4 |
| mediawiki/extensions/Wikibase | 4 |
| wikidata/query/rdf | 2 |
| operations/debs/pybal | 2 |
| mediawiki/extensions/ORES | 2 |
| integration/config | 2 |
| wikidata/query/blazegraph | 1 |
| operations/software | 1 |
| operations/dns | 1 |
| mediawiki/vagrant | 1 |
| mediawiki/tools/release | 1 |
| mediawiki/services/ores/deploy | 1 |
| mediawiki/services/eventstreams | 1 |
| mediawiki/extensions/WikibaseQualityConstraints | 1 |
| mediawiki/extensions/PropertySuggester | 1 |
| mediawiki/extensions/PageTriage | 1 |
| mediawiki/extensions/Cognate | 1 |
| mediawiki/extensions/Babel | 1 |
| maps/tilerator/deploy | 1 |
| maps/kartotherian/deploy | 1 |
| integration/jenkins | 1 |
| eventlogging | 1 |
| analytics/refinery/source | 1 |
| analytics/refinery | 1 |
| All-Projects | 1 |

# Selecting Repositories

This table is sorted by the amount of change. The only column that needs explanation is Selected. It shows if a test makes sense for the repository, taking into account all available data. Repositories without maintainers and with existing tests are excluded.

| Repository | Change | Stewards | Coverage | Incidents | Selected |
|--|--|--|--|--|--|
| mediawiki/extensions | 11300 |  |  |  |  |
| operations/puppet | 7988 | SRE |  | 22 |  |
| mediawiki/core | 4590 | Core Platform | JavaScript | 6 |  |
| operations/mediawiki-config | 4005 | Release Engineering |  | 4 |  |
| integration/config | 1652 | Release Engineering |  | 2 |  |
| operations/software/librenms | 1169 | SRE |  |  |  |
| pywikibot/core | 927 |  |  |  |  |
| mediawiki/extensions/Wikibase | 806 | WMDE | JavaScript, Ruby | 4 |  |
| apps/android/wikipedia | 789 |  |  |  |  |
| mediawiki/services/parsoid | 700 | Parsing |  |  |  |
| mediawiki/extensions/VisualEditor | 692 | Editing |  |  | ✅ |
| operations/dns | 653 | SRE |  | 1 |  |
| VisualEditor/VisualEditor | 599 | Editing |  |  |  |
| mediawiki/skins | 570 | Reading |  |  |  |
| mediawiki/extensions/MobileFrontend | 504 | Reading | Ruby |  |  |
| mediawiki/extensions/ContentTranslation | 491 | Language engineering |  |  | ✅ |
| translatewiki | 486 |  |  |  |  |
| oojs/ui | 469 |  |  |  |  |
| wikimedia/fundraising/crm | 457 | Fundraising tech |  |  |  |
| mediawiki/extensions/BlueSpiceFoundation | 414 |  |  |  |  |
| mediawiki/extensions/CirrusSearch | 357 | Search Platform | JavaScript |  |  |
| mediawiki/extensions/AbuseFilter | 306 | Contributors |  |  | ✅ |
| phabricator/phabricator | 302 | Release Engineering |  |  | ✅ |
| mediawiki/services/restbase | 290 | Core Platform |  |  |  |
| mediawiki/extensions/Flow | 232 | Growth |  |  | ✅ |
| mediawiki/extensions/Echo | 223 | Growth | JavaScript |  |  |
| mediawiki/vagrant | 221 | Release Engineering |  | 1 |  |
| mediawiki/extensions/Popups | 184 | Reading | JavaScript |  |  |
| mediawiki/extensions/Translate | 182 | Language engineering |  |  | ✅ |
| mediawiki/extensions/DonationInterface | 180 | Fundraising tech |  |  | ✅ |
| analytics/refinery | 178 | Analytics |  | 1 |  |
| mediawiki/extensions/PageTriage | 177 | Growth |  | 1 | ✅ |
| mediawiki/extensions/Cargo | 176 |  |  |  |  |
| mediawiki/tools/codesniffer | 156 |  |  |  |  |
| mediawiki/extensions/TimedMediaHandler | 152 | Reading |  |  | ✅ |
| mediawiki/extensions/UniversalLanguageSelector | 142 | Language engineering |  |  | ✅ |
| mediawiki/vendor | 140 |  |  |  |  |
| mediawiki/extensions/SocialProfile | 139 |  |  |  |  |
| analytics/refinery/source | 138 | Analytics |  | 1 |  |
| operations/software | 137 | SRE |  | 1 |  |
| mediawiki/services/restbase/deploy | 136 | Core Platform |  |  |  |
| operations/debs/pybal | 123 | SRE |  | 2 |  |
| mediawiki/extensions/CentralAuth | 116 |  | Ruby |  |  |
| mediawiki/tools/release | 116 |  |  | 1 |  |
| mediawiki/services/cxserver | 112 |  |  |  |  |
| mediawiki/extensions/BlueSpiceExtensions | 110 |  |  |  |  |
| mediawiki/extensions/WikimediaEvents | 110 |  | PHP |  |  |
| labs/private | 108 |  |  |  |  |
| operations/debs/python-kafka | 104 | SRE |  |  |  |
| labs/tools/heritage | 96 |  |  |  |  |

Since some of the repositories connected to incidents are not in the top 50 Bitergia report, I've used `git rev-list` to sort them. Numbers are different because Bitergia excludes empty commits and bots [script ](https://github.com/zeljkofilipin/gerrit/blob/master/git-rev-list.sh), results: [P7834](https://phabricator.wikimedia.org/P7834)).

| Repository | Change | Stewards | Coverage | Incidents | Selected |
|--|--|--|--|--|--|
| mediawiki/extensions/WikibaseQualityConstraints | 910 | WMDE |  | 1 | ✅ |
| mediawiki/extensions/ORES | 364 | Growth | JavaScript | 2 |  |
| wikidata/query/rdf | 204 | WMDE |  | 2 |  |
| mediawiki/extensions/Babel | 146 | Editing |  | 1 | ✅ |
| mediawiki/services/ores/deploy | 84 | Growth |  | 1 |  |
| maps/kartotherian/deploy | 80 |  |  | 1 |  |
| mediawiki/extensions/PropertySuggester | 67 | WMDE |  | 1 | ✅ |
| maps/tilerator/deploy | 61 |  |  | 1 |  |
| mediawiki/extensions/Cognate | 47 | WMDE |  | 1 | ✅ |
| All-Projects | 37 |  |  | 1 |  |
| eventlogging | 26 |  |  | 1 |  |
| integration/jenkins | 19 | Release Engineering |  | 1 |  |
| mediawiki/services/eventstreams | 16 |  |  | 1 |  |
| wikidata/query/blazegraph | 10 | WMDE |  | 1 |  |

# Prioritize Repositories

Change column uses Bitergia numbers. Numbers in italic are from `git rev-list`.

| Repository | Change | Stewards | Coverage | Incidents | Selected |
|--|--|--|--|--|--|
| mediawiki/extensions/VisualEditor | 692 | Editing |  |  | ✅ |
| mediawiki/extensions/ContentTranslation | 491 | Language engineering |  |  | ✅ |
| mediawiki/extensions/AbuseFilter | 306 | Contributors |  |  | ✅ |
| phabricator/phabricator | 302 | Release Engineering |  |  | ✅ |
| mediawiki/extensions/Flow | 232 | Growth |  |  | ✅ |
| mediawiki/extensions/Translate | 182 | Language engineering |  |  | ✅ |
| mediawiki/extensions/DonationInterface | 180 | Fundraising tech |  |  | ✅ |
| mediawiki/extensions/PageTriage | 177 | Growth |  | 1 | ✅ |
| mediawiki/extensions/TimedMediaHandler | 152 | Reading |  |  | ✅ |
| mediawiki/extensions/UniversalLanguageSelector | 142 | Language engineering |  |  | ✅ |
| mediawiki/extensions/WikibaseQualityConstraints | //910// | WMDE |  | 1 | ✅ |
| mediawiki/extensions/Babel | //146// | Editing |  | 1 | ✅ |
| mediawiki/extensions/PropertySuggester | //67// | WMDE |  | 1 | ✅ |
| mediawiki/extensions/Cognate | //47// | WMDE |  | 1 | ✅ |

The same table grouped by stewards.

| Repository | Change | Stewards | Coverage | Incidents | Selected |
|--|--|--|--|--|--|
| mediawiki/extensions/VisualEditor | 692 | Editing |  |  | ✅ |
| mediawiki/extensions/Babel | //146// | Editing |  | 1 | ✅ |
| mediawiki/extensions/ContentTranslation | 491 | Language engineering |  |  | ✅ |
| mediawiki/extensions/Translate | 182 | Language engineering |  |  | ✅ |
| mediawiki/extensions/UniversalLanguageSelector | 142 | Language engineering |  |  | ✅ |
| mediawiki/extensions/AbuseFilter | 306 | Contributors |  |  | ✅ |
| phabricator/phabricator | 302 | Release Engineering |  |  | ✅ |
| mediawiki/extensions/Flow | 232 | Growth |  |  | ✅ |
| mediawiki/extensions/PageTriage | 177 | Growth |  | 1 | ✅ |
| mediawiki/extensions/DonationInterface | 180 | Fundraising tech |  |  | ✅ |
| mediawiki/extensions/TimedMediaHandler | 152 | Reading |  |  | ✅ |
| mediawiki/extensions/WikibaseQualityConstraints | //910// | WMDE |  | 1 | ✅ |
| mediawiki/extensions/PropertySuggester | //67// | WMDE |  | 1 | ✅ |
| mediawiki/extensions/Cognate | //47// | WMDE |  | 1 | ✅ |

# Conclusions

- There are some repositories that do not fit the Selenium/end-to-end testing model (eg: `operations/puppet` or `operations/mediawiki-config`) but could benefit from other testing mechanisms or deployment practices.
- A test could prevent an outage if it runs:
  - Every time a patch is uploaded to Gerrit. That way it could find a problem during development. That is already done for repositories that have tests.
  - After deployment. That way it could find a problem that was not found during development. In ideal case, deployment would be made to a test server in production, a test would run targeting the tests server. If it fails, further deployment would be cancelled. This is not yet done.
- [Automattic runs tests targeting WordPress.com production](https://watirmelon.blog/2018/10/19/testbash-sydney-automated-e2e-testing-at-wordpress-com/):
> We decided to implement some basic e2e test scenarios which would only run in production – both after someone deploys a change and a few times a day to cover situations where someone makes some changes to a server or something.

Next steps:

- I will contact owners of selected repositories (see Prioritize Repositories section) and offer help in creating the first test.
- I will add results from Incident Documentation tool to incident reports as a new Related Repositories section. The section will link to the tool and explain how it got the data. It will also ask for edits if the data is not correct.
- I will reach out to people that created (or edited) incident reports and ask them to populate Related Repositories section. This might have mixed results. For best results, the section will already be populated with the data from Incident Documentation tool.
- I will add Related Repositories section to the [[ https://wikitech.wikimedia.org/wiki/Incident_documentation/Report_Template | incident report template ]].

Incident Documentation tool improvements:

- There are several way to link from a wiki page to a patch or task. The tool for now only supports `[[gerrit:]]` and `[[phab:]]`. Tracked as issue [#6](https://github.com/zeljkofilipin/incident-documentation/issues/6).
- Gerrit patches and Phabricator tasks from Actionables section do not provide enough data. The entire incident report should be used. I have limited it first because I was collecting data manually (and Actionables looked like the most important part of the incident report), later because of #6. Tracked as issue [#4](https://github.com/zeljkofilipin/incident-documentation/issues/4).
- Find Gerrit repository from task component. Tracked as issue [#5](https://github.com/zeljkofilipin/incident-documentation/issues/5).
- A table with the number of patches from each repository would be helpful. Tracked as issue [#11](https://github.com/zeljkofilipin/incident-documentation/issues/11).
- A report with folder/filenames from a repository that are mentioned the most. Especially useful for big repositories like `operations/puppet` and `mediawiki/core`. Tracked as issue [#12](https://github.com/zeljkofilipin/incident-documentation/issues/12).
