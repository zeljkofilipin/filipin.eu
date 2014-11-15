---
layout: post
title: Jekyll
date: 2014-11-08 16:00:00
---
- create repository at Github https://github.com/new
  - initialize it with readme and license
- disable wiki at Github https://github.com/zeljkofilipin/testingpodcast/settings
- rename master branch to gh-pages @ branch -m master gh-pages
- push gh-pages to github: @ push origin gh-pages 
- at github, make gh-pages the default branch: https://github.com/zeljkofilipin/testingpodcast/settings
- delete master branch: @ push origin :master
- initialize jekyll:
    $ vim Gemfile

    1 source 'https://rubygems.org/'$
    2 $
    3 gem 'jekyll', '~> 2.5.0'$

    $ bundle install
    $ jekyll new testingpodcast

- fix config.yml if the site is in the folder http://zeljkofilipin.github.io/testingpodcast/
    7 baseurl: "/testingpodcast" # the subpath of your site, e.g. /blog/$
    8 url: "http://zeljkofilipin.github.io/" # the base hostname & protocol for your site$

- test locally: 
    $ bundle exec jekyll serve
    ...
    Server address: http://127.0.0.1:4000/testingpodcast/
    ...

- push
- test on github http://zeljkofilipin.github.io/testingpodcast/

- export site from wordpress: http://testingpodcast.com/wp-admin/export.php
- rename the file to wordpress.xml
- move it to the root of the repository
- import

- export site from wordpress: http://testingpodcast.com/wp-admin/export.php
- rename the file to wordpress.xml
- move it to the root of the repository
- import

  1 source 'https://rubygems.org/'$
  2 $
  3 gem 'hpricot', '~> 0.8.6'$
  4 gem 'jekyll', '~> 2.5.0'$
  5 gem 'jekyll-import', '~> 0.5.1'$

$ ruby -rubygems -e 'require "jekyll-import"; JekyllImport::Importers::WordpressDotCom.run'

- fix path to imported images

$ vim
:arg _posts/*.html
:argdo :%s#src="assets/#src="/testingpodcast/assets/#g | update
