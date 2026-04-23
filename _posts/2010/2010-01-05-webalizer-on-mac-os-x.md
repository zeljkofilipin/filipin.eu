---
tags:  macos
title: Webalizer on Mac OS X
---
Yesterday I spend a few hours trying to install [Webalizer on Mac OS X](http://webalizer.darwinports.com/) 10.6 (Show Leopard), with no luck. After some browsing, I found instructions [how to migrate MacPorts](http://trac.macports.org/wiki/Migration), but I got stuck with [Error: Checksum (md5) mismatch for jpegsrc.v7.tar.gz](http://trac.macports.org/ticket/23127). Looks like it is fixed, and Webalizer installed with no problems today with just:

`sudo port install webalizer`
