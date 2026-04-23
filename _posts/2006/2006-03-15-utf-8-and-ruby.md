---
tags:  code ruby
title: UTF-8 and Ruby
---
I use Watir to test web applications.

At application under test, after user is created I need to get her or his database id. I use it later to check if script is at the right page. For example, view user page url is

{% highlight http %}
http://{application_under_test}/ViewUser.aspx?m={user_database_id}
{% endhighlight %}

I have to know user database id to check URL.

A developer made XML page with all users. Only username and database id are displayed.

Script goes there and grabs database id.

{% highlight ruby %}
require "watir"
require "rexml/document"
username = "Aragon"
ie = Watir::IE.start("{application_under_test}/users.xml")
root = REXML::Document.new(ie.text).root
db_id = root.elements["item[@username='#{username}']"].attributes["id"]
puts db_id
{% endhighlight %}

And it works just fine.

Then, we imported data from production database. And my script returns this error:

{% highlight shell %}
C:\ruby\lib\ruby\1.8/rexml/parsers/treeparser.rb:85:in `parse': #
...
Last 80 unconsumed characters:
...
{% endhighlight %}

There is user with username Aragón, and my script has a problem with it.

The solution? Install Ruby 1.8.3. or 1.8.4. and put this at the begging of your script:

{% highlight ruby %}
require "win32ole"
WIN32OLE.codepage = WIN32OLE::CP_UTF8
{% endhighlight %}
